<?php

namespace Modules\Currency\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Arr;
use Modules\Currency\Entities\Convert;
use Modules\Currency\Entities\Sum;
use Modules\Stock\Entities\StockOperation;

class ConvertController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $data = Convert::where('stock_id', auth()->user()->stock_id)->get();
        return view('currency::convert.data', ['data' => $data, 'data_id' => null]);
    }

    public function create()
    {
        $data = new Convert();
        return view('currency::convert.create', ['data' => $data]);
    }

    public function store(Request $request)
    {
        $stock_id = auth()->user()->stock_id;

        $convert = Convert::updateOrCreate(['id' => $request->data_id], [
            'stock_id' => $stock_id,
            'currency_from' => $request->currency_from,
            'currency_to' => $request->currency_to,
            'currency' => $request->currency_rate,
            'main_currency_val' => $request->main_currency_val,
            'second_currency_val' => $request->second_currency_val,
            'note' => $request->note
        ]);
        $sum1_id = null;
        if(isset(StockOperation::where([['convert_id', $convert->id], ['type', -1]])->first()->sum_id)){
            $sum1_id = StockOperation::where([['convert_id', $convert->id], ['type', -1]])->first()->sum_id;
        }

        $sum1 = Sum::updateOrCreate(['id' => $sum1_id],[
            "sum_currency_id" => $request->currency_from,
            "sum_currency_pay" => $request->main_currency_val,
            "sum_currency_pay_get" => $request->main_currency_val,
            "main_currency_id" => $request->currency_from,
            "main_currency_pay" => $request->main_currency_val,
            "main_currency_rate" => currency($request->currency_from)->rate,
            "second_currency_id" => $request->currency_to,
            "second_currency_pay" => 0,
            "second_currency_rate" => currency($request->currency_to)->rate,
        ]);

        StockOperation::updateOrCreate(['convert_id' => $convert->id, 'type' => -1], [
            'convert_id' => $convert->id,
            'user_id' => auth()->id(),
            'stock_id' => $convert->stock_id,
            'date' => $convert->created_at,
            'operation' => 'Pul(chiqim | ayirboshlash)',
            'type' => -1,
            'sum_id' => $sum1->id,
        ]);

        $sum2_id = null;
        if(isset(StockOperation::where([['convert_id', $convert->id], ['type', 1]])->first()->sum_id)){
            $sum2_id = StockOperation::where([['convert_id', $convert->id], ['type', 1]])->first()->sum_id;
        }

        $sum2 = Sum::updateOrCreate(['id' => $sum2_id],[
            "sum_currency_id" => $request->currency_to,
            "sum_currency_pay" => change_currency($request->main_currency_val, $request->currency_from, $request->currency_to),
            "sum_currency_pay_get" => $request->second_currency_val,
            "main_currency_id" => $request->currency_to,
            "main_currency_pay" => $request->second_currency_val,
            "main_currency_rate" => currency($request->currency_to)->rate,
            "second_currency_id" => $request->currency_from,
            "second_currency_pay" => 0,
            "second_currency_rate" => currency($request->currency_from)->rate,
        ]);
        StockOperation::updateOrCreate(['convert_id' => $convert->id, 'type' => 1], [
            'convert_id' => $convert->id,
            'user_id' => auth()->id(),
            'stock_id' => $convert->stock_id,
            'date' => $convert->created_at,
            'operation' => 'Pul(kirim | ayirboshlash)',
            'type' => 1,
            'sum_id' => $sum2->id,
        ]);

        return redirect('/converts');
    }

    public function show($id)
    {
        return view('currency::show');
    }

    public function edit($id)
    {
        $data = Convert::find($id);
        return view('currency::convert.data', ['data' => $data, 'data_id' => $id]);
    }

    public function update(Request $request, $id)
    {
    }

    public function destroy($id)
    {
        //
    }
}
