@extends('layouts.app')

@section('content')

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-flex align-items-center justify-content-between">
                    <h4 class="mb-0">Ombor</h4>
                    <button class="accordion-button collapsed btn btn-primary" style="width: 200px;" type="button"
                            data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
                            aria-expanded="false" aria-controls="flush-collapseTwo">
                        Ombor qo'shish
                    </button>
                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item active">Ombor</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div id="flush-collapseTwo" class="accordion-collapse collapse"
             aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="/stocks" method="post">
                                @csrf
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="col-form-label-sm" for="validationCustom01">Ombor nomi</label>
                                            <input type="text" class="form-control form-control-sm" name="name"
                                                   id="validationCustom01"
                                                   placeholder="Склад номи" required>
                                        </div>

                                        <div class="mb-3">
                                            <label class="col-form-label-sm" for="validationCustom02">Ombor
                                                manzili</label>
                                            <input type="text" class="form-control form-control-sm" name="address"
                                                   id="validationCustom02"
                                                   placeholder="Склад Адреси" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="col-form-label-sm" for="main_currency_id">Asosiy
                                                valyuta</label>
                                            <select class="form-select form-select-sm" name="main_currency_id"
                                                    id="main_currency_id"
                                                    required>
                                                @foreach(\Modules\Currency\Entities\Currency::all() as $item)
                                                    <option value="{{ $item->id }}">{{ $item->currency }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label class="col-form-label-sm" for="second_currency_id">Ikkinchi
                                                valyuta</label>
                                            <select class="form-select form-select-sm" name="second_currency_id[]"
                                                    id="second_currency_id" multiple>
                                                <option value="{{ null }}"></option>
                                                @foreach(\Modules\Currency\Entities\Currency::all() as $item)
                                                    <option value="{{ $item->id }}">{{ $item->currency }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="mb-3 position-relative">
                                            <label class="col-form-label-sm" for="validationCustom02">Qaysi
                                                xodimga tegishli</label>
                                            <select class="form-select form-select-sm" name="user_id[]"
                                                    id="validationCustom02"
                                                    required multiple>
                                                @foreach(\App\Models\User::all() as $item)
                                                    <option value="{{ $item->id }}">{{ $item->email }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="mb-3 position-relative">
                                            <label class="col-form-label-sm" for="validationCustom02">Narx turini
                                                tanlang</label>
                                            <select class="form-select form-select-sm" name="price_type_id"
                                                    id="validationCustom02"
                                                    required>
                                                @foreach(\Modules\Stock\Entities\PriceType::all() as $item)
                                                    <option value="{{ $item->id }}">{{ $item->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <button class="btn btn-primary" type="submit">Склад кушиш</button>
                            </form>
                        </div>

                    </div>
                </div>
                <!-- end card -->
            </div>
            <!-- end col -->

        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Склад</h4>
                        <div class="table-responsive">
                            <table class="table table-sm table-hover table-bordered table-striped table-nowrap align-middle">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nomi</th>
                                    <th>Manzil</th>
                                    <th>Valyuta (asosiy)</th>
                                    <th>Valyuta (ikkinchi)</th>
                                    <th>Egasi</th>
                                    <th>Действие</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach(\Modules\Stock\Entities\Stock::all() as $key=>$stock)
                                    <tr data-id="{{ $key+1 }}">
                                        <td data-field="id" style="width: 80px">{{ $key+1 }}</td>
                                        <td data-field="name">{{ $stock->name }}</td>
                                        <td data-field="address">{{ $stock->address }}</td>
                                        <td data-field="currency">{{ \Modules\Currency\Entities\Currency::find($stock->main_currency_id)->currency }}</td>
                                        <td data-field="currency">
                                            @foreach(explode("|", $stock->second_currency_id) as $s_currency)
                                                {{ currency($s_currency)->currency}}{{ !$loop->last ? ',':'' }}
                                            @endforeach
                                        </td>
                                        <td data-field="currency">
                                            @foreach(explode("|", $stock->user_id) as $item)
                                                {{ \App\Models\User::find($item)->name }}{{ !$loop->last ? ',':'' }}
                                            @endforeach
                                        </td>
                                        <td style="width: 100px">
                                            <a href="/stocks/{{ $stock->id }}"
                                               class="btn btn-outline-secondary btn-sm" title="Ko'rsatish">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                            <a class="btn btn-outline-secondary btn-sm edit" data-bs-toggle="modal"
                                               data-bs-target="#storeModel{{$stock->id}}" title="O'zgartirish">
                                                <i class="fas fa-pencil-alt"></i>
                                            </a>
                                            <div id="storeModel{{$stock->id}}" class="modal fade" tabindex="-1"
                                                 role="dialog"
                                                 aria-labelledby="myModalLabel" aria-hidden="true">

                                                <div class="modal-dialog">
                                                    <form action="/stocks" method="post"
                                                          class="needs-validation"
                                                          novalidate>
                                                        <input type="hidden" name="data_id" value="{{ $stock->id }}">
                                                        @csrf
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="myModalLabel">Изменить
                                                                    склад {{ $stock->name }}</h5>
                                                                <button type="button" class="btn-close"
                                                                        data-bs-dismiss="modal" aria-label="Close">
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="mb-3 position-relative">
                                                                    <label class="col-form-label-sm"
                                                                           for="validationTooltip01">Название
                                                                        склада</label>
                                                                    <input type="text" name="name"
                                                                           class="form-control form-control-sm"
                                                                           value="{{ $stock->name }}"
                                                                           id="validationTooltip01"
                                                                           placeholder="Название магазина" required>
                                                                </div>
                                                                <div class="mb-3 position-relative">
                                                                    <label class="col-form-label-sm"
                                                                           for="validationTooltip01">Склад
                                                                        Адреси</label>
                                                                    <input type="text" name="address"
                                                                           class="form-control form-control-sm"
                                                                           value="{{ $stock->address }}"
                                                                           id="validationTooltip01"
                                                                           placeholder="Склад Адреси" required>
                                                                </div>
                                                                <div class="mb-3 position-relative">
                                                                    <label class="col-form-label-sm"
                                                                           for="main_currency_id">Ombor valyutasi
                                                                        (asosiy)</label>
                                                                    <select class="form-select form-select-sm"
                                                                            name="main_currency_id"
                                                                            id="main_currency_id"
                                                                            required>
                                                                        @foreach(\Modules\Currency\Entities\Currency::all() as $item)
                                                                            <option value="{{ $item->id }}"
                                                                                    @if($stock->main_currency_id == $item->id) selected @endif>{{ $item->currency }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                                <div class="mb-3 position-relative">
                                                                    <label class="col-form-label-sm"
                                                                           for="second_currency_id">Ombor valyutasi
                                                                        (qo'shimcha)</label>
                                                                    <select class="form-select form-select-sm"
                                                                            name="second_currency_id[]"
                                                                            id="second_currency_id" multiple>
                                                                        <option value="{{ null }}"></option>
                                                                        @foreach(\Modules\Currency\Entities\Currency::all() as $item)
                                                                            <option value="{{ $item->id }}"
                                                                                    @if(in_array($item->id, explode("|", $stock->second_currency_id))) selected @endif>{{ $item->currency }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                                <div class="mb-3 position-relative">
                                                                    <label class="col-form-label-sm"
                                                                           for="validationCustom02">Qaysi
                                                                        foydalanuvchiga tegishli</label>
                                                                    <select class="form-select form-select-sm"
                                                                            name="user_id[]"
                                                                            id="validationCustom02" multiple required>
                                                                        @foreach(\App\Models\User::all() as $item)
                                                                            <option @if($item->id == $stock->user_id) selected
                                                                                    @endif
                                                                                    value="{{ $item->id }}">{{ $item->email }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                                <div class="mb-3 position-relative">
                                                                    <label class="col-form-label-sm"
                                                                           for="validationCustom02">Narx turini
                                                                        tanlang</label>
                                                                    <select class="form-select form-select-sm"
                                                                            name="price_type_id"
                                                                            id="validationCustom02"
                                                                            required>
                                                                        @foreach(\Modules\Stock\Entities\PriceType::all() as $item)
                                                                            <option @if($item->id == $stock->price_type_id) selected
                                                                                    @endif
                                                                                    value="{{ $item->id }}">{{ $item->name }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-light waves-effect"
                                                                        data-bs-dismiss="modal">Закрыть
                                                                </button>
                                                                <button type="submit"
                                                                        class="btn btn-primary waves-effect waves-light">
                                                                    Сохранить
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </form><!-- /.modal-content -->
                                                </div><!-- /.modal-dialog -->
                                            </div>
                                            <form action="/stocks/{{ $stock->id }}" style="display: inline-block"
                                                  method="post">
                                                @csrf
                                                {{ method_field('delete') }}
                                                <button type="submit"
                                                        onclick="return confirm('Вы точно хотите удалить {{ $stock->name }}');"
                                                        class="btn btn-outline-secondary btn-sm" title="O'chirish">
                                                    <i class="uil uil-trash-alt"></i>
                                                </button>
                                            </form>
                                            @if(session()->get('stock') == $stock->id)
                                                <a class="btn btn-primary btn-sm" title="Tanlangan">
                                                    <i class="uil uil-check"></i>
                                                </a>
                                            @else
                                                <a href="/switching/{{ $stock->id }}" class="btn btn-outline-secondary btn-sm" title="Almashtirish">
                                                    <i class="uil uil-arrow-to-right"></i>
                                                </a>
                                            @endif

                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end col -->
        </div> <!-- end row -->
    </div>

@endsection
