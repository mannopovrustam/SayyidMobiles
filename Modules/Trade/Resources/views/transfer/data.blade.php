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
                        <th>Omborga</th>
                        <th>Izoh</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($data as $datum)
                        <tr>
                            <td><a href="/transfer?data_id={{ $datum->id }}">{{ $datum->name }}</a></td>
                            <td>{{ $datum->date }}</td>
                            <td>{{ \Modules\Stock\Entities\Stock::find($datum->stock_to)->name }}</td>
                            <td>{{ $datum->note }}</td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
