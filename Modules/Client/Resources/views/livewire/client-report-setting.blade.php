<div xmlns:wire="http://www.w3.org/1999/xhtml">
    <div class="row">
        <div class="col-2 mb-3">
            <label class="col-form-label-sm" for="validationCustom01">Shaxobcha</label>
            <select class="form-select form-select-sm" name="stock_id" id="">
                @foreach(\Modules\Stock\Entities\Stock::all() as $data)
                    <option value="{{ $data->id }}">{{ $data->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-md-2">
            <label>Turi</label>
            <div class="d-flex justify-content-between">
                <div class="form-check">
                    <label class="form-check-label" for="formRadios1">
                        Xammasi
                    </label>
                    <input class="form-check-input" type="radio" wire:model="radioType" name="radioType" id="formRadios1" value="1">
                </div>
                <div class="form-check">
                    <label class="form-check-label" for="formRadios2">
                        Qarzdor
                    </label>
                    <input class="form-check-input" type="radio" wire:model="radioType" name="radioType" id="formRadios2" value="2">
                </div>
                <div class="form-check">
                    <label class="form-check-label" for="formRadios3">
                        Xaqdor
                    </label>
                    <input class="form-check-input" type="radio" wire:model="radioType" name="radioType" id="formRadios3" value="3">
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <label class="col-form-label-sm"
                   for="validationTooltip02">Valyuta</label>
            <select wire:model="currency_id" class="form-select form-select-sm" id="">
                @foreach(Modules\Currency\Entities\Currency::all() as $datum)
                    <option value="{{ $datum->id }}" @if($loop->first) selected @endif>{{ $datum->currency }}</option>
                @endforeach
            </select>
        </div>
    </div>



    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Mijoz</h4>
                    <div class="table-responsive">
                        <table class="table table-sm table-hover table-bordered table-striped table-nowrap align-middle">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Shaxobcha</th>
                                <th>Ismi</th>
                                <th>Summa</th>
                                <th>I Valyuta</th>
                                <th>II Valyuta</th>
                                <th>Harakat</th>
                            </tr>
                            </thead>
                            <tbody>
                            @isset($clients_report)
                                @foreach($clients_report as $key=>$value)
                                    <tr data-id="{{ $key+1 }}">
                                        <td data-field="id" style="width: 80px">{{ $key+1 }}</td>
                                        <td data-field="stock">{{ \Modules\Stock\Entities\Stock::find($value['stock_id']) ? \Modules\Stock\Entities\Stock::find($value['stock_id'])->name : null }}</td>
                                        <td data-field="name">{{ isset($value['name']) ? $value['name'] : '' }}</td>
                                        <td data-field="amount">
                                            <?php
                                            $sum = 0;
                                            $main_currency = [];
                                            $sum_id = \Modules\Client\Entities\ClientOperation::where('client_id', $value['id'])->pluck('sum_id')->toArray();
                                            foreach ($sum_id as $sum_item) {
                                                $main_currency[] = \Modules\Currency\Entities\Sum::find($sum_item)->sum_currency_id;
                                            }
                                            foreach(array_unique($main_currency) as $item){
                                                $residue[$item] = 0;
                                                foreach (\Modules\Client\Entities\ClientOperation::where('client_id', $value['id'])->get() as $cp){
                                                    switch ($cp->operation){
                                                        case 'Mahsulot(kirim)':
                                                            $operation = -1;
                                                            break;
                                                        case 'Mahsulot(chiqim)':
                                                            $operation = 1;
                                                            break;
                                                        case 'Pul(kirim)':
                                                            $operation = -1;
                                                            break;
                                                        case 'Pul(chiqim)':
                                                            $operation = 1;
                                                            break;
                                                    };
                                                    $residue[$item] += $operation*sum($cp->sum_id)->sum_currency_pay;
                                                    $residue[$item] -= $operation*sum($cp->sum_id)->sum_currency_pay_will;
                                                }
                                                echo number_format($residue[$item], 1).' '.currency($item)->currency;
                                            }
                                            ?>

                                        </td>
                                        <td data-field="currency">{{ currency($value['main_currency_id']) ? currency($value['main_currency_id'])->currency : null }}</td>
                                        <td data-field="currency">
                                            @foreach(explode("|", $value['second_currency_id']) as $s_currency)
                                                {{ currency($s_currency) ? currency($s_currency)->currency : null }}{{ !$loop->last ? ',': '' }}
                                            @endforeach
                                        </td>
                                        <td style="width: 100px">
                                                <a href="/clients/{{ $value['id'] }}"
                                                   class="btn btn-outline-secondary btn-sm">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                                <a class="btn btn-outline-secondary btn-sm edit" data-bs-toggle="modal"
                                                   data-bs-target="#clientModel{{$value['id']}}" title="Edit">
                                                    <i class="fas fa-pencil-alt"></i>
                                                </a>
                                                <div id="clientModel{{$value['id']}}" class="modal fade" tabindex="-1"
                                                     role="dialog"
                                                     aria-labelledby="myModalLabel" aria-hidden="true">

                                                    <div class="modal-dialog">
                                                        <form action="/clients" method="post" class="needs-validation"
                                                              novalidate>
                                                            @csrf
                                                            <input type="hidden" name="data_id" value="{{ $value['id'] }}">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="myModalLabel">O'zgartirish
                                                                        kiritish:: {{ $value['name'] }}</h5>
                                                                    <button type="button" class="btn-close"
                                                                            data-bs-dismiss="modal" aria-label="Close">
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <input type="hidden" name="data_id"
                                                                           value="{{ $value['id'] }}">
                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="col-form-label-sm"
                                                                                       for="validationCustom01">Nomi</label>
                                                                                <input type="text" class="form-control form-control-sm"
                                                                                       name="name" id="validationCustom01"
                                                                                       placeholder="..."
                                                                                       value="{{ $value['name'] }}" required>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="col-form-label-sm"
                                                                                       for="validationCustom01">Telefon</label>
                                                                                <input type="text" class="form-control form-control-sm"
                                                                                       name="phone" id="validationCustom01"
                                                                                       placeholder="..."
                                                                                       value="{{ $value['phone'] }}" required>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="mb-3">
                                                                                <label class="col-form-label-sm"
                                                                                       for="validationCustom01">Kod</label>
                                                                                <input type="number" class="form-control form-control-sm"
                                                                                       name="kod" id="validationCustom01"
                                                                                       placeholder="..."
                                                                                       value="{{ $value['kod'] }}" required>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="mb-3">
                                                                                <label class="col-form-label-sm"
                                                                                       for="validationCustom01">Region</label>
                                                                                <select class="form-control form-control-sm" name="region"
                                                                                        id="">
                                                                                    <option value="1">Ташкент</option>
                                                                                    <option value="2">Самарканд</option>
                                                                                    <option value="3">Бухара</option>
                                                                                    <option value="4">Наманган</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="mb-3">
                                                                                <label class="col-form-label-sm"
                                                                                       for="manzil">Manzil</label>
                                                                                <input type="text" class="form-control form-control-sm"
                                                                                       name="address"
                                                                                       id="manzil"
                                                                                       placeholder="..."
                                                                                       value="{{ $value['address'] }}"
                                                                                       required>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="mb-3">
                                                                                <label class="col-form-label-sm" for="changeCurr_1">I Valyuta</label>
                                                                                <select class="form-control form-control-sm" name="main_currency_id" id="changeCurr_1">
                                                                                    @foreach(\Modules\Currency\Entities\Currency::all() as $data)
                                                                                        <option @if($data->id == $value->main_currency_id) selected @endif value="{{ $data->id }}">{{ $data->currency }}</option>
                                                                                        @if($value->main_currency_id == $data->id)
                                                                                        @endif
                                                                                    @endforeach
                                                                                </select>
                                                                                <label class="col-form-label-sm"
                                                                                       for="changeCurr_2">II Valyuta</label>
                                                                                <select class="form-control form-control-sm"
                                                                                        name="second_currency_id[]" id="changeCurr_2" multiple>
                                                                                    @foreach(\Modules\Currency\Entities\Currency::all() as $data)
                                                                                        <option value="{{$data->id}}"
                                                                                                @foreach(explode('|',$value['second_currency_id']) as $sec_cur_id=>$sec_cur_val)
                                                                                                    @if((int)$sec_cur_val == $data->id) selected @endif
                                                                                                @endforeach
                                                                                                >{{ $data->currency }}
                                                                                        </option>
                                                                                    @endforeach
                                                                                </select>


                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="mb-3">
                                                                                <label class="col-form-label-sm"
                                                                                       for="validationCustom01">Shaxobcha</label>
                                                                                <select class="form-control form-control-sm" name="stock_id"
                                                                                        id="">
                                                                                    @foreach(\Modules\Stock\Entities\Stock::all() as $data)
                                                                                        <option value="{{ $data->id }}"
                                                                                                @if(in_array($data->id, explode('|', $value['stock_id']))  ) selected @endif>{{ $data->name }}</option>
                                                                                    @endforeach
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="mb-3">
                                                                                <label class="col-form-label-sm"
                                                                                       for="izoh">Izox</label>
                                                                                <textarea name="description" id="izoh" cols="20"
                                                                                          rows="1"
                                                                                          class="form-control form-control-sm">{{ $value['description'] }}</textarea>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-light waves-effect"
                                                                            data-bs-dismiss="modal">Yopish
                                                                    </button>
                                                                    <button type="submit"
                                                                            class="btn btn-primary waves-effect waves-light">
                                                                        Saqlash
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </form><!-- /.modal-content -->
                                                    </div><!-- /.modal-dialog -->
                                                </div>
                                            <form action="/clients/{{ $value['id'] }}" style="display: inline-block"
                                                  method="post">
                                                @csrf
                                                {{ method_field('delete') }}
                                                <button type="submit"
                                                        onclick="return confirm('Вы точно хотите удалить {{ $value['name'] }}');"
                                                        class="btn btn-outline-secondary btn-sm">
                                                    <i class="uil uil-trash-alt"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                @endforeach
                            @endisset
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
        <!-- end col -->
    </div>


</div>
