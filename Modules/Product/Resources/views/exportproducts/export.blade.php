<table class="table table-sm table-hover table-bordered table-striped table-nowrap align-middle">
    <thead>
    <?php
    $statement[] = true;
    $stock_id = session()->get('stock_id');
    $brand = session()->get('brand');
    $name = session()->get('name');
    $start = session()->get('start');
    $end = session()->get('end');
    $residue = session()->get('residue');

    $all_products = []; $i = 0;
    $all_stocks = $stock_id ? \Modules\Stock\Entities\Stock::where('id', $stock_id)->get() : \Modules\Stock\Entities\Stock::all();

    $brnd = \Modules\Mark\Entities\Brand::where('name', 'like', '%' . $brand . '%')->get();

    foreach ($all_stocks as $stocks) {
        foreach ($stocks->products->groupBy('mark_id') as $item) {
            $sm = \Modules\Stock\Entities\StockMark::where([['mark_id', $item->first()->mark_id], ['price_type_id', $stocks->price_type_id]])->first();
            $cost = \Modules\Product\Entities\Product::where([['stock_id', $stocks->id], ['mark_id', $item->first()->mark_id], ['order_id', null], ['cost', '!=', null]])->get('cost');
            $average = 0;
            if (!$cost->isEmpty()) {
                $sumArray = [];
                foreach ($cost as $subArray) {
                    $sumArray[] = (double)$subArray->cost;
                }
                $average = array_sum($sumArray) / count($sumArray);
            }
            $markId = $item->first()->mark->id;
            $all_products[$i]['mark_id'] = $markId;

            $data_id[$markId] = $sm ? $sm->id : null;
            $price_type_id[$markId] = $stocks->price_type_id;
            $mark_id[$markId] = $item->first()->mark_id;
            $main_currency_id[$markId] = $stocks->main_currency_id;
            $price[$markId] = $sm ? $sm->price : null;
            $bonus[$markId] = $sm ? $sm->bonus : null;
            $currency_id[$markId] = $stocks->main_currency_id;

            $all_products[$i]['stocks_name'] = $stocks->name;
            $all_products[$i]['brand_name'] = $item->first()->mark->brand->name;
            $all_products[$i]['mark_name'] = $item->first()->mark->name;
            $all_products[$i]['not_sold'] = $item->where('order_id', null)->count();

            if (!$start && !$end) {
                $all_products[$i]['sold'] = $item->where('order_id', '!=', null)->count();
            }
            if ($start) {
                $all_products[$i]['sold'] = $item->where('order_id', '!=', null)->where('updated_at', '>', $start . 'T00:00:00')->count();
            }
            if ($end) {
                $all_products[$i]['sold'] = $item->where('order_id', '!=', null)->where('updated_at', '<', $end . 'T23:59:59')->count();
            }

            $all_products[$i]['stocks_currency'] = currency($stocks->main_currency_id)->currency;
            $all_products[$i]['price'] = ($sm ? $sm->price : '');
            $all_products[$i]['average'] = round($average, 2);

            $i++;
        }
    }


    ?>
    <tr>
        <th>Shaxobcha</th>
        <th>Brend</th>
        <th>Mahsulot</th>
        <th>Savdo {{ $start }} : {{ $end }}</th>
        <th>Qoldiq</th>
        <th>Ombor valyutasi</th>
        <th>Hozirgi narx</th>
        <th>Narx</th>
        <th>Bonus</th>
        <th>O'rtacha narx</th>
    </tr>
    </thead>
    <tbody>
    @foreach($all_products as $all_product)
        <?php
        if ($brand) {
            $statement[] = $all_product['brand_name'] == $brand;
        }
        if ($name) {
            $statement[] = $all_product['mark_name'] == $name;
        }
        if ($residue) {
            $statement[] = $all_product['not_sold'] == $residue;
        }
        ?>
        @if(
            ($brand ? str_contains($all_product['brand_name'], $brand) : true)
            &&
            ($name ? str_contains($all_product['mark_name'], $name) : true)
            &&
            ($residue ? $all_product['not_sold'] == $residue : true)
        )

            <tr>
                <td>{{ $all_product['stocks_name'] }}</td>
                <td>{{ $all_product['brand_name'] }}</td>
                <td>{{ $all_product['mark_name'] }}</td>
                <td>{{ $all_product['sold'] }}</td>
                <td>{{ $all_product['not_sold'] }}</td>
                <td>{{ $all_product['stocks_currency'] }}</td>
                <td>{{ $all_product['price'] }}</td>
                <td><input type="text" style="width: 80px;height: 20px;" value="{{$price[$markId]}}"></td>
                <td><input type="text" style="width: 80px;height: 20px;" value="{{$bonus[$markId]}}"></td>
                <td>{{ $all_product['average'] }}</td>
            </tr>
        @endif
    @endforeach
    </tbody>
</table>