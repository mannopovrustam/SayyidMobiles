<?php
$stock = \Modules\Stock\Entities\Stock::find($invoice->stock_id);
$main_currency = currency($stock->main_currency_id);
$second_currency = $stock->second_currency_id;
?>
<table>
    <thead>
    <tr>
        <th style="background: #1e3ed8; color: #ffffff; width: 150px;">Umumiy ma'lumot</th>
        <th style="background: #1e3ed8; color: #ffffff; width: 150px;">Sana</th>
        <th style="background: #1e3ed8; color: #ffffff; width: 150px;">Mahsulot soni (Jami)</th>
        <th style="background: #1e3ed8; color: #ffffff; width: 150px;">Mijoz</th>
        <th style="background: #1e3ed8; color: #ffffff; width: 150px;"></th>
        <th style="background: #1e3ed8; color: #ffffff; width: 150px;">Mahsulot summa</th>
        <th style="background: #1e3ed8; color: #ffffff; width: 150px;">Xarajat</th>
        <th style="background: #1e3ed8; color: #ffffff; width: 150px;">Jami summa</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td></td>
        <td>{{ \Carbon\Carbon::createFromFormat('Y-m-d', $invoice->date)->format('Y-m-d') }}</td>
        <td>{{ $invoice->products->count() }}</td>
        <td>{{ \Modules\Client\Entities\Client::find($invoice->client_id)->name }}</td>
        <td></td>
        <td>{{ array_sum($invoice->products->pluck('price')->toArray()) }}</td>
        <td>{{ array_sum($invoice->products->pluck('expense')->toArray()) }}</td>
        <td>{{ array_sum($invoice->products->pluck('cost')->toArray()) }}</td>
    </tr>
    </tbody>
</table>

<table>
    <thead>
    <tr>
        <th style="background: #1e3ed8; color: #ffffff">Xarajat</th>
        <th style="background: #1e3ed8; color: #ffffff">Xarajat nomi</th>
        <th style="background: #1e3ed8; color: #ffffff">Xarajat summasi</th>
        <th style="background: #1e3ed8; color: #ffffff">Tur</th>
        <th style="background: #1e3ed8; color: #ffffff">Model</th>
    </tr>
    </thead>
    <tbody>
    @foreach(\Modules\Invoice\Entities\Expense::where('invoice_id', $invoice->id)->get() as $value)
        <tr>
            <td></td>
            <td>{{ $value->name }}</td>
            <td>{{ $value->type }}</td>
            <td>{{ $value->note }}</td>
            @foreach(explode(",", $value->mark_id) as $item)
                <td>
                    {{ \Modules\Mark\Entities\Brand::find(\Modules\Mark\Entities\Mark::find($item)->brand_id)->name }}
                    {{ \Modules\Mark\Entities\Mark::find($item)->name }}
                </td>
            @endforeach
        </tr>
    @endforeach
    </tbody>
</table>


<table>
    <thead>
    <tr>
        <th style="background: #1e3ed8; color: #ffffff">Mahsulot</th>
        <th style="background: #1e3ed8; color: #ffffff">Brend</th>
        <th style="background: #1e3ed8; color: #ffffff">Model</th>
        <th style="background: #1e3ed8; color: #ffffff">Soni @php($qty = 0)</th>
        <th style="background: #1e3ed8; color: #ffffff">Narxi @php($price = 0)</th>
        <th style="background: #1e3ed8; color: #ffffff">Jami xarajat @php($expense = 0)</th>
        <th style="background: #1e3ed8; color: #ffffff">Summa @php($sum = 0)</th>
        <th style="background: #1e3ed8; color: #ffffff">Tannarxi</th>
        <th style="background: #1e3ed8; color: #ffffff">Mahsulot</th>
    </tr>
    </thead>
    <tbody>
    @foreach ($invoice->products as $product)
        <tr>
            <td></td>
            <td>{{ \Modules\Mark\Entities\Brand::find(\Modules\Mark\Entities\Mark::find($product->mark_id)->brand_id)->name }}</td>
            <td>{{ \Modules\Mark\Entities\Mark::find($product->mark_id)->name }}</td>
            <td>@php($qty++)</td>
            <td>{{ $product->price }} @php($price += $product->price)</td>
            <td>{{ $product->expense }} @php($expense += $product->expense)</td>
            <td>{{ $product->cost }} @php($sum += $product->cost)</td>
            <td>{{ $product->imei }}</td>
        </tr>
    @endforeach
    </tbody>
    <tfoot>
        <tr>
            <th></th>
            <th>Brend</th>
            <th>Model</th>
            <th>{{ $qty }}</th>
            <th>{{ $price }}</th>
            <th>{{ $expense }}</th>
            <th>{{ $sum }}</th>
            <th>Tannarxi</th>
            <th>Mahsulot</th>
        </tr>
    </tfoot>
</table>