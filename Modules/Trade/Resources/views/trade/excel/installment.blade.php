<?php
$stock = \Modules\Stock\Entities\Stock::find($invoice->stock_id);
$main_currency = currency($stock->main_currency_id);
$second_currency = $stock->second_currency_id;
?>
<table>
    <thead>
    <tr>
        <th>Sana</th>
        <th>Mahsulot soni (Jami)</th>
        <th>Jami summa</th>
        <th>Mijoz</th>
        <th>Chegirma</th>
        <th></th>
        <th>Jami summa</th>
        <th>{{ $main_currency->currency }}</th>
        @if($second_currency)
            @foreach (explode("|", $stock->second_currency_id) as $each_second_currency_id)
                <th>{{ currency($each_second_currency_id)->currency }}</th>
            @endforeach
        @endif
        <th>Qoldiq</th>
        <th>Umumiy summa</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>{{ \Carbon\Carbon::createFromFormat('Y-m-d', $invoice->date)->format('Y-m-d') }}</td>
        <td>{{ $invoice->products->count() }}</td>
        <td>{{ array_sum($invoice->products->pluck('cost')->toArray()) }}</td>
        <td>{{ \Modules\Client\Entities\Client::find($invoice->client_id)->name }}</td>
        <td>{{ $invoice->orders->first()->discount }}</td>
        <td></td>
        <td>{{ \Modules\Currency\Entities\Sum::find($invoice->sum_id)->sum_currency_pay }}</td>
        <td>{{ \Modules\Currency\Entities\Sum::find($invoice->sum_id)->main_currency_pay }}</td>
        @if($second_currency)
            @foreach (explode("|", \Modules\Currency\Entities\Sum::find($invoice->sum_id)->second_currency_id) as $key => $each_second_currency_id)
                <td>{{ explode("|", \Modules\Currency\Entities\Sum::find($invoice->sum_id)->second_currency_pay)[$key] }}</td>
            @endforeach
        @endif
        <td>{{ \Modules\Currency\Entities\Sum::find($invoice->sum_id)->sum_currency_pay_will }}</td>
        <td>{{ \Modules\Currency\Entities\Sum::find($invoice->sum_id)->sum_currency_pay_get + \Modules\Currency\Entities\Sum::find($invoice->sum_id)->sum_currency_pay_will }}</td>
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


<table>
    <thead>
    <tr>
        <th></th>
        <th>Oy</th>
        <th>To'lov</th>
    </tr>
    </thead>
    <tbody>
    <?php
    $order_detail = \Modules\Invoice\Entities\OrderDetail::find($invoice->orders->first()->id);
    $init_price = 0;
    $date = new \Carbon\Carbon($invoice->date);

    $from = $date->year . '-' . $date->month . '-' . $order_detail->every_days;
    $addMonth = \Carbon\Carbon::createFromFormat('Y-m-d', $from)->format('Y-m-d H:i:s');
    $to = $date->addMonths($order_detail->date_agreement_month);
    $period = \Carbon\CarbonPeriod::create($from, '1 month', $to);
//    $init_price = ($summ - (double)$order_detail->initial_payment);

    ?>
    @foreach($period as $date)
        <tr>
            <td></td>
            <td>{{ $order_detail->every_days.'.'. $date->month.'.'.$date->year  }}</td>
            <td>{{ $order_detail->monthly_pay }} {{ $main_currency->currency }}</td>
            {{--<td>{{ $summ1/$order_detail->date_agreement_month }} {{ $second_currency->currency }}</td>--}}
        </tr>
    @endforeach
    </tbody>
</table>
