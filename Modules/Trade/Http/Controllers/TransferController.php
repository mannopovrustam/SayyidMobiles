<?php

namespace Modules\Trade\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Str;
use Modules\Product\Entities\Product;
use Modules\Trade\Entities\Transfer;
use Maatwebsite\Excel\Facades\Excel;
use Modules\Trade\Exports\TransferExport;

class TransferController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $data = \Modules\Trade\Entities\Transfer::orderBy('created_at', 'desc')->where('stock_from', session()->get('stock'))->get();
        return view('trade::transfer.data', ['data' => $data]);
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
        $products = '';

        foreach ($request->mark_id as $key => $mark){
            if ($key !== array_key_first($request->mark_id)) {
                $products .= '|';
            }
            foreach ($request->products[$mark] as $i => $k){
                if ($i === array_key_first($request->products[$mark])) {
                    $products .= $request->products[$mark][$i];
                }else{
                    $products .= ','. $request->products[$mark][$i];
                }
            }
        }

        $data = Transfer::updateOrCreate(['id' => $request->data_id], [
            'date' => $request->date,
            'name' => $request->get('name', Str::random(10)),
            'stock_from' => $request->stock_from,
            'stock_to' => $request->stock_to,
            'marks' => implode(',', $request->mark_id),
            'products' => $products,
            'note' => $request->note,
            'status' => $request->get('status', 0),
        ]);

        if ($data->status == 1){
            foreach (explode(",", $products) as $product){
                Product::find($product)->update(['stock_id' => $data->stock_to]);
            }
        }else{
            foreach (explode(",", $products) as $product){
                Product::find($product)->update(['stock_id' => $data->stock_from]);
            }
        }

        session()->forget('cart');
        session()->forget('imei');
        session()->forget('data_id');
        session()->put('data_id', $data->id);

        return redirect('/acceptance/'.$data->id);
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
        session()->forget('data_id');
        session()->put('data_id', $id);
        return redirect('/transfer/?data_id='.$id);
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

    public function export($data_id){
            $id = session()->get('id');
            $id['id'] = $data_id;
            session()->put('id', $id);
        return Excel::download(new TransferExport, 'transfer.xlsx');
    }
}
