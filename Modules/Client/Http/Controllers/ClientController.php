<?php

namespace Modules\Client\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Arr;
use Modules\Client\Entities\Client;

class ClientController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        return view('client::index');
    }

    public function create()
    {
        return view('client::index');
    }

    public function store(Request $request)
    {
        if(\Illuminate\Support\Facades\Request::has('second_currency_id')){
            Client::updateOrCreate(['id'=>$request->get('data_id')],[
                "name" => $request->name,
                "phone" => $request->phone,
                "kod" => $request->kod,
                "region" => $request->region,
                "address" => $request->address,
                "main_currency_id" => $request->main_currency_id,
                "second_currency_id" => implode('|', $request->second_currency_id),
                "stock_id" => $request->stock_id,
                "description" => $request->description,

            ]);
        } else {
            Client::updateOrCreate(['id'=>$request->get('data_id')],[
                "name" => $request->name,
                "phone" => $request->phone,
                "kod" => $request->kod,
                "region" => $request->region,
                "address" => $request->address,
                "main_currency_id" => $request->main_currency_id,
                "stock_id" => $request->stock_id,
                "description" => $request->description,

            ]);
        }

        return back();
    }

    public function show($id)
    {
        $data = Client::find($id);
        return view('client::show', ['data' => $data]);
    }

    public function edit($id)
    {
        $data = Client::find($id);
        return view('client::create', compact('data'));
    }

    public function update(Request $request, $id)
    {


    }


    public function destroy($id)
    {
        Client::where('id', $id)->delete();

        return back();
    }
}
