<?php

namespace App\Http\Controllers;

use App\Models\Test;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;

class TestController extends Controller
{
    public function index()
    {
        //
    }

    public function create()
    {
        $data = new Test();
        return view(substr(\Request::segment(1), 0, -1).'.create', compact('data'));
    }

    public function store(Request $request)
    {
        $values = Arr::except($request->all(), ['_token', 'photo', 'data_id', 'photos']);
        Test::updateOrCreate(['id' => $request->get('data_id')],$values);
        return back();
    }

    public function show(Test $test)
    {
        //
    }

    public function edit(Test $test)
    {
        $data = $test;
        return view(substr(\Request::segment(1), 0, -1) . '.create', compact('data'));
    }

    public function update(Request $request, Test $test)
    {
        //
    }

    public function destroy(Test $test)
    {
        $test->delete();
        return back();
    }
}
