@extends('layouts.app')

@section('css')
    <!-- DataTables -->
    <link href="{{ asset('assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css') }}" rel="stylesheet"
          type="text/css" xmlns:wire="http://www.w3.org/1999/xhtml"/>
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
                    <h4 class="mb-0">Mijoz</h4>
                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item active">Mijoz</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <form action="/clients" method="post" class="needs-validation" novalidate>
                            @csrf
                            <input type="hidden" name="data_id" value="">
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="mb-3">
                                        <label class="col-form-label-sm" for="validationCustom01">Nomi</label>
                                        <input type="text" class="form-control form-control-sm" name="name" id="validationCustom01"
                                               placeholder="..." required>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                    <div class="mb-3">
                                        <label class="col-form-label-sm" for="validationCustom01">Telefon</label>
                                        <input type="text" class="form-control form-control-sm" name="phone" id="validationCustom01"
                                               placeholder="..." required>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                    <div class="mb-3">
                                        <label class="col-form-label-sm" for="validationCustom01">Kod</label>
                                        <input type="number" class="form-control form-control-sm" name="kod" id="validationCustom01"
                                               placeholder="..." required>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                    <div class="mb-3">
                                        <label class="col-form-label-sm" for="validationCustom01">Region</label>
                                        <select class="form-control form-control-sm" name="region" id="">
                                            <option value="1">Ташкент</option>
                                            <option value="2">Самарканд</option>
                                            <option value="3">Бухара</option>
                                            <option value="4">Наманган</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                    <div class="mb-3">
                                        <label class="col-form-label-sm" for="validationCustom01">Manzil</label>
                                        <input type="text" class="form-control form-control-sm" name="address" id="validationCustom01"
                                               placeholder="..." required>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                    <div class="mb-3">
                                        <label class="col-form-label-sm" for="validationCustom01">I Valyuta</label>
                                        <select class="form-control form-control-sm" name="main_currency_id" id="">
                                            @foreach(\Modules\Currency\Entities\Currency::all() as $data)
                                                <option value="{{ $data->id }}">{{ $data->currency }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                    <div class="mb-3">
                                        <label class="col-form -label-sm" for="changeCurr_1">II Valyuta</label>
                                        <select class="form-control form-control-sm" name="second_currency_id[]" id="changeCurr_1" multiple>
                                            @foreach(\Modules\Currency\Entities\Currency::all() as $data)
                                                <option value="{{ $data->id }}">{{ $data->currency }}</option>
                                            @endforeach
                                        </select>
{{--                                        {{dd($data)}}--}}
                                    </div>
                                </div>
                                <div class="col-md-1">
                                    <div class="mb-3">
                                        <label class="col-form-label-sm" for="validationCustom01">Shaxobcha</label>
                                        <select class="form-control form-control-sm" name="stock_id" id="">
                                            @foreach(\Modules\Stock\Entities\Stock::all() as $data)
                                                <option value="{{ $data->id }}">{{ $data->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="mb-3">
                                        <label class="col-form-label-sm" for="validationCustom01">Izox</label>
                                        <textarea name="description" id="" cols="20" rows="1"
                                                  class="form-control form-control-sm"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-1" style="margin-top: 27px">
                                    <div class="mb-3">
                                        <button class="btn btn-primary" type="submit">Saqlash</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        @if(\Modules\Client\Entities\Client::count() > 0)
        @livewire('client::client-report-setting')
        @endif

         <!-- end row -->
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
