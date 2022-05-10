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
                        <th>Status</th>
                        <th>Izoh</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($data as $datum)
                        <?php
                        switch($datum->status){
                            case 0:
                                $status = 'Yo\'lda';
                                $bg_color = 'bg-soft-warning';
                                break;
                            case 1:
                                $status = 'Qabul qilindi';
                                $bg_color = 'bg-soft-success';
                                break;
                            case 2:
                                $status = 'Bekor qilindi';
                                $bg_color = 'bg-soft-danger';
                                break;
                        }
                        ?>
                        <tr class="{{ $bg_color }}">
                            <td><a href="/transfer?data_id={{ $datum->id }}">{{ $datum->name }}</a></td>
                            <td>{{ $datum->date }}</td>
                            <td>{{ \Modules\Stock\Entities\Stock::find($datum->stock_to)->name }}</td>
                            <td>{{ $status }}</td>
                            <td>{{ $datum->note }}</td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
