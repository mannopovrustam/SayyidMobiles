@extends('layouts.app')

@section('css')
    <!-- DataTables -->
    <link href="{{ asset('assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css') }}" rel="stylesheet"
          type="text/css"/>
    <link href="{{ asset('assets/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css') }}" rel="stylesheet"
          type="text/css"/>
    <!-- Responsive datatable examples -->
    <link href="{{ asset('assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css') }}"
          rel="stylesheet" type="text/css"/>
@endsection

@section('content')

    <?php
    $stock_id = auth()->user()->stock_id;
    $stock_payment = 0;
    ?>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-flex align-items-center justify-content-between">
                    <h4 class="mb-0">To'lov<span class="text-primary"></span></h4>
                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item active">Ombor</li>
                            <li class="breadcrumb-item active">To'lov</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <form action="/stock_payments" method="post">
                            @csrf
                            <h4 class="card-title"><span class="text-primary"></span></h4>
                            <input class="form-control form-control-sm" type="hidden" name="stock_id"
                                   value="{{ $stock_id }}"
                                   id="example-date-input">
                            <div class="row">
                                <div class="col-md-3">
                                    <label class="col-form-label-sm"
                                           for="validationTooltip02">Sana</label>
                                    <input class="form-control form-control-sm" type="date" name="date"
                                           value="{{ \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', now())->format('Y-m-d') }}"
                                           id="example-date-input">
                                </div>
                                <br>
                                <div class="col-md-3">
                                    <label class="col-form-label-sm"
                                           for="validationTooltip02">Summa</label>
                                    <input class="form-control form-control-sm" type="text" name="main_currency_pay"
                                           value="">
                                </div>
                                <div class="col-md-3">
                                    <label class="col-form-label-sm"
                                           for="validationTooltip02">Valyuta</label>
                                    <select name="main_currency_id" class="form-select form-select-sm" id="">
                                        @foreach(Modules\Currency\Entities\Currency::all() as $datum)
                                            <option value="{{ $datum->id }}">{{ $datum->currency }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <label class="col-form-label-sm"
                                           for="validationTooltip02">Kirim\Chiqim</label>
                                    <select name="type" class="form-control form-control-sm" id="">
                                        <option value="1">Kirim</option>
                                        <option value="-1">Chiqim</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="col-form-label-sm"
                                           for="validationTooltip02">Ombor</label>
                                    <select name="stock_to" class="form-select form-select-sm" id="">
                                        @foreach(\Modules\Stock\Entities\Stock::all() as $item)
                                            @if($item->id != auth()->user()->stock_id)
                                                <option value="{{ $item->id }}">{{ $item->name }}</option>
                                            @endif
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-8">
                                    <label class="col-form-label-sm"
                                           for="validationTooltip02">Izox</label>
                                    <input class="form-control form-control-sm" type="text" name="note" value=""> </input>
                                </div>
                                <div class="col-md-2 d-grid gap-2">
                                    <label class="col-form-label-sm"
                                           for="validationTooltip02" style="visibility: hidden;"></label>
                                    <input class="btn-sm btn-success" type="submit" value="Saqlash">
                                </div>
                            </div>
                        </form>
                    </div> {{--{{ \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', now())->format('Y-m-d') }}--}}
                </div>
            </div>
            <!-- end col -->
        </div>
        <!-- end row -->
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="card-title mb-0">
                                {{ \Modules\Stock\Entities\Stock::find($stock_id) ? \Modules\Stock\Entities\Stock::find($stock_id)->name : null }}::<span class="text-primary">Hisobot</span>
                            </h4>

                            <a href="/stock_payments/{{ $stock_id }}" class="btn-sm btn-success">Excel</a>
                        </div>
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
                                    <th>Status</th>
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
                                        case "Pul(kirim | Ombor)":
                                            $type = 1;
                                            break;
                                        case "Pul(chiqim | Ombor)":
                                            $type = -1;
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

                                            {{ $s_o->type*sum($s_o->sum_id)->main_currency_pay }}
                                            {{ currency(sum($s_o->sum_id)->main_currency_id)->currency }}<br>
                                            @foreach(explode("|", sum($s_o->sum_id)->second_currency_pay) as $key => $item)
                                                @if($s_o->invoice_id == null)
                                                    @php($currency_sum[explode("|", sum($s_o->sum_id)->second_currency_id)[$key]] += $s_o->type*$item)
                                                @endif
                                                {{ $s_o->type*$item }}
                                                {{ currency(explode("|", sum($s_o->sum_id)->second_currency_id)[$key])->currency }}
                                                <br>
                                            @endforeach
                                        </td>
                                        <td>
                                            {{ $s_o->type*sum($s_o->sum_id)->sum_currency_pay }}
                                        </td>
                                        <td>
                                            {{ $s_o->type*sum($s_o->sum_id)->sum_currency_pay_get }}
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
                                        <td>
                                            @isset(\Modules\Stock\Entities\StockPayment::find($s_o->stock_payment_id)->status)
                                                @if(\Modules\Stock\Entities\StockPayment::find($s_o->stock_payment_id)->status == 0 &&
                                                \Modules\Stock\Entities\StockPayment::find($s_o->stock_payment_id)->stock_to == auth()->user()->stock_id)
                                                    <form action="/stock_payments/{{ $s_o->stock_payment_id }}" method="post">
                                                        @csrf
                                                        {{ method_field('put') }}
                                                        <input type="hidden" name="status" value="1">
                                                        <button type="submit" class="btn-sm btn-success">Qabul qilish</button>
                                                    </form>
                                                @else
                                                    <span class="text-success">{{ \Modules\Stock\Entities\StockPayment::find($s_o->stock_payment_id)->status ? 'Qabul qilindi' : 'Kutilmoqda' }}</span>
                                                @endif
                                            @endisset
                                        </td>
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
                                    <th>Status</th>
                                </tr>

                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')

    <!-- Required datatable js -->
    <script src="/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="/assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
    <!-- Buttons examples -->
    <!-- Responsive examples -->
    <script src="/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="/assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>

    <!-- Datatable init js -->
    <script src="/assets/js/pages/datatables.init.js"></script>

    {{--<script>--}}
    {{--$(document).ready(function () {--}}
    {{--$("#datatable1").DataTable(), $("#datatable2").DataTable(), $("#datatable3").DataTable(), $("#datatable4").DataTable(), $("#datatable5").DataTable({--}}
    {{--"order": [[0, "desc"]],--}}
    {{--lengthChange: !1,--}}
    {{--buttons: ["copy", "excel", "pdf", "colvis"]--}}
    {{--}).buttons().container().appendTo("#datatable-buttons_wrapper .col-md-6:eq(0)"), $(".dataTables_length select").addClass("form-select form-select-sm")--}}
    {{--});--}}
    {{--</script>--}}

    <script src="/assets/libs/table-edits/build/table-edits.min.js"></script>

    <script src="/assets/js/pages/table-editable.int.js"></script>

@endsection
