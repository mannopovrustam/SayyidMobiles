@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <div class="card">
            <div class="card-body">

                <div class="row mb-3">
                    <div class="col-lg-12 margin-tb d-flex justify-content-between align-items-center">
                        <h3>Xodimlarni boshqarish</h3>
                        <a class="btn btn-sm btn-success" href="/permissions">Ruxsatlar ro'yhati</a>
                        <a class="btn btn-sm btn-success" href="{{ route('users.create') }}">Yangi xodim qo'shish</a>
                    </div>
                </div>


                @if ($message = Session::get('success'))
                    <div class="alert alert-success">
                        <p>{{ $message }}</p>
                    </div>
                @endif

                <table class="table table-sm table-hover table-bordered table-striped table-nowrap align-middle" id="datatable">
                    <tr>
                        <th>No</th>
                        <th>Ism</th>
                        <th>Elektron pochta</th>
                        <th width="280px">Harakat</th>
                    </tr>
                    @foreach ($data as $key => $user)
                        <tr>
                            <td>{{ ++$i }}</td>
                            <td>{{ $user->name }}</td>
                            <td>{{ $user->email }}</td>
                            <td>
                                <a class="btn btn-sm btn-info" href="{{ route('users.show',$user->id) }}">Ko'rsatish</a>
                                <a class="btn btn-sm btn-primary" href="{{ route('users.edit',$user->id) }}">Tahrirlash</a>
                                {!! Form::open(['method' => 'DELETE','route' => ['users.destroy', $user->id],'style'=>'display:inline']) !!}
                                {!! Form::submit("O'chirish", ['class' => 'btn btn-sm btn-danger']) !!}
                                {!! Form::close() !!}
                            </td>
                        </tr>
                    @endforeach
                </table>
                {!! $data->render() !!}
            </div>
        </div>
    </div>

@endsection