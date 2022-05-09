<?php

namespace Modules\Invoice\Http\Controllers;

use App\Models\User;
use Modules\Currency\Entities\Sum;
use function GuzzleHttp\Promise\all;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;
use Modules\Client\Entities\ClientOperation;
use Modules\Currency\Entities\Currency;
use Modules\Invoice\Entities\Expense;
use Modules\Invoice\Entities\Invoice;
use Modules\Product\Entities\Product;
use Modules\Product\Entities\Shipment;
use Modules\Stock\Entities\Stock;
use Modules\Stock\Entities\StockOperation;

class InvoiceController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {

        switch (\request()->get('type')){
            case 'cash': $type = 1; break;
            case 'loan': $type = 2; break;
            case 'installment': $type = 3; break;
            case 'income': $type = 4; break;
        }

//        $data = Invoice::orderBy('created_at', 'desc')->where([['stock_id', session()->get('stock')],['type',$type]])->get();
        $data = Invoice::orderBy('created_at', 'desc')->where('type',$type)->get();
        return view('invoice::index', ['data' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        return view('invoice::create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {

//        foreach (Product::all() as $item){
//            $item->update(['stock_id'=>15]);
//        }

        if ($request->stock_id){
            session()->put('stock',$request->stock_id);
        }

//        $request->validate([
//            'note' => 'required'
//        ]);

        $stock = Stock::find(session()->get('stock'));
        foreach (explode("|", Stock::find(session()->get('stock'))->second_currency_id) as $second_currency_rate_for){
            $second_currency_rate[] = \currency($second_currency_rate_for)->rate;
            $second_currency_pay[] = 0;
        }

        $invoice['sum_id'] = null;
        if (isset($request->data_id)){
            $invoice['sum_id'] = Invoice::find($request->data_id)->sum_id;
        }

        $sum = Sum::updateOrCreate(['id' => $invoice['sum_id']],[
            "sum_currency_id" => $stock->main_currency_id,
            "sum_currency_pay" => 0,
            "sum_currency_pay_get" => 0,
            "main_currency_id" => $stock->main_currency_id,
            "main_currency_rate" => \currency($stock->main_currency_id)->rate,
            "main_currency_pay" => 0,
            "second_currency_id" => Stock::find(session()->get('stock'))->second_currency_id,
            "second_currency_rate" => implode("|",$second_currency_rate),
            "second_currency_pay" => implode("|",$second_currency_pay),
        ]);

        $lastInvoice = isset(Invoice::orderBy('created_at', 'desc')->first()->name) ? Invoice::orderBy('created_at', 'desc')->first()->name : 'AA-0000000';
        $newInvoice = $this->generateInvoice($lastInvoice);

        $invoice = Invoice::updateOrCreate(['id' => $request['data_id']],[
            'name' => $request->get('invoice', $newInvoice),
            'type' => $request->type,
            'stock_id' => session()->get('stock'),
            'client_id' => $request->client_id,
            'date' => $request->date,
            "sum_id" => $sum->id,
        ]);

        foreach (Shipment::where('invoice_id', $invoice->id)->get() as $ship){ Product::where('shipment_id', $ship->id)->delete(); }
        foreach (Expense::where('invoice_id', $invoice->id)->get() as $exp){ Sum::find($exp->sum_id)->delete(); }

        Shipment::where('invoice_id', $invoice->id)->delete();
        Expense::where('invoice_id', $invoice->id)->delete();

        $costs = 0; $prices = 0;
        if($request->get('note')){
            foreach ($request->get('note') as $key=>$item) {

                $data = Shipment::create([
                    'invoice_id' => $invoice->id,
                    'client_id' => $request->client_id,
                    'mark_id' => $request->mark_id[$key],
                    'quantity' => $request->quantity[$key],
                    'price' => $request->price[$key],
                    'cost' => $request->summ_single[$key],
                    'note' => $request->note[$key],
                ]);


                for ($i = 0; $i < $data->quantity; $i++) {
                    Product::create([
                        'stock_acc_id' => $request->stock_acc_id,
                        'stock_id' => $request->get('stock_id', $request->stock_acc_id),
                        'user_id' => auth()->id(),
                        'invoice_id' => $invoice->id,
                        'shipment_id' => $data->id,
                        'mark_id' => $data->mark_id,
                        'imei' => isset($request->imei[$key][$i]) ? $request->imei[$key][$i] : 'Код-'.Str::random(4).time(),
                        'price' => $request->price[$key],
                        'expense' => (float)$request->x_summ[$key]/$data->quantity,
                        'cost' => $request->summ_single[$key]
                    ]);
                    $costs += $request->summ_single[$key];
                    $prices += $request->price[$key];
                }
            }
            $sum->update(['sum_currency_pay' => $prices]);
        }

        if ($request->get('x_note')){
            foreach ($request->get('x_note') as $key=>$item) {
                $cost = 0; $price = [];
                switch ($request->x_type[$key]){
                    case 1:
                        $cost = $request->x_price[$key];
                        break;
                    case 2:
                        $cost = $request->x_price[$key]*count($request->x_mark[$key]);
                        break;
                    case 3:
                        foreach ($request->x_mark[$key] as $m_x){
                            $cost +=
                                $request->price[$m_x]*$request->quantity[$m_x]*
                                $request->x_price[$key]/100/$request->quantity[$m_x];
                        }
                        break;
                    case 4:
                        foreach ($request->x_mark[$key] as $m_x){
                            $price[] = $request->price[$m_x]*$request->quantity[$m_x];
                        }

                        foreach ($request->x_mark[$key] as $m_x) {
                            $foiz = ($request->price[$m_x] * $request->quantity[$m_x]) / array_sum($price);
                            $cost += $foiz * $request->x_price[$key] / $request->quantity[$m_x];
                        }
                        break;
                }
                $sum_expance = Sum::create([
                    "sum_currency_id" => $stock->main_currency_id,
                    "sum_currency_pay" => $cost,
                    "sum_currency_pay_get" => 0,
                    "main_currency_id" => $stock->main_currency_id,
                    "main_currency_rate" => \currency($stock->main_currency_id)->rate,
                    "main_currency_pay" => $cost,
                    "second_currency_id" => Stock::find(session()->get('stock'))->second_currency_id,
                    "second_currency_rate" => implode("|",$second_currency_rate),
                    "second_currency_pay" => implode("|",$second_currency_pay),
                ]);
                Expense::create([
                    'invoice_id' => $invoice->id,
                    'name' => $request->x_name[$key],
                    'type' => $request->x_type[$key],
                    'note' => $request->x_note[$key],
                    'mark_id' => implode(',', $request->x_mark[$key]),
                    "main_currency_id" => $stock->main_currency_id,
                    "main_currency_rate" => \currency($stock->main_currency_id)->rate,
                    'main_currency_pay' => $request->x_price[$key],
                    'client_id' => ($request->x_client[$key] ? $request->x_client[$key] : null),
                    'stock_id' => ($request->x_client[$key] ? null : session()->get('stock')),
                    'sum_id' => $sum_expance->id,
                ]);

                if($request->x_client[$key]){
                    ClientOperation::updateOrCreate(['invoice_id' => $invoice->id, 'operation' => 'Xarajat ' . $request->x_name[$key] .' '. $request->x_type[$key] .' '. $request->x_note[$key]], [
                        'invoice_id' => $invoice->id,
                        'client_id' => $request->x_client[$key],
                        'date' => $invoice->date,
                        'operation' => 'Xarajat Nomi:' . $request->x_name[$key] .', Turi:'. $request->x_type[$key] .', Izoh:'. $request->x_note[$key],
                        'type' => -1,
                        "sum_currency_id" => $stock->main_currency_id,
                        "sum_id" => $sum_expance->id,
                    ]);
                }else{
                    StockOperation::updateOrCreate(['invoice_id' => $invoice->id, 'operation' => 'Xarajat ' . $request->x_name[$key] .' '. $request->x_type[$key] .' '. $request->x_note[$key]], [
                        'user_id' => auth()->id(),
                        'invoice_id' => $invoice->id,
                        'stock_id' => $stock->id,
                        'client_id' => $invoice->client_id,
                        'date' => $invoice->date,
                        'operation' => 'Xarajat ' . $request->x_name[$key] .' '. $request->x_type[$key] .' '. $request->x_note[$key],
                        'type' => 1,
                        "sum_currency_id" => $stock->main_currency_id,
                        "sum_id" => $sum->id,
                    ]);
                }
            }
        }

        ClientOperation::updateOrCreate(['invoice_id' => $invoice->id, 'operation' => 'Mahsulot(kirim)'], [
            'invoice_id' => $invoice->id,
            'client_id' => $invoice->client_id,
            'date' => $invoice->date,
            'operation' => 'Mahsulot(kirim)',
            'type' => 1,
            "sum_currency_id" => $stock->main_currency_id,
            "sum_id" => $sum->id,
        ]);

        StockOperation::updateOrCreate(['invoice_id' => $invoice->id, 'operation' => 'Mahsulot(kirim)'], [
            'user_id' => auth()->id(),
            'invoice_id' => $invoice->id,
            'stock_id' => $stock->id,
            'client_id' => $invoice->client_id,
            'date' => $invoice->date,
            'operation' => 'Mahsulot(kirim)',
            'type' => 1,
            "sum_currency_id" => $stock->main_currency_id,
            "sum_id" => $sum->id,
        ]);

        session()->forget('cart');
        session()->forget('imei');
        session()->forget('old_invoice');
//        session()->put('data_id', $invoice->id);

//        return redirect('/trade/income?data_id='.$invoice->id);
        return redirect('/trade/income');
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function show($id)
    {
        session()->forget('cart');
        session()->forget('imei');
        session()->forget('old_invoice');
        session()->forget('data_id');
        session()->put('data_id', $id);

        switch (Invoice::find($id)->type){
            case 1: $type = 'cash'; break;
            case 2: $type = 'loan'; break;
            case 3: $type = 'installment'; break;
            case 4: $type = 'income'; break;
        }

        return redirect('/trade/'.$type.'?data_id='.$id);
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        return view('invoice::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy($id)
    {
        //
    }

    public function generateInvoice($formerReference = "AA-0000000")
    {
//        if (isset(explode("-", $formerReference)[1])){
            $parts = explode("-", $formerReference);
            $numbers = $parts[1];
            $letters = $parts[0];

            if($numbers == "9999999"){
                $nextLetters = ++$letters;
                $nextNumbers = 1;
            } else {
                $nextLetters = $letters;
                $nextNumbers = ++$numbers;
            }

            $nextReference = $nextLetters."-".sprintf('%07d', $nextNumbers);

            return $nextReference;
//        }
    }
}
