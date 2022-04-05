@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <div class="card">
            <div class="table-responsive">
                <table class="table table-striped table-nowrap align-middle">
                    <thead>
                    <tr>
                        <th>Invoice</th>
                        <th>Turi</th>
                        <th>Mijoz</th>
                        <th>Sana</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($data as $datum)
                        <?php
                            switch ($datum->type){
                                case 1: $type = 'Naqd savdo'; break;
                                case 2: $type = 'Nasiya'; break;
                                case 3: $type = 'Muddatli to\'lov'; break;
                                case 4: $type = 'Kirim'; break;
                            }
                        ?>
                        <tr>
                            <td><a href="/invoices/{{ $datum->id }}">{{ $datum->name }}</a></td>
                            <td>{{ $type }}</td>
                            <td>{{ $datum->client_id ? \Modules\Client\Entities\Client::find($datum->client_id)->name : '' }}</td>
                            <td>{{ $datum->created_at->format('d.m.Y -- H:i') }}</td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
