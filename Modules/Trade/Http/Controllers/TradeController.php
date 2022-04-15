<?php

namespace Modules\Trade\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Modules\Stock\Exports\CashExport;


class TradeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        return view('trade::index');
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        return view('trade::create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {
        dd('asd');
        // if ($request->hasFile('excel')){
        //     Excel::import(new StockMarksImport, $request->excel);
        // }else{
        //     StockMark::updateOrCreate(['id' => $request->data_id], [
        //         'price_type_id' => $request->price_type_id,
        //         'currency_id' => $request->main_currency_id,
        //         'mark_id' => $request->mark_id,
        //         'price' => $request->price,
        //         'bonus' => $request->get('bonus', null)
        //     ]);
        //     Product::where([['mark_id', $request->mark_id], ['order_id', null]])->update([
        //         'bonus' => $request->bonus
        //     ]);
        // }
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function show($id)
    {

        session()->forget('cart');
        session()->forget('product');
        session()->forget('imei');
        session()->forget('old_invoice');
        session()->forget('data_id');

        return redirect($id.'?data_id='. \request()->data_id);
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        return view('trade::edit');
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
