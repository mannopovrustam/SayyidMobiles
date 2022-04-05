@extends('layouts.app')

@section('content')

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-flex align-items-center justify-content-between">
                    <h4 class="mb-0">Ombor <u>{{ $data->name }}</u></h4>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Склад</h4>
                        <div class="table-responsive">
                            <table class="table table-sm table-hover table-bordered table-striped table-nowrap align-middle">
                                <thead>
                                <tr>
                                    <th>Model</th>
                                    <th>Ombor narxi</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach(\Modules\Mark\Entities\Mark::all() as $key=>$mark)
                                    <?php
                                        $sm = \Modules\Stock\Entities\StockMark::where([['mark_id', $mark->id],['stock_id',$data->id]])->first()
                                    ?>
                                        <tr>
                                            <td>{{ $mark->name }}</td>
                                            <td>
                                                <form action="/stock_marks" method="post" class="d-flex">
                                                    @csrf
                                                    <input type="hidden" name="data_id" value="{{ $sm ? $sm->id : null }}">
                                                    <input type="hidden" name="price_type_id" value="{{ $data->price_type_id }}">
                                                    <input type="hidden" name="stock_id" value="{{ $data->id }}">
                                                    <input type="hidden" name="main_currency_id" value="{{ $data->main_currency_id }}">
                                                    <input type="hidden" name="mark_id" value="{{ $mark->id }}">
                                                    <input type="text" name="price" class="form-control form-control-sm" value="{{ $sm ? $sm->price : null}}" autocomplete="off">
                                                    <button class="btn btn-primary"><i class="fa fa-save"></i></button>
                                                </form>
                                            </td>
                                        </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end col -->
        </div> <!-- end row -->
    </div>

@endsection
