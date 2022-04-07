<table>
    <thead>
    <tr>
        <th>Sana</th>
        <th>Mahsulot soni (Jami)</th>
        <th>Ombordan</th>
        <th>Omborga</th>
        <th>Izoh</th>
    </tr>
    </thead>
    <tbody>
    <?php
    $id = session()->get('id');
    $k = 0;
    ?>
    @foreach (\Modules\Trade\Entities\Transfer::where('id', $id['id'])->get() as $data)
        {{--{{ dd($data->note) }}--}}
        <tr>
            <td>
                {{ $data->date }}
            </td>
            <td>
                {{ count(explode(',', $data->products)) }}
            </td>
            <td>
                {{ \Modules\Stock\Entities\Stock::find($data->stock_from)->name }}
            </td>
            <td>
                {{ \Modules\Stock\Entities\Stock::find($data->stock_to)->name }}
            </td>
            <td>
                {{ $data->note }}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>

<table>
    <thead>
    <tr>
        <th>Brend</th>
        <th>Model</th>
        <th>Imei</th>
    </tr>
    </thead>
    <tbody>
    @foreach (explode(',', \Modules\Trade\Entities\Transfer::find($id['id'])->products) as $key=>$value)
        @foreach(\Modules\Product\Entities\Product::where('id', $value)->get() as $data)
        <tr>
            <td>
                {{ \Modules\Mark\Entities\Brand::find(\Modules\Mark\Entities\Mark::find($data->mark_id)->brand_id)->name }}
            </td>
            <td>
                {{\Modules\Mark\Entities\Mark::find($data->mark_id)->name }}
            </td>
            <td>
                {{ $data->imei }}
            </td>
        </tr>
        @endforeach
    @endforeach
    </tbody>
</table>
