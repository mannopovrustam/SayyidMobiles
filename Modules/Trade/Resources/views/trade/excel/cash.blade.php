<?php
    $stock = \Modules\Stock\Entities\Stock::find($invoice->stock_id);
    $main_currency = currency($stock->main_currency_id);
?>
<table>
    <thead>
    <tr>
        <th>Sana</th>
        <th>Mahsulot soni (Jami)</th>
        <th>Jami summa</th>
        <th>Mijoz</th>
        <th>Chegirma</th>
    </tr>
    </thead>
    <tbody>
        <tr>
            <td>{{ \Carbon\Carbon::createFromFormat('Y-m-d', $invoice->date)->format('Y-m-d') }}</td>
            <td>{{ $invoice->products->count() }}</td>
            <td>{{ array_sum($invoice->products->pluck('cost')->toArray()) }}</td>
            <td>
                {{ \Modules\Client\Entities\Client::find($invoice->client_id)->name }}
            </td>
            <td>
                {{ $invoice->orders->first()->discount }}
            </td>
        </tr>
    </tbody>
</table>


<table>
    <thead>
    <tr>
        <th>Brend</th>
        <th>Model</th>
        <th>Taklifdagi narx</th>
        <th>Narx</th>
        <th>Mahsulot</th>
    </tr>
    </thead>
    <tbody>
    @foreach ($invoice->products as $product)
        <tr>
            <td>{{ \Modules\Mark\Entities\Brand::find(\Modules\Mark\Entities\Mark::find($product->mark_id)->brand_id)->name }}</td>
            <td>{{ \Modules\Mark\Entities\Mark::find($product->mark_id)->name }}</td>
            <td>
                @if (\Modules\Stock\Entities\StockMark::where([['mark_id', $product->mark_id], ['price_type_id', \Modules\Stock\Entities\Stock::find($stock_id)->price_type_id]])->first())
                    <?php
                    $max = \Modules\Stock\Entities\StockMark::where([['mark_id', $product->mark_id], ['price_type_id', $stock->price_type_id]])->first();
                    ?>
                    {{ (float)$max['price'] * $main_currency->rate }}
                @endif
            </td>
            <td>
                {{ round($product->sell_price, 2) }}
            </td>
            <td>
                {{ $product->imei }}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>