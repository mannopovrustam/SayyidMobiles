
<div xmlns:wire="http://www.w3.org/1999/xhtml">
    <div class="table-responsive">
        <style>
            th{ vertical-align: top; }
        </style>
        <table class="table table-sm table-hover table-bordered table-striped table-nowrap align-middle">
            <thead>
            <form action="/export_products" method="get" id="export_products">
                <tr>
                    <th>Shaxobcha
                        <select name="stock_id" class="form-control form-control-sm" wire:model="stock_id" wire:change="products()" id="">
                            <option value="">Barchasi</option>
                            @foreach(\Modules\Stock\Entities\Stock::all() as $stocks)
                                <option value="{{ $stocks->id }}" @if($stocks->id == $stock_id) selected @endif>{{ $stocks->name }}</option>
                            @endforeach
                        </select>
                    </th>
                    {{--<th>Turi <input type="text" class="form-control form-control-sm" wire:model="type" value="{{ $type }}"></th>--}}
                    <th>Brend <input name="brand" type="text" class="form-control form-control-sm" wire:model="brand" wire:change="products()" value="{{ $brand }}"></th>
                    <th>Mahsulot <input name="name" type="text" class="form-control form-control-sm" wire:model="name" wire:change="products()" value="{{ $name }}"></th>
                    <th>
                        Savdo {{ $start }} : {{ $end }}
                        <div class="input-daterange input-group" id="datepicker6" data-provide="datepicker" data-date-container='#datepicker6'>
                            <input type="date" name="start" class="form-control form-control-sm" wire:model="start" wire:change="products()" value="{{ $start }}" placeholder="Sanadan"/>
                            <input type="date" name="end" class="form-control form-control-sm" wire:model="end" wire:change="products()" value="{{ $end }}" placeholder="Sanagacha"/>
                        </div>
                    </th>
                    <th>Qoldiq <input type="text" name="residue" class="form-control form-control-sm" wire:model="residue" wire:change="products()"></th>
                    <th>Ombor valyutasi</th>
                    <th>Hozirgi narx</th>
                    <th>Narx</th>
                    <th>Bonus</th>
                    <th>O'rtacha narx</th>
                </tr>
            </form>
            </thead>
                <?php
                    $statement[] = true;
                ?>
            <tbody>
                @foreach($all_products as $all_product)
                    <?php
                        if ($brand){
                            $statement[] = $all_product['brand_name'] == $brand;
                        }
                        if ($name){
                            $statement[] = $all_product['mark_name'] == $name;
                        }
                        if ($residue){
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
                            <td>{{ currency(1)->icon . ' ' . $all_product['price'] }}</td>
                            <td>
                                <?php $markId = $all_product['mark_id']; ?>
                                <input type="hidden" wire:model="data_id.{{$markId}}" value="{{$data_id[$markId]}}">
                                <input type="hidden" wire:model="price_type_id.{{$markId}}" value="{{$price_type_id[$markId]}}">
                                <input type="hidden" wire:model="mark_id.{{$markId}}" value="{{$mark_id[$markId]}}">
                                <input type="hidden" wire:model="main_currency_id.{{$markId}}" value="{{$main_currency_id[$markId]}}">
                                <input type="hidden" wire:model="currency_id.{{$markId}}" value="{{$currency_id[$markId]}}">
                                <input type="text"   wire:model="price.{{$markId}}" style="width: 80px;height: 20px;" value="{{$price[$markId]}}">
                            </td>
                            <td>
                                <input type="text" wire:model="bonus.{{$markId}}" style="width: 80px;height: 20px;" value="{{$bonus[$markId]}}">
                                <i class="text-primary fa fa-save" style="cursor: pointer" wire:click="storeMark({{$markId}})"></i>
                            </td>
                            <td>{{ $all_product['average'] }}</td>
                        </tr>
                    @endif
                @endforeach


            {{--@if($residues)--}}
                {{--@foreach($all_products as $mark)--}}
                    {{--@if($residues == $mark['residue'])--}}
                        {{--<tr>--}}
                            {{--<td>{{ $stock != 'all' ? \Modules\Stock\Entities\Stock::find($stock)->name : '' }}</td>--}}
                            {{--<td>{{ $mark['brand_id'] }}</td>--}}
                            {{--<td>{{ $mark['name'] }}</td>--}}
                            {{--<td>{{ $mark['order'] }}</td>--}}
                            {{--<td>{{ $mark['residue'] }}</td>--}}
                        {{--</tr>--}}
                    {{--@endif--}}
                {{--@endforeach--}}
            {{--@else--}}
                {{--@foreach($all_products as $mark)--}}
                    {{--<tr>--}}
                        {{--<td>{{ $stock != 'all' ? \Modules\Stock\Entities\Stock::find($stock)->name : '' }}</td>--}}
                        {{--<td>@if($mark['brand_id'])--}}
                                {{--{{$mark['brand_id']}}--}}
                            {{--@endif</td>--}}
                        {{--<td>{{ $mark['name'] }}</td>--}}
                        {{--<td>{{ $mark['order'] }}</td>--}}
                        {{--<td>{{ $mark['residue'] }}</td>--}}
                    {{--</tr>--}}
                {{--@endforeach--}}
            {{--@endif--}}
            </tbody>
        </table>
        <?php
//            dd($products_setting);
        ?>
    </div>
</div>
