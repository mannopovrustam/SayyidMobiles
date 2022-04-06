<?php

namespace Modules\Invoice\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;
use Modules\Client\Entities\ClientOperation;
use Modules\Currency\Entities\Currency;
use Modules\Currency\Entities\Sum;
use Modules\Invoice\Entities\Invoice;
use Modules\Invoice\Entities\Order;
use Modules\Invoice\Entities\OrderDetail;
use Modules\Product\Entities\Product;
use Modules\Stock\Entities\Cashbox;
use Modules\Stock\Entities\Stock;
use Modules\Stock\Entities\StockOperation;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index()
    {
        return view('invoice::index');
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
        $stock = Stock::find((int)auth()->user()->stock_id);
        foreach ($request->second_currency_id as $second_currency_rate_for){
            $second_currency_rate[] = currency($second_currency_rate_for)->rate;
        }
        $invoice['sum_id'] = null;
        if (isset($request->data_id)){
            $invoice['sum_id'] = Invoice::find($request->data_id)->sum_id;
        }

        $sum_currency_pay_get = [];
        $sum_currency_pay_get[] = change_currency($request->main_currency_pay, $request->main_currency_id, $request->main_currency_id);
        foreach ($request->second_currency_id as $key => $item){
            $sum_currency_pay_get[] = change_currency($request->second_currency_pay[$key], $item, $request->main_currency_id);
        }

        $sum = Sum::updateOrCreate(['id' => $invoice['sum_id']],[
            "sum_currency_id" => $request->main_currency_id,
            "sum_currency_pay" => $request->sum_currency_pay,
            "sum_currency_pay_get" => array_sum($sum_currency_pay_get),
            "sum_currency_pay_will" => $request->price_agreement,
            "discount" => $request->discount,
            "main_currency_id" => $stock->main_currency_id,
            "main_currency_rate" => \currency($stock->main_currency_id)->rate,
            "main_currency_pay" => $request->main_currency_pay,
            "second_currency_id" => implode("|", $request->second_currency_id),
            "second_currency_rate" => implode("|",$second_currency_rate),
            "second_currency_pay" => implode("|", $request->second_currency_pay),
        ]);

        $values = Arr::except($request->all(), ['date_agreement_month','every_days']);

        $invoice = Invoice::updateOrCreate(['id' => $request['data_id']],[
            'name' => $request->get('invoice', Str::random(10)),
            'type' => $request->type,
            'stock_id' => $request->stock_id,
            'client_id' => $request->client_id,
            'date' => $request->date,
            'sum_id' => $sum->id,
        ]);

        $data = Order::updateOrCreate(['id' => $request['order_id']],[
            'client_id' => $request->client_id,
            'stock_id' => $stock->id,
            'order_type' => $request->type,
            'invoice_id' => $invoice->id,
            'quantity' => $request->quantity,
            'amount' => $request->amount,
            'discount' => $request->discount,
            'sum_id' => $sum->id,
        ]);

        Product::where('order_id', $data->id)->update(['invoice_id' => null,'order_id' => null,'sell_price' => null]);

        $costs = 0;
        foreach ($values['products'] as $key => $products){
            foreach ($products as $product){
                $stock_mark = \Modules\Stock\Entities\StockMark::where([['mark_id', $key], ['price_type_id', (int)$stock->price_type_id]])->first();
                $bonus = 0;
                if ((double)$stock_mark['bonus'] > 0){
                    $bonus = (double)$stock_mark['bonus'];
                }
                Product::find($product)->update([
                    'invoice_id' => $invoice->id,
                    'order_id' => $data->id,
                    'sell_price' => $values['price'][$key],
                    'bonus' => $bonus,
                ]);
                $costs += $values['price'][$key];
            }
        }

        OrderDetail::updateOrCreate(['order_id' => $data->id],[
            'order_id' => $data->id,
            'order_type' => $request->get('type', null),
            'client_id' => $request->get('client_id', null),
            'date_agreement' => $request->get('date_agreement', null),
            'initial_payment' => $request->get('initial_payment', null),
            'price_agreement' => $request->get('price_agreement', null),
            'monthly_pay' => $request->get('monthly_pay', null),
            'date_agreement_month' => $request->get('date_agreement_month', null),
            'every_days' => $request->get('every_days', null),
        ]);

        ClientOperation::updateOrCreate(['invoice_id' => $invoice->id], [
            'invoice_id' => $invoice->id,
            'client_id' => $invoice->client_id,
            'date' => $invoice->date,
            'operation' => 'Mahsulot(chiqim)',
            'type' => -1,
            'sum_currency_id' => $request->main_currency_id,
            'sum_id' => $sum->id,
        ]);
        StockOperation::updateOrCreate(['invoice_id' => $invoice->id], [
            'user_id' => auth()->id(),
            'invoice_id' => $invoice->id,
            'stock_id' => $stock->id,
            'client_id' => $invoice->client_id,
            'date' => $invoice->date,
            'operation' => 'Mahsulot(chiqim)',
            'type' => -1,
            'sum_currency_id' => $request->main_currency_id,
            'sum_id' => $sum->id,
        ]);

        session()->forget('cart');
        session()->forget('imei');
        session()->forget('old_invoice');
        session()->put('data_id', $invoice->id);

        switch ($invoice->type){
            case 1: $type = 'cash'; break;
            case 2: $type = 'loan'; break;
            case 3: $type = 'installment'; break;
        }

        return redirect('/trade/'.$type.'?data_id='.$invoice->id);
    }

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
        }

        return redirect('/trade/'.$type);
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
}
