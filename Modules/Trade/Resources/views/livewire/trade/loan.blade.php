<div class="container-fluid" xmlns:wire="http://www.w3.org/1999/xhtml">

    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-flex align-items-center justify-content-between">
                <h4 class="mb-0">Ombor <u>{{ \Modules\Stock\Entities\Stock::find(session()->get('stock')) ? \Modules\Stock\Entities\Stock::find(session()->get('stock'))->name : null }}</u>::<a
                        href="/invoices?type=loan"><span
                            class="text-primary">Nasiya</span></a></h4>


                @php(isset($data_id) ? $invoice = \Modules\Invoice\Entities\Invoice::find($data_id) : $invoice = null)
                @if($invoice)
                    <div class="d-flex justify-content-center align-items-center">
                        <a href="/invoices/{{ $invoice->id }}" style="margin-right: 15px;">
                            {!! $invoice ? '<h5 class="mb-0"> Invoice: ' . $invoice->name . '</h5>' : '' !!}
                        </a>
                        <a href="/trade_excel/{{ $invoice->id }}" class="btn btn-success" style="padding: 0 5px;">
                            Excel
                        </a>
                    </div>
                @endif
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                @include('trade::livewire.trade.trade')
                <form action="/orders" method="post">
                    @csrf
                    @if(isset($data_id))
                        <input type="hidden" name="data_id" value="{{ $data_id }}">
                        <input type="hidden" name="order_id"
                               value="{{ \Modules\Invoice\Entities\Order::where('invoice_id', $data_id)->first()->id }}">
                    @endif
                    <div class="card-body">
                        <!-- Nav tabs -->

                        <!-- Tab panes -->
                        <div class="tab-content p-3 text-muted">
                            <div class="tab-pane active" id="navtabs-1" role="tabpanel">
                                <div class="row" style="">
                                    <div class="col-md-8">
                                        <div class="card">
                                            <input type="hidden" name="type" value="2">
                                            <input type="hidden" name="stock_id" value="{{ session()->get('stock') }}">
                                            <div class="row align-items-end">
                                                <div class="col-md-2">
                                                    <div class="mb-3 position-relative">
                                                        <label class="col-form-label-sm"
                                                               for="validationTooltip02">Sana</label>
                                                        <input class="form-control form-control-sm" type="date" name="date"
                                                               value="{{ \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', now())->format('Y-m-d') }}"
                                                               id="example-date-input">
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="mb-3">
                                                        <label class="col-form-label-sm" for="quantity">Mahsulot soni
                                                            (Jami)</label>
                                                        <input type="text" class="form-control form-control-sm" name="quantity"
                                                               value="{{ session()->get('product')? count(session()->get('product')):'' }}"
                                                               readonly>
                                                    </div>
                                                </div>
{{--                                                <div class="col-md-4">--}}
{{--                                                    <div class="mb-3 position-relative">--}}
{{--                                                        <label class="col-form-label-sm" for="validationTooltip02">Mahsulot summasi (Jami)--}}
{{--                                                            ({{ $main_currency ? $main_currency->currency : null }})</label>--}}

{{--                                                        <input type="text" class="form-control form-control-sm" value="{{ $summ }}"--}}
{{--                                                               name="amount" readonly>--}}
{{--                                                    </div>--}}
{{--                                                </div>--}}
                                                <div class="col-md-2">
                                                    <div class="mb-3 position-relative" style="margin-right: 20px;">
                                                        <label class="col-form-label-sm" for="validationTooltip02"
                                                               style="display: flex">
                                                            Mijoz
                                                            <span class="badge bg-success font-size-12 ms-2"
                                                                  data-bs-toggle="modal" data-bs-target="#add_client">+Qo'shish</span>
                                                        </label>
                                                        <select name="client_id" class="form-control form-control-sm" id="">
                                                            <option value="{{ null }}"></option>
                                                            @foreach(\Modules\Client\Entities\Client::orderBy('name', 'asc')->get() as $client)
                                                                <option value="{{ $client->id }}"
                                                                        @if($invoice ? $invoice->client_id == $client->id : null) selected @endif >{{ $client->name }}</option>                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="mb-3 position-relative">
                                                        <label class="control-label">Ombor <br>
                                                            <span class="text-primary" wire:click="clearSelectStock()" style="cursor: pointer">
                                                                {{ $stock_id_select ? \Modules\Stock\Entities\Stock::find($stock_id_select)->name : null }}
                                                            </span>
                                                        </label>
                                                        <div style="position:relative">
                                                            <input type="hidden" name="stock_id" value="{{ $stock_id_select }}">
                                                            <input wire:model="inputsearchstock"
                                                                   class="form-control form-control-sm relative" type="text"
                                                                   placeholder="Ombor qidirish"/>
                                                        </div>
                                                        <div style="position:absolute; z-index:10000;">
                                                            @if(strlen($inputsearchstock)>0)
                                                                @if(count($searchstocks)>0)
                                                                    <ul class="list-group">

                                                                        @foreach($searchstocks as $searchstock)
                                                                            <li class="list-group-item list-group-item-action" style="border: 1px solid #ccc; cursor: pointer; padding: 4px 10px;">
                                                                                <div class="spinner-border text-info m-1" wire:loading
                                                                                     wire:target="selectstock({{$searchstock->id}})" role="status">
                                                                                </div>
                                                                                <span wire:loading.attr="disabled" wire:click.prevent="selectstock({{$searchstock->id}})">{{$searchstock->name}}</span>
                                                                            </li>
                                                                        @endforeach
                                                                    </ul>
                                                                @else
                                                                    <li class="list-group-item">Topilmadi!</li>
                                                                @endif
                                                            @endif
                                                        </div>
                                                    </div>
                                                </div>

                                                {{--                                                <div class="col-md-2">--}}
{{--                                                    <div class="mb-3 position-relative">--}}
{{--                                                        <button type="button"--}}
{{--                                                                class="order btn btn-primary"--}}
{{--                                                                wire:click="calculate()">--}}
{{--                                                            <i class="uil-refresh"></i> Hisoblash--}}
{{--                                                        </button>--}}
{{--                                                    </div>--}}
{{--                                                </div>--}}

                                            </div>

                                            <div class="row align-items-end justify-content-between">
                                                <div class="col-md-10 d-flex align-items-end">
                                                    <div class="mb-3 position-relative" style="margin-right: 20px;">
                                                        <label class="col-form-label-sm" for="validationTooltip02">Jami summa</label>
                                                        <input type="text" class="form-control form-control-sm" name="amount" value="{{ $summ }}" readonly="">
                                                    </div>
                                                        <div class="mb-3" style="margin-right: 20px;">
                                                            <label class="col-form-label-sm"
                                                                   for="main_currency_pay">{{ $main_currency->currency }}
                                                                ({{round($remainder, 2)}})</label>
                                                            <input type="hidden" name="main_currency_id"
                                                                   value="{{ $main_currency->id }}">
                                                            <input type="text" onClick="this.select();"
                                                                   class="form-control form-control-sm" name="main_currency_pay"
                                                                   wire:model="main_currency_pay"
{{--                                                                   wire:change="main_currency_payF()"--}}
                                                                   id="main_currency_pay"
                                                                   placeholder="Olindi" autocomplete="off" required/>
                                                        </div>

{{--                                                    @if($second_currency)--}}
{{--                                                        <div class="mb-3" style="margin-right: 20px;">--}}
{{--                                                            <label class="col-form-label-sm"--}}
{{--                                                                   for="second_currency_pay">{{ $second_currency->currency }}--}}
{{--                                                                ({{ $second_currency->icon }})</label>--}}
{{--                                                            <input type="hidden" name="second_currency_id"--}}
{{--                                                                   value="{{ $second_currency->id }}">--}}
{{--                                                            <input type="text" onClick="this.select();"--}}
{{--                                                                   class="form-control form-control-sm" name="second_currency_pay"--}}
{{--                                                                   wire:model="second_currency_pay" wire:change="second_currency_payF()"--}}
{{--                                                                   id="second_currency_pay" placeholder="Olindi"--}}
{{--                                                                   autocomplete="off"/>--}}
{{--                                                        </div>--}}
{{--                                                    @endif--}}

                                                    @if($second_currency)
                                                        @foreach (explode("|", $stock->second_currency_id) as $each_second_currency_id)
                                                            <div class="mb-3" style="margin-right: 20px;">
{{--                                                                {{ $remainder }}--}}
{{--                                                                {{ currency($each_second_currency_id)->rate }}--}}
                                                                <label class="col-form-label-sm"
                                                                       for="currency">{{ currency($each_second_currency_id)->currency }}
                                                                    ({{round($remainder*currency($each_second_currency_id)->rate, 2)}})</label>
                                                                <input type="hidden" name="second_currency_id[]"
                                                                       value="{{ $each_second_currency_id }}">
                                                                <input type="text" onClick="this.select();"
                                                                       class="form-control form-control-sm" name="second_currency_pay[]"
                                                                       wire:model="second_currency_pay_1.{{$each_second_currency_id}}"
                                                                       {{--                                                                           wire:change="second_currency_payF()"--}}
                                                                       id="currency" placeholder="Olindi"
                                                                       autocomplete="off"/>
                                                            </div>
                                                        @endforeach
                                                    @endif

                                                    <div class="mb-3 position-relative" style="margin-right: 20px;">
                                                        <label class="col-form-label-sm" for="validationTooltip02">Kelishuv
                                                            muddati</label>
                                                        <div class="d-flex">
                                                            <input type="text" class="form-control form-control-sm"
                                                                   name="date_agreement" onClick="this.select();"
                                                                   required placeholder="kun"
                                                                   value="{{ isset($this->order_detail) ? $this->order_detail->date_agreement : '' }}"/> &nbsp;
                                                            <h6 class="text-muted mt-2">kun</h6>
                                                        </div>
                                                    </div>
                                                    <div class="mb-3 position-relative" style="margin-right: 20px;">
                                                        <label for="" class="col-form-label-sm">Qoldiq summa {{ round($remainder, 2) }}
{{--                                                            {{ $price_agree }} --}}
                                                            {{ $main_currency->currency }}</label>
                                                        <input type="text" class="form-control form-control-sm"
{{--                                                               wire:model="price_agree_1"--}}
                                                               wire:model="remainder_second"
                                                               name="price_agreement" onClick="this.select();" required />
                                                    </div>
{{--                                                    <div class="mb-3 position-relative" style="margin-right: 20px;">--}}
{{--                                                        <label for="" class="col-form-label-sm">Valyuta kursi</label>--}}
{{--                                                        <input type="text" class="form-control form-control-sm" value="{{ $price_agree_1 ? round($price_agree * $second_currency->rate/$price_agree_1, 2, 0) : 0}}"--}}
{{--                                                               name="second_currency_rate" onClick="this.select();" required readonly--}}
{{--                                                        />--}}
{{--                                                    </div>--}}
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="mb-3 position-relative">
                                                        @if($main_currency)
                                                        <label class="col-form-label-sm"
                                                               for="validationTooltip02">Chegirma {{ $main_currency->currency }}
                                                            ({{ $main_currency->icon }})</label>
                                                        <input type="text" class="form-control form-control-sm" name="discount"
                                                               wire:model="discount"
{{--                                                               wire:change="discountF()"--}}
                                                               onClick="this.select();">
                                                        @endif
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 align-content-end" style="">
                                        <div class="col-md-12">
                                            <div class="col-md-12 mb-3 d-flex">
                                                <input type="text" wire:model="searchTerm"
                                                       class="form-control form-control-sm"
                                                       placeholder="Mahsulot modeli"
                                                       autocomplete="off">
                                                <button wire:click="removeAll" type="button" class="btn btn-danger">
                                                    Yig'imni tozalash
                                                </button>
                                            </div>
                                            <div>
                                                <table id="datatable" class="table table-bordered dt-responsive nowrap"
                                                       style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                    <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>Turi</th>
                                                        <th>Brend</th>
                                                        <th>Model</th>
                                                        <th>Versiya</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <?php if (!session()->get('cart')) {
                                                        session()->put('cart', []);
                                                    } ?>
                                                    @foreach($searchTermData as $datum)
                                                        @if(!in_array($datum->id, array_keys(session()->get('cart'))))
                                                            <tr>
                                                                <td>
                                                                    <button type="button"
                                                                            class="order btn btn-success btn-sm"
                                                                            wire:click="addCart({{$datum->id}})">
                                                                        <i class="fa fa-plus"></i>
                                                                    </button>
                                                                </td>
                                                                <td>{{ \Modules\Mark\Entities\Type::find($datum->type_id)->name }}</td>
                                                                <td>{{ \Modules\Mark\Entities\Brand::find($datum->brand_id)->name }}</td>
                                                                <td>{{ $datum->name }}
                                                                    ({{ count(\Modules\Product\Entities\Product::where([['mark_id', $datum->id],['stock_id', session()->get('stock')]])->get()) }}
                                                                    )
                                                                </td>
                                                                <td>{{ $datum->version }}</td>
                                                            </tr>
                                                        @endif
                                                    @endforeach
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-md-12">
                                        <div class="card">
                                            <table id="datatable" class="table table-bordered dt-responsive nowrap"
                                                   style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>Brend</th>
                                                    <th>Model</th>
                                                    {{--<th>IMEI</th>--}}
                                                    <th>Taklifdagi narx</th>
                                                    <th>Narx</th>
                                                    <th>Mahsulot</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <?php if (!session()->get('cart')) {
                                                    session()->put('cart', []);
                                                } ?>

                                                @foreach(session()->get('cart') as  $key=>$value)
                                                    @if(in_array($key, array_keys(session()->get('cart'))))
                                                        <tr>
                                                            <td>
                                                                <button type="button"
                                                                        class="order btn btn-danger btn-sm"
                                                                        wire:click="removeCart({{$key}})">
                                                                    <i class="fa fa-minus"></i>
                                                                </button>
                                                            </td>
                                                            <td>{{ \Modules\Mark\Entities\Brand::find(\Modules\Mark\Entities\Mark::find($key)->brand_id)->name }}</td>
                                                            <td>{{ \Modules\Mark\Entities\Mark::find($key)->name }}</td>
                                                            {{--<td style="display: flex">--}}
                                                                {{--<?php if (!session()->get('product')) {--}}
                                                                    {{--session()->put('product', []);--}}
                                                                {{--} ?>--}}
                                                                {{--@foreach(session()->get('product') as $p)--}}
                                                                    {{--@if($p['mark_id'] == $key)--}}
                                                                        {{--<div--}}
                                                                            {{--style="background: #34c38f; border-radius: 5px;padding: 5px; color: #fff">--}}
                                                                            {{--<input type="hidden"--}}
                                                                                   {{--name="products[{{$p['mark_id']}}][]"--}}
                                                                                   {{--value="{{ $p['id'] }}">--}}
                                                                            {{--&nbsp; {{ \Modules\Product\Entities\Product::find($p['id'])->imei }}--}}
                                                                            {{--&nbsp;--}}
                                                                            {{--<button type="button"--}}
                                                                                    {{--class="btn btn-danger btn-sm"--}}
                                                                                    {{--data-bs-dismiss="modal"--}}
                                                                                    {{--aria-label="Close"--}}
                                                                                    {{--wire:click="removeProduct({{$p['id']}})">--}}
                                                                                {{--<i class="fa fa-minus"></i>--}}
                                                                            {{--</button>--}}
                                                                        {{--</div> &nbsp;--}}
                                                                    {{--@endif--}}
                                                                {{--@endforeach--}}
                                                            {{--</td>--}}
                                                            <td>
{{--                                                                @if(\Modules\Stock\Entities\StockMark::where([['mark_id', $key], ['price_type_id', \Modules\Stock\Entities\Stock::find(auth()->user()->stock_id)->price_type_id]])->first())--}}
{{--                                                                    <?php--}}
{{--                                                                    $max = (double)\Modules\Stock\Entities\StockMark::where([['mark_id', $key], ['price_type_id', \Modules\Stock\Entities\Stock::find(auth()->user()->stock_id)->price_type_id]])->first()['price'];--}}
{{--                                                                    ?>--}}
{{--                                                                    {{ $max*$main_currency->rate }}--}}
{{--                                                                @endif--}}
                                                                    @if(\Modules\Stock\Entities\StockMark::where([['mark_id', $key], ['price_type_id', \Modules\Stock\Entities\Stock::find(session()->get('stock'))->price_type_id]])->first())
                                                                        <?php
                                                                        $max = \Modules\Stock\Entities\StockMark::where([['mark_id', $key], ['price_type_id', $stock->price_type_id]])->first();
                                                                        ?>
                                                                        {{ (double)$max['price']*$main_currency->rate }}

                                                                        {!! $max['bonus'] ? '<br> <span class="small">Bonus: '.(double)$max['bonus']*$main_currency->rate . '</span>' : '' !!}
                                                                    @endif
                                                            </td>
                                                            <td>
                                                                @if(session()->get('product'))
                                                                    <?php $keys = []?>
                                                                    @foreach(session()->get('product') as $pr)
                                                                        @if($pr['mark_id'] == $key)
                                                                            @if(!in_array($pr['mark_id'], $keys))
                                                                                <input type="text" class="form-control form-control-sm"
                                                                                       placeholder="Narx" required
                                                                                       name="price[{{ $pr['mark_id'] }}]"
                                                                                       onClick="this.select();"
                                                                                       wire:model="priceResults.{{ $pr['mark_id'] }}"
                                                                                       wire:key="post-field-{{ $pr['mark_id'] }}"
                                                                                       wire:change="price()"
                                                                                >
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
                                                                        data-bs-target="#Mark_{{$key}}">
                                                                    Mahsulotlar
                                                                </button>
                                                                <button class="btn btn-outline-primary btn-sm"
                                                                        data-bs-toggle="modal" data-bs-target="#product{{$key}}"
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
                                            @foreach(session()->get('cart') as  $key=>$value)
                                                @if(in_array($key, array_keys(session()->get('cart'))))

                                                    <div class="modal fade bs-example-modal-xl" tabindex="-1" role="dialog"
                                                         aria-labelledby="product{{$key}}" id="product{{$key}}"
                                                         aria-hidden="false">
                                                        <div class="modal-dialog modal-xl">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="myExtraLargeModalLabel">IMEI: {{ \Modules\Mark\Entities\Mark::find($key)->name }}</h5>
                                                                    {{--<button type="button"  class="order btn btn-danger btn-sm"  data-bs-dismiss="modal" aria-label="Close"--}}
                                                                    {{--wire:click="removeImeiMark({{ $key }})">Hammasini o'chirish</button>--}}
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div style="display: flex; margin-bottom: 5px">
                                                                        <?php if (!session()->get('product')) {
                                                                            session()->put('product', []);
                                                                        } ?>
                                                                        @foreach(session()->get('product') as $p)
                                                                            @if($p['mark_id'] == $key)
                                                                                <div
                                                                                    style="background: #34c38f; border-radius: 5px;padding: 5px; color: #fff">
                                                                                    <input type="hidden"
                                                                                           name="products[{{$p['mark_id']}}][]"
                                                                                           value="{{ $p['id'] }}">
                                                                                    &nbsp; {{ \Modules\Product\Entities\Product::find($p['id'])->imei }}
                                                                                    &nbsp;
                                                                                    <button type="button"
                                                                                            class="btn btn-danger btn-sm"
                                                                                            data-bs-dismiss="modal"
                                                                                            aria-label="Close"
                                                                                            wire:click="removeProduct({{$p['id']}})">
                                                                                        <i class="fa fa-minus"></i>
                                                                                    </button>
                                                                                </div> &nbsp;
                                                                            @endif
                                                                        @endforeach
                                                                    </div>
                                                                    <hr>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                @endif
                                            @endforeach
                                        </div>

                                        @foreach(session()->get('cart') as  $key=>$value)
                                            @if(in_array($key, array_keys(session()->get('cart'))))
                                                <div class="modal fade bs-example-modal-xl" tabindex="-1" role="dialog"
                                                     aria-labelledby="Mark_{{$key}}" id="Mark_{{$key}}"
                                                     aria-hidden="false">
                                                    <div class="modal-dialog modal-xl">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title"
                                                                    id="myExtraLargeModalLabel">{{ \Modules\Mark\Entities\Mark::find($key)->name }}</h5>
                                                                <button type="button" class="btn-close"
                                                                        data-bs-dismiss="modal" aria-label="Close">
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="row">
                                                                    <div class="col-md-3">
                                                                        <div class="nav flex-column nav-pills"
                                                                             id="v-pills-tab" role="tablist"
                                                                             aria-orientation="vertical">
                                                                            @foreach(\Modules\Product\Entities\Shipment::where('mark_id', $key)->get() as $cp)
                                                                                <a class="nav-link mb-2"
                                                                                   id="v-pills-{{ $cp->id }}-tab"
                                                                                   data-bs-toggle="pill"
                                                                                   href="#v-pills-{{ $cp->id }}"
                                                                                   role="tab"
                                                                                   aria-controls="v-pills-{{ $cp->id }}"
                                                                                   aria-selected="false">
                                                                                    {{ \Modules\Client\Entities\Client::find($cp->client_id)->name }}
                                                                                    -
                                                                                    {{ \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $cp->created_at)->format('d.m.Y') }}
                                                                                    -
                                                                                    ({{ count(\Modules\Product\Entities\Product::where([['mark_id', $key],['stock_id', session()->get('stock')],['shipment_id', $cp->id], ['order_id', null]])->get()) }}
                                                                                    )
                                                                                </a>
                                                                            @endforeach
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-9">
                                                                        <div class="tab-content text-muted mt-4 mt-md-0"
                                                                             id="v-pills-tabContent">
                                                                            @foreach(\Modules\Product\Entities\Shipment::where('mark_id', $key)->get() as $cp)
                                                                                <div class="tab-pane fade"
                                                                                     id="v-pills-{{ $cp->id }}"
                                                                                     role="tabpanel"
                                                                                     aria-labelledby="v-pills-{{ $cp->id }}-tab">
                                                                                    <table id="datatable"
                                                                                           class="table table-bordered dt-responsive nowrap"
                                                                                           style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                                                        <thead>
                                                                                        <tr>
                                                                                            <th></th>
                                                                                            <th>IMEI</th>
                                                                                            <th>Narxi</th>
                                                                                        </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                        <?php if (!session()->get('product')) {
                                                                                            session()->put('product', []);
                                                                                        } ?>
                                                                                        @foreach(\Modules\Product\Entities\Product::where([['shipment_id', $cp->id],['stock_id', session()->get('stock')], ['order_id', null]])->get() as $product)
                                                                                            <tr>
                                                                                                <td>
                                                                                                    @if(!in_array($product->id, array_keys(session()->get('product'))))
                                                                                                        <button
                                                                                                            type="button"
                                                                                                            class="btn btn-success btn-sm"
                                                                                                            data-bs-dismiss="modal"
                                                                                                            aria-label="Close"
                                                                                                            wire:click="addProduct({{$product->id}})">
                                                                                                            <i class="fa fa-plus"></i>
                                                                                                        </button>
                                                                                                    @else
                                                                                                        <button
                                                                                                            type="button"
                                                                                                            class="btn btn-danger btn-sm"
                                                                                                            data-bs-dismiss="modal"
                                                                                                            aria-label="Close"
                                                                                                            wire:click="removeProduct({{$product->id}})">
                                                                                                            <i class="fa fa-minus"></i>
                                                                                                        </button>
                                                                                                    @endif
                                                                                                </td>
                                                                                                <td>{{ $product->imei }}</td>
                                                                                                <?php
                                                                                                    $price_type = \Modules\Stock\Entities\Stock::find(session()->get('stock'))->price_type_id;
                                                                                                ?>
                                                                                                <td>{{ (double)\Modules\Stock\Entities\StockMark::where([['price_type_id', $price_type],['mark_id', $key]])->first()->price }}</td>
                                                                                            </tr>
                                                                                        @endforeach
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                            @endforeach
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                                <div class="mb-3 position-relative text-right">
                                    <button class="btn btn-success" type="submit">Saqlash</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <div class="modal fade bs-example-modal-xl" tabindex="-1" role="dialog"
                     aria-labelledby="add_client" id="add_client"
                     aria-hidden="false">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="myExtraLargeModalLabel">Mijoz qo'shish</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label class="col-form-label-sm" for="validationCustom01">Ismi</label>
                                            <input type="text" class="form-control form-control-sm" wire:model="client_name"
                                                   id="validationCustom01"
                                                   placeholder="Имя клиента" required>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label class="col-form-label-sm" for="validationCustom01">Ma'lumot</label>
                                            <textarea type="text" class="form-control form-control-sm" wire:model="client_description"
                                                      id="validationCustom01"
                                                      required cols="2" rows="1"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label class="col-form-label-sm" for="validationCustom01">Tur</label>
                                            <input type="text" class="form-control form-control-sm" wire:model="client_type"
                                                   id="validationCustom01"
                                                   placeholder="Тип клиента" required>
                                        </div>
                                    </div>
                                </div>
                                <button class="btn btn-primary" type="button" wire:click="addClient()"
                                        data-bs-dismiss="modal" aria-label="Close">Добавить клиента
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="/assets/js/pages/datatables.init.js"></script>
<script>
    document.getElementsByTagName("input").addEventListener("focus", function () {
        this.select();
    });

    function modal_close() {
        // $('.modal-backdrop').hide();
    }

    function modal_open() {
        // $('.modal-backdrop').show();
    }
</script>
