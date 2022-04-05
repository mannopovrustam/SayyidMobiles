@extends('layouts.app')

@section('content')
    @livewire('currency::convert', ['data' => $data, 'data_id' => $data_id])
@endsection
