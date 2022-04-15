@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-12 margin-tb d-flex justify-content-between align-items-center">
                        <h3>Xodimni ko'rsatish</h3>
                        <a class="btn btn-sm btn-primary" href="{{ route('users.index') }}">Ortga</a>
                    </div>
                </div>


                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <strong>Ismi:</strong>
                            {{ $user->name }}
                        </div>
                        <div class="form-group">
                            <strong>Email:</strong>
                            {{ $user->email }}
                        </div>
                    </div>
                    <br><br>

                    @if($user->stock_id)
                    {!! Form::model($user, ['method' => 'PATCH','route' => ['users.update', $user->id]]) !!}
                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <div class="form-group">
                                <strong>Ruxsat:</strong>
                                <br/>
                                @foreach($permission as $value)
                                    <label>{{ Form::checkbox('permission[]', $value->id, in_array($value->id, $rolePermissions) ? true : false, array('class' => 'name')) }}
                                        {{ $value->text }}</label>
                                    <br/>
                                @endforeach
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                            <button type="submit" class="btn btn-sm btn-primary">Saqlash</button>
                        </div>
                    {!! Form::close() !!}
                    @else
                        <br>
                        <h4 class="text-warning">Bo'limlarga <u class="text-success">RUXSAT</u> berish uchun Xodim <a href="/stocks" class="text-primary">omborga</a> biriktirilgan bo'lishi shart!</h4>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection