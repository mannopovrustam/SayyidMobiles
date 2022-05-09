<div class="table-responsive">
    <table class="table table-sm table-hover table-bordered table-striped table-nowrap align-middle" id="datatable">
        <thead>
        <tr>
            <th>Sana</th>
            <th>Operatsiya</th>
            <th>Kassadagi pul</th>
            <th>Savdo</th>
            <th>Umumiy savdo summasi</th>
            <th>Telefon soni</th>
            <th>Dona foyda</th>
            <th>Bonus</th>
        </tr>
        </thead>
        <tbody>
        <?php $main_sum = 0; $second_sum = 0; $currency_sum = []; $currency_difference = [];
        foreach (\Modules\Currency\Entities\Currency::all() as $item) {
            $currency_sum[$item->id] = 0;
            $currency_difference[$item->id] = 0;
        }
        ?>
        @if(\Modules\Stock\Entities\Stock::find($stock_id))
            @forelse(\Modules\Stock\Entities\Stock::find($stock_id)->stock_operations as $s_o)
                <?php
                switch ($s_o->operation){
                    case "Pul(kirim | Asosiy Kassa)":
                        $type = -1;
                        break;
                    case "Pul(chiqim | Asosiy Kassa)":
                        $type = 1;
                        break;
                    case "Pul(kirim)":
                        $type = 1;
                        break;
                    case "Pul(chiqim)":
                        $type = -1;
                        break;
                    default:$type = $s_o->type;
                }
                $second_sum += $type * $s_o->sum;
                ?>
                <tr>
                    <td>{{ $s_o->date }}</td>
                    <td>
                        @if($s_o->invoice_id)
                            @switch(\Modules\Invoice\Entities\Invoice::find($s_o->invoice_id)->type)
                                @case(1)
                                <a href="/cash?data_id={{ $s_o->invoice_id }}" target="_blank">{{ $s_o->operation }}</a>
                                @break
                                @case(2)
                                <a href="/loan?data_id={{ $s_o->invoice_id }}" target="_blank">{{ $s_o->operation }}</a>
                                @break
                                @case(3)
                                <a href="/installment?data_id={{ $s_o->invoice_id }}" target="_blank">{{ $s_o->operation }}</a>
                                @break
                                @case(4)
                                <a href="/income?data_id={{ $s_o->invoice_id }}" target="_blank">{{ $s_o->operation }}</a>
                                @break
                            @endswitch
                        @else
                            {{ $s_o->operation }}
                        @endif
                    </td>
                    <td>
                        @if($s_o->invoice_id == null)
                            <?php $currency_sum[sum($s_o->sum_id)->main_currency_id] += -$s_o->type*sum($s_o->sum_id)->main_currency_pay; ?>
                        @endif

                        {{ -$s_o->type*sum($s_o->sum_id)->main_currency_pay }}
                        {{ currency(sum($s_o->sum_id)->main_currency_id)->currency }}<br>
                        @foreach(explode("|", sum($s_o->sum_id)->second_currency_pay) as $key => $item)
                            @if($s_o->invoice_id == null)
                                @php($currency_sum[explode("|", sum($s_o->sum_id)->second_currency_id)[$key]] += -$s_o->type*$item)
                            @endif
                            {{ -$s_o->type*$item }}
                            {{ currency(explode("|", sum($s_o->sum_id)->second_currency_id)[$key])->currency }}
                            <br>
                        @endforeach
                    </td>
                    <td>
                        {{ -$s_o->type*sum($s_o->sum_id)->sum_currency_pay }}
                    </td>
                    <td>
                        {{ -$s_o->type*sum($s_o->sum_id)->sum_currency_pay_get }}
                    </td>
                    <td>
                        <?php $dona_foyda = 0; $bonus = 0; ?>
                        @isset(\Modules\Invoice\Entities\Invoice::find($s_o->invoice_id)->orders)
                            @foreach(\Modules\Invoice\Entities\Invoice::find($s_o->invoice_id)->orders as $som)
                                @foreach($som->order_products as $product)
                                    <?php $dona_foyda += $product->sell_price - $product->cost; ?>
                                    <?php $bonus += $product->bonus; ?>
                                @endforeach
                            @endforeach
                        @endisset
                        @foreach(\Modules\Stock\Entities\StockOperation::where([['invoice_id', $s_o->invoice_id], ['operation', $s_o->operation]])->get() as $inn)
                            @isset(\Modules\Invoice\Entities\Invoice::find($s_o->invoice_id)->products)
                                {{ count(\Modules\Invoice\Entities\Invoice::find($s_o->invoice_id)->products) }}
                            @endisset
                        @endforeach
                    </td>
                    <td>{{ round($dona_foyda, 2, 0) }}</td>
                    <td>{{ $bonus }}</td>
                </tr>
            @empty

            @endforelse
        @endif
        </tbody>
        <tfoot>
        <tr>
            <th>{{ now() }}</th>
            <th>Operatsiya</th>
            <th>
                @foreach(\Modules\Currency\Entities\Currency::all() as $value)
                    {{ $currency_sum[$value->id] . $value->currency }} <br>
                @endforeach
            </th>
            <th>
                @foreach(\Modules\Currency\Entities\Currency::all() as $value)
                    {{ $currency_difference[$value->id] . $value->currency }} <br>
                @endforeach
            </th>
            <th>{{ $main_sum }}</th>
            <th>Telefon soni</th>
            <th>Dona foyda</th>
            <th>Bonus</th>
        </tr>

        </tfoot>
    </table>
</div>