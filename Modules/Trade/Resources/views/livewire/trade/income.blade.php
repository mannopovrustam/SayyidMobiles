<div xmlns:wire="http://www.w3.org/1999/xhtml">
<!-- DataTables -->
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-flex align-items-center justify-content-between">
                <h4 class="mb-0">Ombor <u>{{ \Modules\Stock\Entities\Stock::find($stock_id) ? \Modules\Stock\Entities\Stock::find($stock_id)->name : null }}</u>::<a href="/invoices?type=income"><span class="text-primary">Kirim</span></a></h4>
                @if(isset($data_id))
                    <input type="hidden" name="data_id" value="{{ $data_id }}">
                @endif

                @php(isset($data_id) ? $invoice = \Modules\Invoice\Entities\Invoice::find($data_id) : $invoice = null)
                <h5 class="mb-0">{!! $invoice ? 'Invoice: '.$invoice->name:''!!}</h5>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                @include('trade::livewire.trade.trade')
                <form action="/invoices" method="post" onkeydown="return event.key != 'Enter';">
                    @csrf
                    @if(isset($data_id))
                        <input type="hidden" name="data_id" value="{{ $data_id }}">
                    @endif
                    <b>{!! $invoice ? '<input type="hidden" name="invoice" value="'. $invoice->name .'">' : '' !!}</b>
                    <input type="hidden" name="type" value="4">
                    <input type="hidden" name="stock_id" value="{{ $stock_id }}">
                    <input type="hidden" name="stock_acc_id" value="{{ $stock_id }}">
                    <div class="card-body">
                        <!-- Nav tabs -->

                    <!-- Tab panes -->
                        <div class="tab-content p-3 text-muted">
                            <div class="tab-pane active" id="navtabs-1" role="tabpanel">
                                <div class="row" style="">
                                    <div class="col-md-8">
                                        <div>
                                            <input type="hidden" name="order_type" value="4">
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
                                                <?php
                                                $count_products = 0;
                                                $summ_products = 0;
                                                $summ_products_expand = 0;
                                                if (session()->get('cart')){
                                                    foreach (session()->get('cart') as  $key=>$value){
//                                                        $sum_pr1 = (isset($price[$key])?$price[$key]:0) ? (isset($price[$key])?$price[$key]:0) : 0
                                                        $count_products += isset($quantity[$key])?$quantity[$key]:0;
                                                        $summ_products += ((isset($price[$key])?$price[$key]:0) ? (isset($price[$key])?$price[$key]:0) : 0) * ((isset($quantity[$key])?$quantity[$key]:0) ? (isset($quantity[$key])?$quantity[$key]:0) : 0);
                                                        $summ_products_expand += (isset($summ_single[$key])?$summ_single[$key]:0) * (isset($quantity[$key])?$quantity[$key]:0);
                                                    }
                                                }
                                                ?>

                                                <div class="col-md-2">
                                                    <div class="mb-3">
                                                        <label class="col-form-label-sm" for="quantity">Mahsulot soni
                                                            (Jami)</label>
                                                        <input type="text" class="form-control form-control-sm" name="quantity"
                                                               value="{{ $count_products }}"
                                                               readonly>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="mb-3 position-relative">
                                                        <label class="col-form-label-sm" for="validationTooltip02">Mahsulot
                                                            summasi (Jami)
                                                            ({{ $main_currency ? $main_currency->currency : null }})</label>

                                                        <input type="text" class="form-control form-control-sm" value="{{ $summ_products }}"
                                                               name="amount_product" readonly>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="mb-3 position-relative">
                                                        <label class="col-form-label-sm" for="validationTooltip02"
                                                               style="display: flex">
                                                            Mijoz
                                                            <span class="badge bg-success font-size-12 ms-2"
                                                                  data-bs-toggle="modal" data-bs-target="#add_client">+Qo'shish</span>
                                                        </label>
                                                        <select name="client_id" class="form-control form-control-sm" id="" required>
                                                            <option value="{{ null }}"></option>
                                                            @foreach(\Modules\Client\Entities\Client::orderBy('name', 'asc')->get() as $client)
                                                                <option @if($invoice ? $invoice->client_id == $client->id : null) selected @endif value="{{ $client->id }}">{{ $client->name }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="mb-3 position-relative">
                                                        <label class="col-form-label-sm" for="validationTooltip02">Jami
                                                            summa</label>
                                                        <input type="text" class="form-control form-control-sm" name="amount"
                                                               value="{{ $summ_products_expand }}" readonly="">
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <div class="mb-3 position-relative">
                                                        <button type="button"
                                                                class="order btn btn-primary"
                                                                wire:click="calculate()">
                                                            <i class="uil-refresh"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row align-items-end justify-content-start">

                                                <div class="add-input mb-2">
                                                    <div class="row">
                                                        <div class="col-md-1">
                                                            <div class="add-input">
                                                                <div class="spinner-border text-info m-1" wire:loading
                                                                     wire:target="add({{$i}})" role="status">
                                                                    <span class="sr-only">Loading...</span>
                                                                </div>
                                                                <button class="btn text-white btn-info btn-sm"
                                                                        wire:loading.attr="disabled"
                                                                        wire:click.prevent="add({{$i}})"><i
                                                                        class="fa fa-plus"></i></button>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label class="col-form-label-sm" for="validationTooltip02">Xarajat
                                                                    nomi</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label class="col-form-label-sm" for="validationTooltip02" required>Xarajat
                                                                    summasi</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label class="col-form-label-sm"
                                                                       for="validationTooltip02">Tur</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-1">
                                                            <div class="form-group">
                                                                <label class="col-form-label-sm"
                                                                       for="validationTooltip02">Izoh</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label class="col-form-label-sm"
                                                                       for="validationTooltip02">Model</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                @php($expence = \Modules\Invoice\Entities\Expense::where('invoice_id', $data_id)->get())
                                                @foreach($old_inputs as $key => $value)
                                                    <div class="add-input mb-0 {{ $key }}">
                                                        <div class="row">
                                                            <div class="col-md-1">
                                                                <button class="btn btn-danger btn-sm"
                                                                        wire:click.prevent="remove({{$key}})"><i
                                                                        class="fa fa-minus"></i></button>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <div class="form-group">
                                                                    <input type="text"
                                                                           class="form-control form-control-sm"
                                                                           placeholder="nomi"
                                                                           wire:model="x_name.{{ $key }}"
                                                                           name="x_name[{{ $key }}]"
                                                                    >
                                                                    @error('x_name.'.$value) <span
                                                                        class="text-danger error">{{ $message }}</span>@enderror
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <div class="form-group">
                                                                    <input type="text"
                                                                           class="form-control form-control-sm"
                                                                           wire:model="x_price.{{ $key }}"
                                                                           name="x_price[{{ $key }}]"
                                                                           placeholder="summasi">
                                                                    @error('x_price.'.$value) <span
                                                                        class="text-danger error">{{ $message }}</span>@enderror
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <div class="form-group">
                                                                    <select class="form-control form-control-sm"
                                                                            wire:model="x_type.{{ $key }}"
                                                                            name="x_type[{{ $key }}]">
                                                                        <option></option>
                                                                        <option value="1">Umumiy</option>
                                                                        <option value="2">Dona</option>
                                                                        <option value="3">Umumiy Foiz %</option>
                                                                        <option value="4">Taqsimlash %</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-1">
                                                                <div class="form-group">

                                                                    <input type="text" class="form-control form-control-sm"
                                                                           wire:model="x_note.{{ $key }}"
                                                                           name="x_note[{{ $key }}]" placeholder="Izoh">
                                                                    @error('x_note.'.$value) <span
                                                                        class="text-danger error">{{ $message }}</span>@enderror
                                                                </div>
                                                            </div>

                                                            <div class="col-md-2">
                                                                <div class="form-group">
                                                                    <select class="form-control form-control-sm"
                                                                            wire:model="x_mark.{{ $key }}" name="x_mark[{{ $key }}][]" multiple>
                                                                        <option value="all">Hammasiga</option>
                                                                        @foreach(session()->get('cart') as  $item=>$value)
                                                                            @if(in_array($item, array_keys(session()->get('cart'))))
                                                                                <option value="{{ $item }}">{{ \Modules\Mark\Entities\Mark::find($item)->name }}</option>
                                                                            @endif
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            {{--<div class="col-md-2">--}}
                                                            {{--<div class="form-group">--}}
                                                            {{----}}
                                                            {{--<select class="form-control form-control-sm" wire:model="x_distribute.{{ $key }}" name="x_distribute[{{ $key }}]">--}}
                                                            {{--<option value="2" wire:key="2">Dona</option>--}}
                                                            {{--<option value="1">Foiz</option>--}}
                                                            {{--</select>--}}
                                                            {{--</div>--}}
                                                            {{--</div>--}}

                                                        </div>
                                                    </div>
                                                    <hr><br>
                                                @endforeach


                                                @foreach($inputs as $key => $value)
                                                    <div class="add-input mb-0 {{ $key }}">
                                                        <div class="row">
                                                            <div class="col-md-1">
                                                                <button class="btn btn-danger btn-sm"
                                                                        wire:click.prevent="remove({{$key}})"><i
                                                                        class="fa fa-minus"></i></button>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <div class="form-group">
                                                                    <input type="text"
                                                                           class="form-control form-control-sm"
                                                                           placeholder="nomi"
                                                                           wire:model="x_name.{{ $key }}"
                                                                           name="x_name[{{ $key }}]">
                                                                    @error('x_name.'.$value) <span
                                                                        class="text-danger error">{{ $message }}</span>@enderror
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <div class="form-group">
                                                                    <input type="text"
                                                                           class="form-control form-control-sm"
                                                                           wire:model="x_price.{{ $key }}"
                                                                           name="x_price[{{ $key }}]"
                                                                           placeholder="summasi">
                                                                    @error('x_price.'.$value) <span
                                                                        class="text-danger error">{{ $message }}</span>@enderror
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <div class="form-group">
                                                                    <select class="form-control form-control-sm"
                                                                            wire:model="x_type.{{ $key }}"
                                                                            name="x_type[{{ $key }}]">
                                                                        <option></option>
                                                                        <option value="1">Umumiy</option>
                                                                        <option value="2">Dona</option>
                                                                        <option value="3">Umumiy Foiz %</option>
                                                                        <option value="4">Taqsimlash %</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-1">
                                                                <div class="form-group">

                                                                    <input type="text" class="form-control form-control-sm"
                                                                           wire:model="x_note.{{ $key }}"
                                                                           name="x_note[{{ $key }}]" placeholder="Izoh">
                                                                    @error('x_note.'.$value) <span
                                                                        class="text-danger error">{{ $message }}</span>@enderror
                                                                </div>
                                                            </div>

                                                            <div class="col-md-2">
                                                                <div class="form-group">
                                                                    <select class="form-control form-control-sm"
                                                                            wire:model="x_mark.{{ $key }}" name="x_mark[{{ $key }}][]" multiple>
                                                                        <option value="all">Hammasiga</option>
                                                                        @foreach(session()->get('cart') as  $item=>$value)
                                                                            @if(in_array($item, array_keys(session()->get('cart'))))
                                                                                <option value="{{ $item }}">{{ \Modules\Mark\Entities\Mark::find($item)->name }}</option>
                                                                            @endif
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            {{--<div class="col-md-2">--}}
                                                            {{--<div class="form-group">--}}
                                                            {{----}}
                                                            {{--<select class="form-control form-control-sm" wire:model="x_distribute.{{ $key }}" name="x_distribute[{{ $key }}]">--}}
                                                            {{--<option value="2" wire:key="2">Dona</option>--}}
                                                            {{--<option value="1">Foiz</option>--}}
                                                            {{--</select>--}}
                                                            {{--</div>--}}
                                                            {{--</div>--}}

                                                        </div>
                                                    </div>
                                                        <hr><br>
                                                @endforeach
                                            </div>
                                            <br>
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
                                                        @if(!in_array($datum->id, array_keys(session()->get('cart'))))
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
                                                    <th>Narxi</th>
                                                    <th>Summa</th>
                                                    <th>Jami harajat</th>
                                                    <th>Tannarxi</th>
                                                    <th>Izoh</th>
                                                    <th>IMEI</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <?php if (!session()->get('cart')) {
                                                    session()->put('cart', []);
                                                }
                                                ?>

                                                @foreach(session()->get('cart') as  $key=>$value)
                                                    @if(in_array($key, array_keys(session()->get('cart'))))
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
                                                                <input type="text"
                                                                       name="quantity[{{$key}}]"
                                                                       wire:model="quantity.{{$key}}"
                                                                       class="form-control form-control-sm">
                                                            </td>
                                                            <td>
                                                                <?php
                                                                    $stock = \Modules\Stock\Entities\Stock::find($stock_id);
                                                                ?>
                                                                <input type="text"
                                                                       name="price[{{$key}}]"
                                                                       wire:model="price.{{$key}}"
                                                                       class="form-control form-control-sm"
                                                                       placeholder="{{ \Modules\Stock\Entities\StockMark::where([['mark_id', $key], ['price_type_id', $stock->price_type_id]])->first()->price .
                                                                       currency($stock->main_currency_id)->currency}} sotuv narxi"
                                                                >
                                                            </td>
                                                            <td>
                                                                {{ isset($summ[$key]) ? round($summ[$key],2):'' }}
                                                            </td>
                                                            <td>
                                                                {{ isset($x_summ[$key]) ? round($x_summ[$key],2):'' }}
                                                                <input type="hidden" name="x_summ[{{$key}}]"
                                                                       value="{{ isset($x_summ[$key]) ? $x_summ[$key]:'' }}">
                                                            </td>
                                                            <td>
                                                                {{ isset($summ_single[$key]) ? round($summ_single[$key],2)  :'' }}
                                                                <input type="hidden" name="summ_single[{{$key}}]"
                                                                       value="{{ isset($summ_single[$key]) ? $summ_single[$key]:'' }}">
                                                            </td>
                                                            <td>
                                                                <input type="text" name="note[{{$key}}]"
                                                                       wire:model="note.{{$key}}"
                                                                       class="form-control form-control-sm">
                                                            </td>
                                                            <td>
                                                                <div class="input-group">
                                                                    <input type="text" class="form-control form-control-sm"
                                                                           placeholder="IMEI ..."
                                                                           wire:model="imei.{{$key}}"
                                                                           wire:keydown.enter="addImei({{$key}})"
                                                                           value="">
                                                                    <div class="input-group-append">
                                                                        <button class="btn btn-primary btn-sm"
                                                                                wire:click="addImei({{$key}})"
                                                                                type="button"><i
                                                                                class="mdi mdi-plus"></i></button>
                                                                    </div>
                                                                    &nbsp; &nbsp;
                                                                    <div class="input-group-append">
                                                                        <button class="btn btn-outline-primary btn-sm"
                                                                                data-bs-toggle="modal" data-bs-target="#imei{{$key}}"
                                                                                type="button"><i
                                                                                class="mdi mdi-barcode"></i> ({{ isset(session()->get('imei')[$key]) ? count(session()->get('imei')[$key]) : 0 }})</button>
                                                                    </div>
                                                                </div>
                                                                {{--<input type="text" wire:model="imei" name="imei" value="{{ $imei }}" class="form-control form-control-sm">--}}
                                                            </td>
                                                        </tr>
                                                    @endif
                                                @endforeach
                                                </tbody>
                                            </table>

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
                                                                        @if(isset(session()->get('imei')[$key]))
                                                                            <?php $text = '';?>
                                                                            @foreach(session()->get('imei')[$key] as $key1 => $value1)
                                                                                <div style="background: #34c38f; border-radius: 5px;padding: 5px; color: #fff">
                                                                                    &nbsp; {{ $key1 }} &nbsp;
                                                                                    <input type="hidden" name="imei[{{ $key }}][]" value="{{ $key1 }}">
                                                                                    <button type="button"
                                                                                            class="order btn btn-danger btn-sm"
                                                                                            data-bs-dismiss="modal" aria-label="Close"
                                                                                            wire:click="removeImei({{$key}}, '{{ $key1 }}')">
                                                                                        <i class="fa fa-minus"></i>
                                                                                    </button>
                                                                                </div> &nbsp;
                                                                            @endforeach
                                                                        @endif
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

@push('styles')
    <link href="{{ asset('assets/libs/bootstrap-tagsinput/bootstrap-tagsinput.css') }}" rel="stylesheet"
          type="text/css"/>
@endpush
@push('scripts')
    <script src="{{ asset('assets/js/pages/bootstrap-tagsinput.min.js') }}"></script>
@endpush
