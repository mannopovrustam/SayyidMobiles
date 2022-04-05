<?php

namespace Modules\Client\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;

use Illuminate\Support\Arr;
use Modules\Client\Entities\ClientOperation;
use Modules\Client\Entities\ClientPayment;
use Modules\Currency\Entities\Currency;
use Modules\Currency\Entities\Sum;
use Modules\Stock\Entities\Stock;
use Modules\Stock\Entities\StockOperation;

class ClientPaymentController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index()
    {
        return view('client::index');
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        return view('client::create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {
        $stock = Stock::find(auth()->user()->stock_id);

        $sec_cur_rate = [];
        foreach (explode("|", $request->second_currency_id) as $sec_cur_id){
            $rate = Currency::find($sec_cur_id)->rate;
            array_push($sec_cur_rate, $rate);
        }

        $sum_currency_pay_get[] = change_currency($request->main_currency_pay, $request->main_currency_id, $request->main_currency_id);
        foreach (explode("|", $request->second_currency_id) as $key => $item){
            $sum_currency_pay_get[] = change_currency($request->second_currency_pay[$key], $item, $request->main_currency_id);
        }

        $clientPayment = ClientPayment::find($request->data_id) ? ClientPayment::find($request->data_id)->sum_id : null;

        $sum = Sum::updateOrCreate(['id' => $clientPayment],[
            "sum_currency_id" => $request->sum_currency_id,
            "sum_currency_pay" => $request->sum,
            "sum_currency_pay_get" => array_sum($sum_currency_pay_get),
            "main_currency_id" => $request->main_currency_id,
            "main_currency_pay" => $request->main_currency_pay,
            "main_currency_rate" => Currency::find($request->main_currency_id)->rate,
            "second_currency_id" => $request->second_currency_id,
            "second_currency_pay" => implode('|', $request->second_currency_pay),
            "second_currency_rate" => implode('|', $sec_cur_rate),
        ]);

        $client_payment = ClientPayment::updateOrCreate(['id' => $request->data_id],[
            "stock_id" => $request->stock_id,
            "client_id" => $request->client_id,
            "date" => $request->date,
            "currency_id" => $request->currency_id,
            "sum_id" => $sum->id,
            "type" => $request->type,
            "note" => $request->note,
        ]);


        ClientOperation::updateOrCreate(['client_payment_id' => $client_payment->id], [
            'invoice_id' => null,
            'client_id' => $client_payment->client_id,
            'date' => $client_payment->date,
            'operation' => $request->type == 1 ? 'Pul(kirim)' : 'Pul(chiqim)',
            'type' => (int)$request->type,
            'sum_currency_id' => $request->sum_currency_id,
            'sum_id' => $sum->id,
        ]);

        StockOperation::updateOrCreate(['client_payment_id' => $client_payment->id], [
            'client_payment_id' => $client_payment->id,
            'user_id' => auth()->id(),
            'stock_id' => $stock->id,
            'client_id' => $client_payment->client_id,
            'date' => $client_payment->date,
            'operation' => $request->type == 1 ? 'Pul(kirim)' : 'Pul(chiqim)',
            'type' => $request->type,
            'sum_currency_id' => $request->sum_currency_id,
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
        return view('client::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        return view('client::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request, $id)
    {
        ClientPayment::find($id)->update($request->all());
        return back();
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy($id)
    {
        ClientPayment::find($id)->delete();
        return back();
    }
}
