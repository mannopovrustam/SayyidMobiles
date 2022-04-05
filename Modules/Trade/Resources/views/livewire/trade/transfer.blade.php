<div xmlns:wire="http://www.w3.org/1999/xhtml">
    <!-- DataTables -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-flex align-items-center justify-content-between">
                <h4 class="mb-0">Ombor <u>{{ \Modules\Stock\Entities\Stock::find($stock_id) ? \Modules\Stock\Entities\Stock::find($stock_id)->name : null }}</u>::<a href="/transfers"><span class="text-primary">O'tkazma</span></a></h4>
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
                    $products = session()->get('product') ? session()->get('product') : [];
                ?>
                <form action="/transfers" method="post" onkeydown="return event.key != 'Enter';">
                    @csrf
                    @if(isset($data_id))
                        <input type="hidden" name="data_id" value="{{ $data_id }}">
                    @endif
                    <b>{!! $transfer ? '<input type="hidden" name="name" value="'. $transfer->name .'">' : '' !!}</b>
                    <input type="hidden" name="stock_from" value="{{ $stock_id }}">
                    <div class="card-body">
                        <!-- Nav tabs -->

                        <!-- Tab panes -->
                        <div class="tab-content p-3 text-muted">
                            <div class="tab-pane active" id="navtabs-1" role="tabpanel">
                                <div class="row" style="">
                                    <div class="col-md-8">
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
                                                        <label class="col-form-label-sm" for="validationTooltip02" style="display: flex">
                                                            Ombor
                                                        </label>
                                                        <select name="stock_to" class="form-control form-control-sm" id="" required>
                                                            <option value="{{ null }}"></option>
                                                            @foreach(\Modules\Stock\Entities\Stock::orderBy('name', 'asc')->get() as $stock)
                                                                @if($stock_id != $stock->id)
                                                                    <option @if($transfer ? $transfer->stock_to == $stock->id : null) selected @endif value="{{ $stock->id }}">{{ $stock->name }}</option>
                                                                @endif
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3 position-relative">
                                                        <label class="col-form-label-sm" for="validationTooltip02">Izoh</label>
                                                        <input type="text" class="form-control form-control-sm" name="note" value="{{ $transfer ? $transfer->note : ''}}">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 align-content-end" style="">
                                        <div class="col-md-12">
                                            <div class="col-md-12 mb-3 d-flex">
                                                <input type="text" wire:model="searchTerm"
                                                       class="form-control form-control-sm" placeholder="Mahsulot modeli"
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
                                                        <th>Brend</th>
                                                        <th>Model</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <?php if (!session()->get('cart')) {
                                                        session()->put('cart', []);
                                                    } ?>
                                                    @foreach($searchTermData as $datum)
                                                        @if(
                                                        !in_array($datum->id, array_keys(session()->get('cart'))) &&
                                                        count(\Modules\Product\Entities\Product::where([['mark_id', $datum->id],['stock_id', $stock_id]])->get()) > 0
                                                        )
                                                            <tr>
                                                                <td>
                                                                    <button type="button"
                                                                            class="order btn btn-success btn-sm"
                                                                            wire:click="addCart({{$datum->id}})">
                                                                        <i class="fa fa-plus"></i>
                                                                    </button>
                                                                </td>
                                                                <td>{{ \Modules\Mark\Entities\Brand::find($datum->brand_id)->name }}</td>
                                                                <td>{{ $datum->name }}
                                                                    ({{ count(\Modules\Product\Entities\Product::where([['mark_id', $datum->id],['stock_id', $stock_id]])->get()) }})
                                                                </td>
                                                            </tr>
                                                        @endif
                                                    @endforeach
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-md-12">
                                        <div>
                                            <table id="datatable" class="table table-bordered dt-responsive nowrap"
                                                   style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>Brend</th>
                                                    <th>Model</th>
                                                    <th>Soni</th>
                                                    <th>Mahsulot</th>
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
                                                            <td>
                                                                <button type="button"
                                                                        class="order btn btn-danger btn-sm"
                                                                        wire:click="removeCart({{$key}})">
                                                                    <i class="fa fa-minus"></i>
                                                                </button>
                                                            </td>
                                                            <td>{{ \Modules\Mark\Entities\Brand::find(\Modules\Mark\Entities\Mark::find($key)->brand_id)->name }}</td>
                                                            <td>{{ \Modules\Mark\Entities\Mark::find($key)->name }}</td>
                                                            <td>
                                                                {{ $product_count }}
                                                            </td>
                                                            <td>
                                                                <button type="button"
                                                                        class="btn btn-primary waves-effect waves-light"
                                                                        data-bs-toggle="modal"
                                                                        data-bs-target="#Mark_{{$key}}">
                                                                    Mahsulotlar
                                                                </button>
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
                                            <button class="btn btn-success" type="submit">Saqlash</button>
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
</div>

@push('styles')
    <link href="{{ asset('assets/libs/bootstrap-tagsinput/bootstrap-tagsinput.css') }}" rel="stylesheet"
          type="text/css"/>
@endpush
@push('scripts')
    <script src="{{ asset('assets/js/pages/bootstrap-tagsinput.min.js') }}"></script>
@endpush
