<div class="table-responsive">
    <table class="table table-sm table-hover table-bordered table-striped table-nowrap align-middle" id="datatable">
        <thead>
        <tr>
            <th>Shaxobcha</th>
            <th>Brend</th>
            <th>Mahsulot</th>
            <th>Savdo</th>
            <th>Qoldiq</th>
            <th>Ombor valyutasi</th>
            <th>Hozirgi narx</th>
            <th>Narx</th>
            <th>Bonus</th>
            <th>O'rtacha narx</th>
        </tr>
        </thead>
        <tbody>
        @foreach(\Modules\Product\Entities\Product::orderBy('id')->get() as $data)
                <tr>
                    <td>{{ \Modules\Stock\Entities\Stock::find($data->stock_acc_id)->name }}</td>
                    <td>{{ $data->stock_id }}</td>
                    <td>{{ $data->user_id }}</td>
                    <td>{{ $data->shipment_id }}</td>
                    <td>{{ $data->invoice_id }}</td>
                    <td>{{ $data->mark_id }}</td>
                    <td>{{ $data->imei }}</td>
                    <td>{{ $data->price }}</td>
                    <td>{{ $data->bonus }}</td>
                    <td>{{ $data->expense }}</td>
                </tr>
        @endforeach
        </tbody>
    </table>
</div>
