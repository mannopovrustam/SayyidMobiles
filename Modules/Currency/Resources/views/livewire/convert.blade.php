<div class="container-fluid" xmlns:wire="http://www.w3.org/1999/xhtml">
    <div class="card">
        <div class="card-body">
            @if($data_id == null)
                <form action="/converts" method="post" class="needs-validation" novalidate>
                    @csrf
                    <input type="hidden" name="data_id" value="">
                    <input type="hidden" name="stock_id" value="{{ $stock_id }}">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="mb-3">
                                <label class="col-form-label-sm" for="currency">Kurs
                                    @if($summ_from != 0 && $summ_to != 0 && $summ_from != null && $summ_to != null)
                                        @if($summ_to/$summ_from < 1)
                                            (1 {{ \Modules\Currency\Entities\Currency::find($currency_to)->currency }})
                                        @endif
                                        @if($summ_from/$summ_to < 1)
                                            (1 {{ \Modules\Currency\Entities\Currency::find($currency_from)->currency }})
                                        @endif
                                    @endif
                                </label>
                                <input type="text" hidden name="currency" value="
                                    @if($summ_from != 0 && $summ_to != 0)
                                        @if($summ_to/$summ_from < 1)
                                            {{ \Modules\Currency\Entities\Currency::find($currency_to)->id }}
                                        @endif
                                        @if($summ_from/$summ_to < 1)
                                            {{ \Modules\Currency\Entities\Currency::find($currency_from)->id }}
                                        @endif
                                    @endif">
                                <input type="text" class="form-control form-control-sm" name="currency_rate" id="validationCustom01"
                                       placeholder="..." required readonly
                                       @if($summ_from != 0 && $summ_to != 0)
                                            @if($summ_to/$summ_from < 1)
                                                value="{{ round($summ_from/$summ_to, 2) }}"
                                            @else
                                                value=" {{ round($summ_to/$summ_from, 2) }}"
                                            @endif
                                       @endif
                                >
                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="mb-3">
                                <label class="col-form-label-sm" for="validationCustom01">Valyutadan</label>
                                <select wire:model="currency_from" class="form-control form-control-sm" name="currency_from" id="">
                                    @foreach(\Modules\Currency\Entities\Currency::all() as $item)
                                        <option value="{{ $item->id }}">{{ $item->currency }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="mb-3">
                                <label class="col-form-label-sm" for="validationCustom01">Valyutaga</label>
                                <select wire:model="currency_to" class="form-control form-control-sm" name="currency_to" id="">
                                    @foreach(\Modules\Currency\Entities\Currency::all() as $item)
                                        <option value="{{ $item->id }}">{{ $item->currency }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="mb-3">
                                <label class="col-form-label-sm" for="validationCustom01">Sotish ({{ \Modules\Currency\Entities\Currency::find($currency_from)->currency }})</label>
                                <input wire:model="summ_from" type="text" class="form-control form-control-sm" name="main_currency_val" id="validationCustom01"
                                       placeholder="..." required>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="mb-3">
                                <label class="col-form-label-sm" for="validationCustom01">Olish ({{ \Modules\Currency\Entities\Currency::find($currency_to)->currency }})</label>
                                <input wire:model="summ_to" type="text" class="form-control form-control-sm" name="second_currency_val" id="validationCustom01"
                                       placeholder="..." required>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="mb-3">
                                <label class="col-form-label-sm" for="validationCustom01">Izoh</label>
                                <input type="text" class="form-control form-control-sm" name="note" id="validationCustom01"
                                       placeholder="..." required>
                            </div>
                        </div>
                        <div class="col-md-1" style="margin-top: 27px">
                            <div class="mb-3">
                                <button class="btn btn-primary" type="submit">Saqlash</button>
                            </div>
                        </div>
                    </div>
                </form>
            @endif
            @if($data_id != null)
                <form action="/converts" method="post" class="needs-validation" novalidate>
                    @csrf
                    <input type="hidden" name="data_id" value="{{ $data_id }}">
                    <input type="hidden" name="stock_id" value="{{ $stock_id }}">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="mb-3">
                                <label class="col-form-label-sm" for="currency">Kurs
                                    @if($summ_from != 0 && $summ_to != 0)
                                        @if($summ_to/$summ_from < 1)
                                            (1{{ \Modules\Currency\Entities\Currency::find($currency_to)->currency }})
                                        @endif
                                        @if($summ_from/$summ_to < 1)
                                            (1{{ \Modules\Currency\Entities\Currency::find($currency_from)->currency }})
                                        @endif
                                    @endif
                                </label>
                                <input type="text" hidden name="currency" value="
                                    @if($summ_from != 0 && $summ_to != 0)
                                        @if($summ_to/$summ_from < 1)
                                            {{ \Modules\Currency\Entities\Currency::find($currency_to)->id }}
                                        @endif
                                        @if($summ_from/$summ_to < 1)
                                            {{ \Modules\Currency\Entities\Currency::find($currency_from)->id }}
                                        @endif
                                    @endif
                                ">
                                <input type="text" class="form-control form-control-sm" name="summ" id="validationCustom01"
                                       placeholder="{{ $data->summ }}" required readonly
                                    @if($summ_from != 0 && $summ_to != 0)
                                       @if($summ_to/$summ_from < 1)
                                       value="{{ round(($summ_from/$summ_to), 2) }}"
                                       @else
                                       value=" {{ round(($summ_to/$summ_from), 2) }}"
                                        @endif
                                    @endif>
                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="mb-3">
                                <label class="col-form-label-sm" for="validationCustom01">Valyutadan</label>
                                <select wire:model="currency_from" class="form-control form-control-sm" name="currency_from" id="">
                                    @foreach(\Modules\Currency\Entities\Currency::all() as $item)
                                        <option value="{{ $item->id }}" @if($data->currency_from == $item->id) selected @endif>{{ $item->currency }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="mb-3">
                                <label class="col-form-label-sm" for="validationCustom01">Valyutaga</label>
                                <select wire:model="currency_to" class="form-control form-control-sm" name="currency_to" id="">
                                    @foreach(\Modules\Currency\Entities\Currency::all() as $item)
                                        <option value="{{ $item->id }}" @if($data->currency_to == $item->id) selected @endif>{{ $item->currency }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <input type="hidden" value="{{$data_id}}" wire:model="data_id" />
                        <div class="col-md-2">
                            <div class="mb-3">
                                <label class="col-form-label-sm" for="validationCustom01">Sotish ({{ \Modules\Currency\Entities\Currency::find($data->currency_from)->currency }})</label>
                                <input wire:model="summ_from" type="text" class="form-control form-control-sm" name="main_currency_val" id="validationCustom01"
                                       value="{{ $data->main_currency_val }}" required>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="mb-3">
                                <label class="col-form-label-sm" for="validationCustom01">Olish ({{ \Modules\Currency\Entities\Currency::find($data->currency_to)->currency }})</label>
                                <input wire:model="summ_to" type="text" class="form-control form-control-sm" name="second_currency_val" id="validationCustom01"
                                       value="{{ $data->second_currency_val }}" required>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="mb-3">
                                <label class="col-form-label-sm" for="validationCustom01">Izoh</label>
                                <input type="text" class="form-control form-control-sm" name="note" id="validationCustom01"
                                       placeholder="..." value="{{ $data->note }}" required>
                            </div>
                        </div>
                        <div class="col-md-1" style="margin-top: 27px">
                            <div class="mb-3">
                                <button class="btn btn-primary" type="submit">Uzgartirish</button>
                            </div>
                        </div>
                    </div>
                </form>
            @endif
        </div>
    </div>
    <div class="card">
        <div class="table-responsive">
            <table class="table table-striped table-nowrap align-middle">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Sana</th>
                    <th>Ayirboshlash</th>
                    <th>Ayirboshlandi</th>
                    <th>Kurs</th>
                    <th>Izoh</th>
                </tr>
                </thead>
                <tbody>
                <?php $num = 1; ?>
                @foreach(\Modules\Currency\Entities\Convert::where('stock_id', session()->get('stock'))->get() as $convert)
                    <?php
                        $stockOperation = \Modules\Stock\Entities\StockOperation::where('convert_id', $convert->id)->get()->first();
                    ?>
                    <tr>
                        <td>{{$num++}}</td>
                        <td><a href="/converts/{{ $convert->id }}/edit">{{ $convert->updated_at }}</a></td>
                        <td>
                            {{currency($convert->currency_from)->currency}}<br>
                            {{ $convert->main_currency_val }}
                        </td>
                        <td>
                            {{currency($convert->currency_to)->currency}}<br>
                            {{$convert->second_currency_val}}
                        </td>
                        <td>
                            @if($convert->main_currency_val / $convert->second_currency_val < 1)
                                {{ $convert->second_currency_val / $convert->main_currency_val }}
                            @else
                                {{ $convert->main_currency_val / $convert->second_currency_val }}
                            @endif
                            <br>
                            {{$convert->currency_rate_real}}
                        </td>
                        <td>{{ $convert->note }}</td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
