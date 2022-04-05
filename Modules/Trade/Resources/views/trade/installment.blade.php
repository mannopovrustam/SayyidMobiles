@extends('layouts.app')

@section('content')
    <?php session()->forget('old_invoice') ?>
    <livewire:trade::trade.installment />
@endsection
