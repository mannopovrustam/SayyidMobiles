<?php

namespace Modules\Stock\Http\Controllers;

use App\Models\User;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Arr;
use Modules\Stock\Entities\Stock;

class StockController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        return view('stock::index', ['data_id' => null]);
    }

    public function create()
    {
        return view('stock::create');
    }

    public function store(Request $request)
    {
        $values = Arr::except($request->all(), 'data_id');
        $values['second_currency_id'] = implode('|', $request->second_currency_id);
        $values['user_id'] = implode('|', $request->user_id);

        $data = Stock::updateOrCreate(['id' => $request->data_id], $values);
        User::find($data->user_id)->update(['stock_id' => $data->id]);

        return back();
    }

    public function show($id)
    {
        $data = Stock::find($id);
        return view('stock::show', ['data' => $data]);
    }

    public function edit($id)
    {
        return view('stock::index', ['data_id' => $id]);
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id)
    {
        //
    }
}
