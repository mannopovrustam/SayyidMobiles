@extends('layouts.app')

@section('content')
    <?php
        $data_id = $id
    ?>
        <!-- DataTables -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-flex align-items-center justify-content-between">
                    <h4 class="mb-0">Ombor <u>{{ \Modules\Stock\Entities\Stock::find($stock_id) ? \Modules\Stock\Entities\Stock::find($stock_id)->name : null }}</u>::<a href="/acceptances"><span class="text-primary">Qabul</span></a></h4>
                    @if(isset($data_id))
                        <input type="hidden" name="data_id" value="{{ $data_id }}">
                    @endif

                    @php(isset($data_id) ? $transfer = \Modules\Trade\Entities\Transfer::find($data_id) : $transfer = null)
                    <h5 class="mb-0">{!! $transfer ? 'Invoice: '.$transfer->name:''!!}</h5>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    @include('trade::livewire.trade.trade')
                    <?php
                        foreach (explode(",", $transfer->products) as $value){
                            $products[$value] = ['id'=>$value, 'mark_id'=>\Modules\Product\Entities\Product::find($value)->mark_id];
                        }
                        $cart = session()->get('cart');
                        foreach ($products as $product){
                            $cart[$product['mark_id']] = ["id" => $product['mark_id']];
                        }
                        session()->put('cart', $cart);
                        session()->put('product', $products);
                    ?>
                    <form action="/transfers" method="post" onkeydown="return event.key != 'Enter';">
                        @csrf
                        @if(isset($data_id))
                            <input type="hidden" name="data_id" value="{{ $data_id }}">
                        @endif
                        <input type="hidden" name="stock_from" value="{{ $transfer->stock_from }}">
                        <input type="hidden" name="stock_to" value="{{ $transfer->stock_to }}">
                        <b>{!! $transfer ? '<input type="hidden" name="name" value="'. $transfer->name .'">' : '' !!}</b>
                        <div class="card-body">
                            <div class="tab-content p-3 text-muted">
                                <div class="tab-pane active" id="navtabs-1" role="tabpanel">
                                    <div class="row" style="">
                                        <div class="col-md-12">
                                            <div>
                                                <div class="row align-items-end">
                                                    <div class="col-md-2">
                                                        <div class="mb-3 position-relative">
                                                            <label class="col-form-label-sm"
                                                                   for="validationTooltip02">Sana</label>
                                                            <input class="form-control form-control-sm" type="date" name="date"
                                                                   value="{{ $transfer ? $transfer->date : \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', now())->format('Y-m-d') }}"
                                                                   id="example-date-input">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="mb-3">
                                                            <label class="col-form-label-sm" for="quantity">Mahsulot soni
                                                                (Jami)</label>
                                                            <input type="text" class="form-control form-control-sm" name="quantity"
                                                                   value="{{ count($products) }}"
                                                                   readonly>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="mb-3 position-relative">
                                                            <label class="col-form-label-sm" for="validationTooltip02">Ombordan</label>
                                                            <input type="text" class="form-control form-control-sm" value="{{ $transfer ? \Modules\Stock\Entities\Stock::find($transfer->stock_from)->name : ''}}" readonly>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="mb-3 position-relative">
                                                            <label class="col-form-label-sm" for="validationTooltip02">Omborga</label>
                                                            <input type="text" class="form-control form-control-sm" value="{{ $transfer ? \Modules\Stock\Entities\Stock::find($transfer->stock_to)->name : ''}}" readonly>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="mb-3 position-relative">
                                                            <label class="col-form-label-sm" for="validationTooltip02">Izoh</label>
                                                            <input type="text" class="form-control form-control-sm" name="note" value="{{ $transfer ? $transfer->note : ''}}">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div>
                                                <table id="datatable" class="table table-bordered dt-responsive nowrap"
                                                       style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                    <thead>
                                                    <tr>
                                                        <th>Brend</th>
                                                        <th>Model</th>
                                                        <th>Soni</th>
                                                        <th>IMEI</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <?php if (!session()->get('cart')) {
                                                        session()->put('cart', []);
                                                    } ?>

                                                    @foreach(session()->get('cart') as  $key=>$value)
                                                        @if(in_array($key, array_keys(session()->get('cart'))))
                                                            <?php $product_count = 0; ?>
                                                            @foreach($products as $p)
                                                                @if($p['mark_id'] == $key)
                                                                    <?php $product_count += 1; ?>
                                                                @endif
                                                            @endforeach

                                                            <input type="hidden" name="mark_id[{{$key}}]" value="{{$key}}">
                                                            <tr>
                                                                <td>{{ \Modules\Mark\Entities\Brand::find(\Modules\Mark\Entities\Mark::find($key)->brand_id)->name }}</td>
                                                                <td>{{ \Modules\Mark\Entities\Mark::find($key)->name }}</td>
                                                                <td>
                                                                    {{ $product_count }}
                                                                </td>
                                                                <td>
                                                                    <div class="input-group">
                                                                        <div class="input-group-append">
                                                                            <button class="btn btn-outline-primary btn-sm"
                                                                                    data-bs-toggle="modal" data-bs-target="#imei{{$key}}"
                                                                                    type="button"><i
                                                                                        class="mdi mdi-barcode"></i> ({{ $product_count }})</button>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>


                                                        @endif
                                                    @endforeach
                                                    </tbody>
                                                </table>

                                                @foreach(session()->get('cart') as  $key=>$value)
                                                    @if(in_array($key, array_keys(session()->get('cart'))))
                                                        <div class="modal fade bs-example-modal-xl" tabindex="-1"
                                                             role="dialog"
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
                                                                                        @if(count(\Modules\Product\Entities\Product::where([['mark_id', $key],['stock_id', $stock_id],['shipment_id', $cp->id], ['order_id', null]])->get())>0)
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
                                                                                                ({{ count(\Modules\Product\Entities\Product::where([['mark_id', $key],['stock_id', $stock_id],['shipment_id', $cp->id], ['order_id', null]])->get()) }}
                                                                                                )
                                                                                            </a>
                                                                                        @endif
                                                                                    @endforeach
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-9">
                                                                                <div
                                                                                        class="tab-content text-muted mt-4 mt-md-0"
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
                                                                                                @foreach(\Modules\Product\Entities\Product::where([['shipment_id', $cp->id],['stock_id', $stock_id],['order_id', null]])->get() as $product)
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <button
                                                                                                                    type="button"
                                                                                                                    data-bs-dismiss="modal"
                                                                                                                    aria-label="Close"
                                                                                                                    @if(!in_array($product->id, array_keys(session()->get('product'))))
                                                                                                                    class="btn btn-success btn-sm"
                                                                                                                    wire:click="addProduct({{$product->id}})">
                                                                                                                <i class="fa fa-plus"></i>
                                                                                                                @else
                                                                                                                    class="btn
                                                                                                                    btn-danger
                                                                                                                    btn-sm"
                                                                                                                    wire:click="removeProduct({{$product->id}}
                                                                                                                    )">
                                                                                                                    <i class="fa fa-minus"></i>
                                                                                                                @endif
                                                                                                            </button>
                                                                                                        </td>
                                                                                                        <td>{{ $product->imei }}</td>
                                                                                                        <td>{{ (double)\Modules\Stock\Entities\StockMark::where([['stock_id', $stock_id],['mark_id', $product->mark_id]])->first() }}</td>
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

                                                @foreach(session()->get('cart') as  $key=>$value)
                                                    @if(in_array($key, array_keys(session()->get('cart'))))

                                                        <div class="modal fade bs-example-modal-xl" tabindex="-1" role="dialog"
                                                             aria-labelledby="imei{{$key}}" id="imei{{$key}}"
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
                                            <div class="mt-3 position-relative" style="float: right">
                                                @if($transfer->status == 1)
                                                    <input type="hidden" name="status" value="0">
                                                    <button class="btn btn-danger"  type="submit">Bekor qilish</button>
                                                @else
                                                    @if($transfer->stock_to == auth()->user()->stock_id)
                                                        <input type="hidden" name="status" value="1">
                                                        <button class="btn btn-success" type="submit">Qabul qilish</button>
                                                    @endif
                                                    @if($transfer->stock_from == auth()->user()->stock_id)
                                                        <h4 class="text-warning bg-soft-warning">Yo'lda</h4>
                                                    @endif
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    @push('styles')
        <link href="{{ asset('assets/libs/bootstrap-tagsinput/bootstrap-tagsinput.css') }}" rel="stylesheet"
              type="text/css"/>
    @endpush
    @push('scripts')
        <script src="{{ asset('assets/js/pages/bootstrap-tagsinput.min.js') }}"></script>
    @endpush
@endsection
