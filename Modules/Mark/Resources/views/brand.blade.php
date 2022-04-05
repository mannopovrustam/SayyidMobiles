@extends('layouts.app')

@section('css')
    <!-- DataTables -->
    <link href="{{ asset('assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css') }}" rel="stylesheet"
          type="text/css"/>
    <link href="{{ asset('assets/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css') }}" rel="stylesheet"
          type="text/css"/>
    <!-- Responsive datatable examples -->
    <link href="{{ asset('assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css') }}"
          rel="stylesheet" type="text/css"/>
@endsection

@section('content')
    
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-flex align-items-center justify-content-between">
                    <h4 class="mb-0">Характеристики</h4>
                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">Тип</a></li>
                            <li class="breadcrumb-item active">Бренд</li>
                            <li class="breadcrumb-item active">Цвет</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-6">
                <div class="card">
                    <div class="card-body">
                        <form action="/types" method="post" class="needs-validation" novalidate>
                            @csrf
                            <div class="row">
                                <div class="col-md-6 mb-3 position-relative">
                                    <label class="col-form-label-sm" for="validationCustom01">Тип</label>
                                    <input type="text" class="form-control form-control-sm" name="name" id="validationCustom01"
                                           placeholder="Название " required>
                                </div>
                            </div>
                            <button class="btn btn-primary mb-3" type="submit">Добавить тип</button>
                        </form>
                    </div>
                </div>
                <!-- end card -->
            </div>
            <!-- end col -->
            
            <div class="col-xl-6">
                <div class="card">
                    <div class="card-body">
                        <form action="/brands" method="post" class="needs-validation" novalidate>
                            @csrf
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3 position-relative">
                                        <label class="col-form-label-sm" for="validationTooltip01">Название бренда</label>
                                        <input type="text" name="name" class="form-control form-control-sm" id="validationTooltip01"
                                               placeholder="Название бренда" required>
                                        <div class="valid-tooltip">
                                            Looks good!
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button class="btn btn-primary" type="submit">Добавить бренд</button>
                        </form>
                    </div>
                </div>
                <!-- end card -->
            </div>
            <!-- end col -->
        </div>
        <div class="row">
            <div class="col-xl-6">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Тип</h4>
                        <div class="table-responsive">
                            <table class="table table-sm table-hover table-bordered table-striped table-nowrap align-middle">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Название</th>
                                    <th>Действие</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach(\Modules\Mark\Entities\Type::all() as $key=>$store)
                                    <tr data-id="{{ $key+1 }}">
                                        <td data-field="id" style="width: 80px">{{ $key+1 }}</td>
                                        <td data-field="name">{{ $store->name }}</td>
                                        <td style="width: 100px">
                                            <a class="btn btn-outline-secondary btn-sm edit" data-bs-toggle="modal"
                                               data-bs-target="#typeModel{{$store->id}}" title="Edit">
                                                <i class="fas fa-pencil-alt"></i>
                                            </a>
                                            <div id="typeModel{{$store->id}}" class="modal fade" tabindex="-1" role="dialog"
                                                 aria-labelledby="myModalLabel" aria-hidden="true">
                                                
                                                <div class="modal-dialog">
                                                    <form action="/types" method="post" class="needs-validation"
                                                          novalidate>
                                                        @csrf
                                                        <input type="hidden" name="data_id" value="{{ $store->id }}">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="myModalLabel">Изменить
                                                                    тип {{ $store->name }}</h5>
                                                                <button type="button" class="btn-close"
                                                                        data-bs-dismiss="modal" aria-label="Close">
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="mb-3 position-relative">
                                                                    <label class="col-form-label-sm" for="validationTooltip01">Название типа</label>
                                                                    <input type="text" name="name" class="form-control form-control-sm" value="{{ $store->name }}" id="validationTooltip01"
                                                                           placeholder="Название магазина" required>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-light waves-effect"
                                                                        data-bs-dismiss="modal">Закрыть
                                                                </button>
                                                                <button type="submit"
                                                                        class="btn btn-primary waves-effect waves-light">
                                                                    Сохранить
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </form><!-- /.modal-content -->
                                                </div><!-- /.modal-dialog -->
                                            </div>
                                            <form action="/types/{{ $store->id }}" style="display: inline-block"
                                                  method="post">
                                                @csrf
                                                {{ method_field('delete') }}
                                                <button type="submit" onclick="return confirm('Вы точно хотите удалить {{ $store->name }}');" class="btn btn-outline-secondary btn-sm">
                                                    <i class="uil uil-trash-alt"></i>
                                                </button>
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
            <div class="col-xl-6">
                <div class="card">
                    <div class="card-body">
                        
                        <h4 class="card-title">Бренды</h4>
                        <div class="table-responsive">
                            <table class="table table-sm table-hover table-bordered table-striped table-nowrap align-middle">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Название</th>
                                    <th>Действие</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach(\Modules\Mark\Entities\Brand::all() as $key=>$value)
                                    <tr data-id="{{ $key+1 }}">
                                        <td data-field="id" style="width: 80px">{{ $key+1 }}</td>
                                        <td data-field="name">{{ $value->name }}</td>
                                        <td style="width: 100px">
                                            <a class="btn btn-outline-secondary btn-sm edit" data-bs-toggle="modal"
                                               data-bs-target="#brandModel{{$value->id}}" title="Edit">
                                                <i class="fas fa-pencil-alt"></i>
                                            </a>
                                            <div id="brandModel{{$value->id}}" class="modal fade" tabindex="-1" role="dialog"
                                                 aria-labelledby="myModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <form action="/brands" method="post" class="needs-validation"
                                                          novalidate>
                                                        @csrf
                                                        <input type="hidden" name="data_id" value="{{ $value->id }}">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="myModalLabel">Изменить
                                                                    бренд {{ $value->name }}</h5>
                                                                <button type="button" class="btn-close"
                                                                        data-bs-dismiss="modal" aria-label="Close">
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="mb-3 position-relative">
                                                                    <label class="col-form-label-sm" for="validationTooltip01">Название бренда</label>
                                                                    <input type="text" name="name" class="form-control form-control-sm" value="{{ $value->name }}" id="validationTooltip01"
                                                                           placeholder="Название магазина" required>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-light waves-effect"
                                                                        data-bs-dismiss="modal">Закрыть
                                                                </button>
                                                                <button type="submit"
                                                                        class="btn btn-primary waves-effect waves-light">
                                                                    Сохранить
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </form><!-- /.modal-content -->
                                                </div><!-- /.modal-dialog -->
                                            </div>
                                            <form action="/brands/{{ $value->id }}" style="display: inline-block"
                                                  method="post">
                                                @csrf
                                                {{ method_field('delete') }}
                                                <button type="submit" onclick="return confirm('Вы точно хотите удалить {{ $value->name }}');" class="btn btn-outline-secondary btn-sm">
                                                    <i class="uil uil-trash-alt"></i>
                                                </button>
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
        {{--<div class="col-xl-4">--}}
        {{--<div class="card">--}}
        {{--<div class="card-body">--}}
        
        {{--<h4 class="card-title">Цвета</h4>--}}
        {{--<div class="table-responsive">--}}
        {{--<table class="table table-sm table-hover table-bordered table-striped table-nowrap align-middle">--}}
        {{--<thead>--}}
        {{--<tr>--}}
        {{--<th>ID</th>--}}
        {{--<th>Название</th>--}}
        {{--<th>Действие</th>--}}
        {{--</tr>--}}
        {{--</thead>--}}
        {{--<tbody>--}}
        {{--@foreach(\App\Color::all() as $key=>$value)--}}
        {{--<tr data-id="{{ $key+1 }}">--}}
        {{--<td data-field="id" style="width: 80px">{{ $key+1 }}</td>--}}
        {{--<td data-field="name">{{ $value->name }}</td>--}}
        {{--<td style="width: 100px">--}}
        {{--<a class="btn btn-outline-secondary btn-sm edit" data-bs-toggle="modal"--}}
        {{--data-bs-target="#colorModel{{$value->id}}" title="Edit">--}}
        {{--<i class="fas fa-pencil-alt"></i>--}}
        {{--</a>--}}
        {{--<div id="colorModel{{$value->id}}" class="modal fade" tabindex="-1" role="dialog"--}}
        {{--aria-labelledby="myModalLabel" aria-hidden="true">--}}
        {{--<div class="modal-dialog">--}}
        {{--<form action="/colors/{{ $value->id }}" method="post" class="needs-validation"--}}
        {{--novalidate>--}}
        {{--@csrf--}}
        {{--{{ method_field('put') }}--}}
        {{--<div class="modal-content">--}}
        {{--<div class="modal-header">--}}
        {{--<h5 class="modal-title" id="myModalLabel">Изменить--}}
        {{--цвет {{ $value->name }}</h5>--}}
        {{--<button type="button" class="btn-close"--}}
        {{--data-bs-dismiss="modal" aria-label="Close">--}}
        {{--</button>--}}
        {{--</div>--}}
        {{--<div class="modal-body">--}}
        {{--<div class="mb-3 position-relative">--}}
        {{--<label class="col-form-label-sm" for="validationTooltip01">Название цвета</label>--}}
        {{--<input type="text" name="name" class="form-control form-control-sm" value="{{ $value->name }}" id="validationTooltip01"--}}
        {{--placeholder="Название магазина" required>--}}
        {{--</div>--}}
        {{--</div>--}}
        {{--<div class="modal-footer">--}}
        {{--<button type="button" class="btn btn-light waves-effect"--}}
        {{--data-bs-dismiss="modal">Закрыть--}}
        {{--</button>--}}
        {{--<button type="submit"--}}
        {{--class="btn btn-primary waves-effect waves-light">--}}
        {{--Сохранить--}}
        {{--</button>--}}
        {{--</div>--}}
        {{--</div>--}}
        {{--</form><!-- /.modal-content -->--}}
        {{--</div><!-- /.modal-dialog -->--}}
        {{--</div>--}}
        {{--<form action="/colors/{{ $value->id }}" style="display: inline-block"--}}
        {{--method="post">--}}
        {{--@csrf--}}
        {{--{{ method_field('delete') }}--}}
        {{--<button type="submit" onclick="return confirm('Вы точно хотите удалить {{ $value->name }}');" class="btn btn-outline-secondary btn-sm">--}}
        {{--<i class="uil uil-trash-alt"></i>--}}
        {{--</button>--}}
        {{--</form>--}}
        {{--</td>--}}
        {{--</tr>--}}
        {{--@endforeach--}}
        {{--</tbody>--}}
        {{--</table>--}}
        {{--</div>--}}
        
        {{--</div>--}}
        {{--</div>--}}
        {{--</div>--}}
        <!-- end col -->
        </div> <!-- end row -->
    </div> <!-- container-fluid -->
@endsection

@section('script')
    
    <!-- Required datatable js -->
    <script src="/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="/assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
    <!-- Buttons examples -->
    <!-- Responsive examples -->
    <script src="/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="/assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
    
    <!-- Datatable init js -->
    <script src="/assets/js/pages/datatables.init.js"></script>
    
    {{--<script>--}}
    {{--$(document).ready(function () {--}}
    {{--$("#datatable1").DataTable(), $("#datatable2").DataTable(), $("#datatable3").DataTable(), $("#datatable4").DataTable(), $("#datatable5").DataTable({--}}
    {{--"order": [[0, "desc"]],--}}
    {{--lengthChange: !1,--}}
    {{--buttons: ["copy", "excel", "pdf", "colvis"]--}}
    {{--}).buttons().container().appendTo("#datatable-buttons_wrapper .col-md-6:eq(0)"), $(".dataTables_length select").addClass("form-select form-select-sm")--}}
    {{--});--}}
    {{--</script>--}}
    
    <script src="/assets/libs/table-edits/build/table-edits.min.js"></script>
    
    <script src="/assets/js/pages/table-editable.int.js"></script>

@endsection
