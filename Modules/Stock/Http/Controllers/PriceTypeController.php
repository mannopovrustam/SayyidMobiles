<?php

namespace Modules\Stock\Http\Controllers;

use App\Imports\StockMarksImport;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Arr;
use Maatwebsite\Excel\Facades\Excel;
use Modules\Mark\Entities\Mark;
use Modules\Stock\Entities\PriceType;

class PriceTypeController extends Controller
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
        return view('stock::price_type.create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {
        $values = Arr::except($request->all(), ['data_id']);
        PriceType::updateOrCreate(['id' => $request->data_id], $values);
        return back();
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function show($id)
    {
        $data = PriceType::find($id);
        $marks = Mark::all();
        return view('stock::price_type.show', ['data' => $data, 'marks' => $marks]);
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
        PriceType::where('id', $id)->delete();
        return back();
    }
}
