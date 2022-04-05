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
                    <h4 class="mb-0">Narx turi</h4>
                    <button class="accordion-button collapsed btn btn-primary" style="width: 200px;" type="button"
                            data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
                            aria-expanded="false" aria-controls="flush-collapseTwo">
                        Narx turi qo'shish
                    </button>
                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item active">Narx turi</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div id="flush-collapseTwo" class="accordion-collapse collapse"
             aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="/price_types" method="post">
                                @csrf
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="col-form-label-sm" for="validationCustom01">Narx turi nomi</label>
                                            <input type="text" class="form-control form-control-sm" name="name" id="validationCustom01"
                                                   placeholder="Narx turi nomi" required>
                                        </div>
                                    </div>
                                </div>
                                <button class="btn btn-primary" type="submit">Narx turi qo'shish</button>
                            </form>
                        </div>

                    </div>
                </div>
                <!-- end card -->
            </div>
            <!-- end col -->

        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Narx turi</h4>
                        <div class="table-responsive">
                            <table class="table table-sm table-hover table-bordered table-striped table-nowrap align-middle">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nomi</th>
                                    <th>Действие</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach(\Modules\Stock\Entities\PriceType::all() as $key=>$price_type)
                                    <tr data-id="{{ $key+1 }}">
                                        <td data-field="id" style="width: 80px">{{ $key+1 }}</td>
                                        <td data-field="name">{{ $price_type->name }}</td>
                                        <td style="width: 100px">
                                            <a href="/price_types/{{ $price_type->id }}"
                                               class="btn btn-outline-secondary btn-sm" title="Show">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                            <a class="btn btn-outline-secondary btn-sm edit" data-bs-toggle="modal"
                                               data-bs-target="#storeModel{{$price_type->id}}" title="Edit">
                                                <i class="fas fa-pencil-alt"></i>
                                            </a>
                                            <div id="storeModel{{$price_type->id}}" class="modal fade" tabindex="-1"
                                                 role="dialog"
                                                 aria-labelledby="myModalLabel" aria-hidden="true">

                                                <div class="modal-dialog">
                                                    <form action="/price_types" method="post"
                                                          class="needs-validation"
                                                          novalidate>
                                                        @csrf
                                                        <input type="hidden" name="data_id" value="{{ $price_type->id }}">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="myModalLabel">Изменить
                                                                    нарх тури {{ $price_type->name }}</h5>
                                                                <button type="button" class="btn-close"
                                                                        data-bs-dismiss="modal" aria-label="Close">
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="mb-3 position-relative">
                                                                    <label class="col-form-label-sm" for="validationTooltip01">Название
                                                                        нарх тури </label>
                                                                    <input type="text" name="name" class="form-control form-control-sm"
                                                                           value="{{ $price_type->name }}"
                                                                           id="validationTooltip01"
                                                                           placeholder="Нарх тури" required>
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
                                            <form action="/price_types/{{ $price_type->id }}" style="display: inline-block"
                                                  method="post">
                                                @csrf
                                                {{ method_field('delete') }}
                                                <button type="submit"
                                                        onclick="return confirm('Вы точно хотите удалить {{ $price_type->name }}');"
                                                        class="btn btn-outline-secondary btn-sm">
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
    </div>

@endsection
