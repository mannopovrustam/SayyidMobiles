<?php

namespace Modules\Stock\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Modules\Currency\Entities\Currency;
use Modules\Currency\Entities\Sum;
use Modules\Stock\Entities\Stock;
use Modules\Stock\Entities\StockOperation;
use Modules\Stock\Entities\StockPayment;
use Modules\Stock\Exports\StockPaymentExport;

class StockPaymentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        return view('stock::stockpayments.index');
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        return view('stock::create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {
        $stock = Stock::find(session()->get('stock'));

        $sum_id = StockPayment::find($request->data_id) ? StockPayment::find($request->data_id)->sum_id : null;

        foreach (explode("|", Stock::find(session()->get('stock'))->second_currency_id) as $second_currency_rate_for){
            $second_currency_rate[] = \currency($second_currency_rate_for)->rate;
            $second_currency_pay[] = 0;
        }

        $sum = Sum::updateOrCreate(['id' => $sum_id],[
            "sum_currency_id" => $request->main_currency_id,
            "sum_currency_pay" => $request->main_currency_pay,
            "sum_currency_pay_get" => $request->main_currency_pay,
            "main_currency_id" => $request->main_currency_id,
            "main_currency_pay" => $request->main_currency_pay,
            "main_currency_rate" => Currency::find($request->main_currency_id)->rate,
            "second_currency_id" => Stock::find(session()->get('stock'))->second_currency_id,
            "second_currency_pay" => implode("|",$second_currency_pay),
            "second_currency_rate" => implode("|",$second_currency_rate),
        ]);

        $data = StockPayment::updateOrCreate(['id' => $request->data_id],[
            "stock_from" => $stock->id,
            "stock_to" => $request->stock_to,
            "sum_id" => $sum->id,
            "date" => $request->date,
            "note" => $request->note,
            "type" => $request->type,
            "status" => $request->get('status', 0)
        ]);

        StockOperation::updateOrCreate(['stock_payment_id' => $data->id, 'stock_id' => session()->get('stock')], [
            'user_id' => auth()->id(),
            'stock_id' => session()->get('stock'),
            'stock_payment_id' => $data->id,
            'date' => $request->date,
            'operation' => $request->type == 1 ? 'Pul(kirim | Ombor)' : 'Pul(chiqim | Ombor)',
            'type' => (int)$request->type,
            'sum_id' => $sum->id,
        ]);

        StockOperation::updateOrCreate(['stock_payment_id' => $data->id, 'stock_id' => $request->stock_to], [
            'user_id' => auth()->id(),
            'stock_id' => $request->stock_to,
            'stock_payment_id' => $data->id,
            'date' => $request->date,
            'operation' => $request->type == -1 ? 'Pul(kirim | Ombor)' : 'Pul(chiqim | Ombor)',
            'type' => -(int)$request->type,
            'sum_id' => $sum->id,
        ]);

        return back();
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function show($id)
    {
        session()->put('stock_id', $id);
        return Excel::download(new StockPaymentExport, 'Ombor ' .  Stock::find($id)->name .' '. now()->format('d.m.Y: H:i:s') . ' to\'lov.xlsx');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        return view('stock::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request, $id)
    {
        StockPayment::find($id)->update($request->all());
        return back();
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy($id)
    {
        StockPayment::find($id)->delete();
        return back();
    }
}
