<table id="datatable" class="table table-bordered dt-responsive nowrap"
    style="border-collapse: collapse; border-spacing: 0; width: 100%; margin: 10px 0;">
    <thead>
        <tr>
            <th></th>
            <th>Brend</th>
            <th>Model</th>
            <th>Taklifdagi narx</th>
            <th>Narx</th>
            <th>Mahsulot</th>
        </tr>
    </thead>
    <tbody>
        <?php if (!session()->get('cart')) {
            session()->put('cart', []);
        } ?>
        @foreach (session()->get('cart') as $key => $value)
            @if (in_array($key, array_keys(session()->get('cart'))))
                <tr>
                    <td>
                        <button type="button"
                            class="order btn btn-danger btn-sm"
                            wire:click="removeCart({{ $key }})">
                            <i class="fa fa-minus"></i>
                        </button>
                    </td>
                    <td>{{ \Modules\Mark\Entities\Brand::find(\Modules\Mark\Entities\Mark::find($key)->brand_id)->name }}
                    </td>
                    <td>{{ \Modules\Mark\Entities\Mark::find($key)->name }}
                    </td>
                    <td>
                        @if (\Modules\Stock\Entities\StockMark::where([['mark_id', $key], ['price_type_id', \Modules\Stock\Entities\Stock::find($stock_id)->price_type_id]])->first())
                            <?php
                              $max = \Modules\Stock\Entities\StockMark::where([['mark_id', $key], ['price_type_id', $stock->price_type_id]])->first();
                            ?>
                            {{ (float) $max['price'] * $main_currency->rate }}
                            {!! $max['bonus'] ? '<br> <span class="small">Bonus: ' . (float) $max['bonus'] * $main_currency->rate . '</span>' : '' !!}
                        @endif
                    </td>
                    <td>
                        @if (session()->get('product'))
                            <?php $keys = []; ?>
                            @foreach (session()->get('product') as $pr)
                                @if ($pr['mark_id'] == $key)
                                    @if (!in_array($pr['mark_id'], $keys))
                                        <input type="text"
                                            class="form-control form-control-sm"
                                            placeholder="Narx" required
                                            name="price[{{ $pr['mark_id'] }}]"
                                            onClick="this.select();"
                                            wire:model="priceResults.{{ $pr['mark_id'] }}"
                                            wire:key="post-field-{{ $pr['mark_id'] }}"
                                            wire:change="price()">
                                    @endif
                                    <?php
                                    $keys[] = $key;
                                    ?>
                                @endif
                            @endforeach
                        @endif
                    </td>
                    <td>
                        <button type="button"
                            class="btn btn-primary waves-effect waves-light"
                            data-bs-toggle="modal"
                            data-bs-target="#Mark_{{ $key }}">
                            Mahsulotlar
                        </button>
                        <button class="btn btn-outline-primary btn-sm"
                            data-bs-toggle="modal"
                            data-bs-target="#product{{ $key }}"
                            type="button"><i
                                class="mdi mdi-barcode"></i>
                            {{ isset($keys) ? '(' . count($keys) . ')' : '' }}
                        </button>
                    </td>
                </tr>
            @endif
        @endforeach
    </tbody>
</table>