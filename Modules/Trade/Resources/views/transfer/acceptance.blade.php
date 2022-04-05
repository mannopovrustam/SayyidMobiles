@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <div class="card">
            <div class="table-responsive">
                <table class="table table-striped table-nowrap align-middle">
                    <thead>
                    <tr>
                        <th>Invoice(transfer)</th>
                        <th>Sana</th>
                        <th>Ombordan</th>
                        <th>Izoh</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($data as $datum)
                        <tr @if($datum->status == 0) style="background-color: rgb(255 110 110)" @endif>
                            <td>
                                <a href="/acceptance/{{ $datum->id }}">{{ $datum->name }}</a>
                                @if($datum->status)
                                    O'tkazildi
                                @endif
                            </td>
                            <td>{{ $datum->date }}</td>
                            <td>{{ \Modules\Stock\Entities\Stock::find($datum->stock_from)->name }}</td>
                            <td>{{ $datum->note }}</td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
