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
                            <h4 class="card-title">Ruxsat</h4>
                        </div>
                    </div>
                    <br>
                    <div class="table-responsive">
                        <table class="table table-sm table-hover table-bordered table-striped table-nowrap align-middle">
                            <thead>
                                <tr>
                                    <th>Nomi</th>
                                    <th>Kalit</th>
                                    <th>Guard</th>
                                </tr>
                            </thead>
                            <tbody>
                            <form action="/permissions" method="post">
                                @csrf
                                <tr>
                                    <th><input type="text" class="form-control form-control-sm" style="width: 200px;" name="text" autofocus></th>
                                    <th><input type="text" class="form-control form-control-sm" style="width: 200px;" name="name"></th>
                                    <th class="d-flex justify-content-between">
                                        <input type="text" class="form-control form-control-sm" style="width: 200px;" name="guard_name" value="web">
                                        <button class="btn btn-sm btn-success" type="submit">Qo'shish</button>
                                    </th>
                                </tr>
                            </form>
                            </tbody>
                        </table>
                    </div>
                    <hr>
                    <div class="row justify-between">
                        <div class="col-sm-6">
                            <h4 class="card-title">Ruxsatlar ro'yhati</h4>
                        </div>
                    </div>
                    <br>
                    <div class="table-responsive">
                        <table class="table table-sm table-hover table-bordered table-striped table-nowrap align-middle" id="datatable">
                            <thead>
                                <tr>
                                    <th>Nomi</th>
                                    <th>Kalit</th>
                                    <th>Guard</th>
                                </tr>
                            </thead>
                            <tbody>
                            @foreach($permissions as $permission)
                                    <tr>
                                        <form action="/permissions" method="post">
                                            @csrf
                                        <th class="d-flex justify-content-between">
                                            <input type="hidden" name="data_id" value="{{ $permission->id }}">
                                            <input type="text" class="form-control form-control-sm" style="width: 200px;" name="text" value="{{ $permission->text }}">
                                            <button class="btn btn-sm btn-success" type="submit"><i class="fa fa-save"></i></button>
                                            <span style="display: none">{{ $permission->text }}</span>
                                        </th>
                                        <th>
                                            <input type="text" class="form-control form-control-sm" style="width: 200px;" name="name" value="{{ $permission->name }}" readonly>
                                            <span style="display: none">{{ $permission->name }}</span>
                                        </th>
                                        <th>
                                            <input type="text" class="form-control form-control-sm" style="width: 200px;" name="guard_name" value="{{ $permission->guard_name }}" readonly>
                                            <span style="display: none">{{ $permission->guard_name }}</span>
                                        </th>
                                        </form>
                                    </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- end col -->
    </div>

@endsection

@section('scripts')
    <script src="/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="/assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="/assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="/assets/libs/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
    <script src="/assets/libs/jszip/jszip.min.js"></script>
    <script src="/assets/libs/pdfmake/build/pdfmake.min.js"></script>
    <script src="/assets/libs/pdfmake/build/vfs_fonts.js"></script>
    <script src="/assets/libs/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="/assets/libs/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="/assets/libs/datatables.net-buttons/js/buttons.colVis.min.js"></script>
    <script src="/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="/assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
    <script src="/assets/js/pages/datatables.init.js"></script>
@endsection
