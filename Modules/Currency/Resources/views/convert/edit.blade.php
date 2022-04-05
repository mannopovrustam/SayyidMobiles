@extends('layouts.app')

@section('content')
    @livewire('currency::convert-edit', ['data' => $data, 'data_id' => $data_id])
@endsection
