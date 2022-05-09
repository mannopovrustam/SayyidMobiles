@extends('layouts.app')

@section('content')

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-flex align-items-center justify-content-between">
                    <h4 class="mb-0">Narx turi nomi <u>{{ $data->name }}</u></h4>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header">
                        <form action="/stock_marks" method="post" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="price_type_id" value="{{ $data->id }}">
                            <input type="hidden" name="main_currency_id" value="{{ \Modules\Stock\Entities\Stock::find($stock_id)->main_currency_id }}">

                            <div class="row">
                                <div class="col-md-2">
                                    <div class="mb-3">
                                        <label class="col-form-label-sm" for="excel">Excel Yuklash</label>
                                        <input type="file" class="form-control form-control-sm" name="excel" id="excel" required>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="mb-3 position-relative">
                                        <label class="col-form-label-sm" for="validationCustom01" style="visibility: hidden"></label>
                                        <br>
                                        <input class="btn-sm btn-primary" type="submit" value="Mahsulot Narxi o'zgartirish">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title">Narx turi</h4>
                        @livewire('stock::price-type', ['id' => $data->id])
                        {{--<div class="table-responsive">--}}
                            {{--<table class="table table-sm table-hover table-bordered table-striped table-nowrap align-middle">--}}
                                {{--<thead>--}}
                                {{--<tr>--}}
                                    {{--<th>Mahsulot turi</th>--}}
                                    {{--<th>Brend</th>--}}
                                    {{--<th>Mahsulot</th>--}}
                                    {{--<th>Hozirgi narx</th>--}}
                                    {{--<th>Qoldiq</th>--}}
                                    {{--<th>Ombor valyutasi</th>--}}
                                    {{--<th>Savdo</th>--}}
                                    {{--<th>Narx</th>--}}
                                    {{--<th>Bonus</th>--}}
                                {{--</tr>--}}
                                {{--</thead>--}}
                                {{--<tbody>--}}
                                {{--@foreach($marks as $mark)--}}
                                    {{--<?php--}}
                                    {{--$sm = \Modules\Stock\Entities\StockMark::where([['mark_id', $mark->id], ['price_type_id', $data->id]])->first();--}}
                                    {{--$average = 0;--}}

                                    {{--$cost = \Modules\Product\Entities\Product::where([['stock_id', $stock_id], ['mark_id', $mark->id], ['order_id', null], ['cost', '!=', null]])->get('cost');--}}
                                    {{--if(!$cost->isEmpty()){--}}
                                        {{--$sumArray = [];--}}
                                        {{--foreach ($cost as $subArray) {--}}
                                            {{--$sumArray[] = (double)$subArray->cost;--}}
                                        {{--}--}}
                                        {{--$average = array_sum($sumArray)/count($sumArray);--}}
                                    {{--}--}}
                                    {{--?>--}}
                                    {{--<form action="/stock_marks" method="post" class="d-flex">--}}
                                        {{--@csrf--}}
                                        {{--<input type="hidden" name="data_id" value="{{ $sm ? $sm->id : null }}">--}}
                                        {{--<input type="hidden" name="price_type_id" value="{{ $data->id }}">--}}
                                        {{--<input type="hidden" name="mark_id" value="{{ $mark->id }}">--}}
                                        {{--<input type="hidden" name="main_currency_id" value="{{ \Modules\Stock\Entities\Stock::find($stock_id)->main_currency_id }}">--}}
                                        {{--<tr>--}}
                                            {{--<td>{{ \Modules\Mark\Entities\Type::find($mark->type_id) ? \Modules\Mark\Entities\Type::find($mark->type_id)->name : null }}</td>--}}
                                            {{--<td>{{ \Modules\Mark\Entities\Brand::find($mark->brand_id)->name }}</td>--}}
                                            {{--<td>{{ $mark->name }}</td>--}}
                                            {{--<td>{{ $sm ? $sm->price : null}}</td>--}}
                                            {{--<td>{{ \Modules\Product\Entities\Product::where('mark_id', $mark->id)->count() }}</td>--}}
                                            {{--<td>{{ \Modules\Currency\Entities\Currency::find(\Modules\Stock\Entities\Stock::find($stock_id)->main_currency_id)->currency }}</td>--}}
                                            {{--<td>{{ \Modules\Product\Entities\Product::where('mark_id', $mark->id)->where('order_id', null)->count() }}</td>--}}
                                            {{--<td>--}}
                                                {{--<input type="text" name="price" value="{{ $sm ? $sm->price : null}}" style="width: 50px;">--}}
                                                {{--<input type="hidden" name="currency_id" value="{{ \Modules\Stock\Entities\Stock::find($stock_id)->main_currency_id }}">--}}
                                            {{--</td>--}}
                                            {{--<td>--}}
                                                {{--<input type="text" name="bonus" value="{{ $sm ? $sm->bonus : null}}" style="width: 50px;">--}}
                                            {{--</td>--}}
                                            {{--<td>{{ round($average, 2) }}</td>--}}
                                            {{--<td>--}}
                                                {{--<button class="btn btn-primary"><i class="fa fa-save"></i></button>--}}
                                            {{--</td>--}}
                                        {{--</tr>--}}

                                    {{--</form>--}}
                                {{--@endforeach--}}
                                {{--</tbody>--}}
                            {{--</table>--}}
                        {{--</div>--}}
                        {{--{{ $marks->links() }}--}}
                    </div>
                </div>
            </div>
            <!-- end col -->
        </div> <!-- end row -->
    </div>

@endsection
