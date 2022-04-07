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

    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">
                    <div class="row justify-between">
                        <div class="col-sm-6">
                            <h4 class="card-title">Mahsulotlar</h4>
                        </div>
                        <div class="col-sm-6" style="text-align: end">
                            <button class="btn btn-success" style="padding: 2px" onclick="$('form#export_products').submit()"><i class="bx bx-save">&nbsp;</i>Excel</button>
                        </div>
                    </div>
                    <br>
                    @livewire('product::product.data')
                </div>
            </div>
        </div>
        <!-- end col -->
    </div>

@endsection
