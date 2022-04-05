<?php

namespace Modules\Stock\Http\Controllers;

use Modules\Stock\Imports\StockMarksImport;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Modules\Product\Entities\Product;
use Modules\Stock\Entities\StockMark;

class StockMarkController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index()
    {
        return view('stock::index');
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
        if ($request->hasFile('excel')){
            Excel::import(new StockMarksImport, $request->excel);
        }else{
            StockMark::updateOrCreate(['id' => $request->data_id], [
                'price_type_id' => $request->price_type_id,
                'currency_id' => $request->main_currency_id,
                'mark_id' => $request->mark_id,
                'price' => $request->price,
                'bonus' => $request->get('bonus', null)
            ]);
            Product::where([['mark_id', $request->mark_id], ['order_id', null]])->update([
                'bonus' => $request->bonus
            ]);
        }
        return back();
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function show($id)
    {
        return view('stock::show');
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
