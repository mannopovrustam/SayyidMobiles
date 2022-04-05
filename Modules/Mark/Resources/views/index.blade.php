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
                    <h4 class="mb-0">Model</h4>
                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item active">Model</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <form action="/marks" method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="mb-3 position-relative">
                                        <label class="col-form-label-sm" for="validationTooltip02">Тип</label>
                                        <select class="form-select form-select-sm" name="type_id" id="validationTooltip02">
                                            @foreach(\Modules\Mark\Entities\Type::all() as $item)
                                                <option value="{{ $item->id }}">{{ $item->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="mb-3 position-relative">
                                        <label class="col-form-label-sm" for="validationTooltip02">Бренд</label>
                                        <select class="form-select form-select-sm" name="brand_id" id="validationTooltip02">
                                            @foreach(\Modules\Mark\Entities\Brand::all() as $item)
                                                <option value="{{ $item->id }}">{{ $item->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="mb-3">
                                        <label class="col-form-label-sm" for="validationCustom01">Название Марки</label>
                                        <input type="text" class="form-control form-control-sm" name="name" id="validationCustom01"
                                               placeholder="Название Марки">
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="mb-3">
                                        <label class="col-form-label-sm" for="excel">Excel Yuklash</label>
                                        <input type="file" class="form-control form-control-sm" name="excel" id="excel">
                                    </div>
                                </div>
                                <div class="col-md-2">
                                <div class="mb-3 position-relative">
                                    <label class="col-form-label-sm" for="validationCustom01" style="visibility: hidden">Добавить марку</label>
                                    <br>
                                    <input class="btn-sm btn-primary" type="submit" value="Добавить марку">
                                </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Марки</h4>
                        <div class="table-responsive">
                            <table class="table table-sm table-hover table-bordered table-striped table-nowrap align-middle">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Тип</th>
                                    <th>Бренд</th>
                                    <th>Название</th>
                                    <th>Версия</th>
                                    <th>Описание</th>
                                    <th>Действие</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach(\Modules\Mark\Entities\Mark::all() as $key=>$value)
                                    <tr data-id="{{ $key+1 }}">
                                        <td data-field="id" style="width: 80px">{{ $key+1 }}</td>
                                        @if(\Modules\Mark\Entities\Type::find($value->type_id))
                                            <td data-field="type">{{ \Modules\Mark\Entities\Type::find($value->type_id)->name }}</td>
                                            <td data-field="brand">{{ \Modules\Mark\Entities\Brand::find($value->brand_id)->name }}</td>
                                        @endif
                                        <td data-field="name">{{ $value->name }}</td>
                                        <td data-field="version">{{ $value->version }}</td>
                                        <td data-field="description">{{ $value->description }}</td>
                                        <td style="width: 100px">
                                            <a class="btn btn-outline-secondary btn-sm edit" data-bs-toggle="modal"
                                               data-bs-target="#markModel{{$value->id}}" title="Edit">
                                                <i class="fas fa-pencil-alt"></i>
                                            </a>
                                            <div id="markModel{{$value->id}}" class="modal fade" tabindex="-1" role="dialog"
                                                 aria-labelledby="myModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <form action="/marks" method="post" class="needs-validation"
                                                          novalidate>
                                                        @csrf
                                                        <input type="hidden" name="data_id" value="{{ $value->id }}">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="myModalLabel">Изменить
                                                                    марку {{ $value->name }}</h5>
                                                                <button type="button" class="btn-close"
                                                                        data-bs-dismiss="modal" aria-label="Close">
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="mb-3 position-relative">
                                                                    <label class="col-form-label-sm" for="validationTooltip01">Название марки</label>
                                                                    <input type="text" name="name" class="form-control form-control-sm" value="{{ $value->name }}" id="validationTooltip01"
                                                                           placeholder="Название магазина" required>
                                                                </div>
                                                                <div class="mb-3 position-relative">
                                                                    <label class="col-form-label-sm" for="validationTooltip02">Тип</label>
                                                                    <select class="form-select form-select-sm" name="type_id" id="validationTooltip02" required>
                                                                        @foreach(\Modules\Mark\Entities\Type::all() as $item)
                                                                            <option @if($item->id == $value->type_id) selected @endif value="{{ $item->id }}">{{ $item->name }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                                <div class="mb-3 position-relative">
                                                                    <label class="col-form-label-sm" for="validationTooltip02">Бренд</label>
                                                                    <select class="form-select form-select-sm" name="brand_id" id="validationTooltip02" required>
                                                                        @foreach(\Modules\Mark\Entities\Brand::all() as $item)
                                                                            <option @if($item->id == $value->brand_id) selected @endif value="{{ $item->id }}">{{ $item->name }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                                {{--<div class="mb-3 position-relative">--}}
                                                                {{--<label class="col-form-label-sm" for="validationTooltip02">Цвет</label>--}}
                                                                {{--<select class="form-select form-select-sm" name="color_id" id="validationTooltip02" required>--}}
                                                                {{--@foreach(\App\Color::all() as $item)--}}
                                                                {{--<option @if($item->id == $value->color_id) selected @endif value="{{ $item->id }}">{{ $item->name }}</option>--}}
                                                                {{--@endforeach--}}
                                                                {{--</select>--}}
                                                                {{--</div>--}}
                                                                <div class="col-md-12">
                                                                    <label class="col-form-label-sm" for="validationCustom01">Описание Марки</label>
                                                                    <textarea class="form-control form-control-sm" name="description" id="validationCustom01"
                                                                              placeholder="Описание Марки" required>{{ $value->description }}</textarea>
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
                                            <form action="/marks/{{ $value->id }}" style="display: inline-block" method="post">
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
