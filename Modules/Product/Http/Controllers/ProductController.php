<?php

namespace Modules\Product\Http\Controllers;

use Modules\Mark\Entities\Brand;
use Modules\Product\Entities\Product;
use Modules\Product\Exports\ProductExport;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Routing\Controller;
use Modules\Stock\Entities\Stock;
use Modules\Stock\Entities\StockMark;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index()
    {
        $stock_id = session()->get('stock');
        return view('product::index', ['stock_id' => $stock_id]);
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        return view('product::create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {
        //
    }

    public function export()
    {
        $stock_id = \request()->get('stock_id');
        $brand = \request()->get('brand');
        $name = \request()->get('name');
        $start = \request()->get('start');
        $end = \request()->get('end');
        $residue = \request()->get('residue');

        session()->put('stock_id', $stock_id);
        session()->put('brand', $brand);
        session()->put('name', $name);
        session()->put('start', $start);
        session()->put('end', $end);
        session()->put('residue', $residue);

        return Excel::download(new ProductExport, 'product.xlsx');
    }
    public function show($id)
    {
        return view('product::show');
    }


    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        return view('product::edit');
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
