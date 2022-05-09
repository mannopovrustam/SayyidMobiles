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

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-flex align-items-center justify-content-between">
                    <h4 class="mb-0">Mijoz::<span class="text-primary">{{ $data->name }}</span></h4>
                    <?php
                    if (\Modules\Stock\Entities\Stock::find($stock_id)) {
                        $currency_main = \Modules\Currency\Entities\Currency::find(\Modules\Stock\Entities\Stock::find($stock_id)->main_currency_id);
                        $currency_second = \Modules\Currency\Entities\Currency::find(\Modules\Stock\Entities\Stock::find($stock_id)->second_currency_id);
                    }
                    ?>
                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item active">Mijoz</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <form action="/client_payments" method="post">
                            @csrf
                            <h4 class="card-title">{{ $data->name }}::<span class="text-primary">Kirim\Chiqim</span>
                            </h4>
                            <input class="form-control form-control-sm" type="hidden" name="client_id"
                                   value="{{ $data->id  }}"
                                   id="example-date-input">
                            <input class="form-control form-control-sm" type="hidden" name="stock_id"
                                   value="{{ Auth()->user()->id }}"
                                   id="example-date-input">
                            @livewire('client::client-pay', ['data' => $data])
                        </form>
                    </div> {{--{{ \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', now())->format('Y-m-d') }}--}}
                </div>
            </div>
            <!-- end col -->
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <?php
                    $sum = 0;
                    $main_currency = [];
                    $sum_id = \Modules\Client\Entities\ClientOperation::where('client_id', $data->id)->pluck('sum_id')->toArray();
                    foreach ($sum_id as $sum_item) {
                        \Modules\Currency\Entities\Sum::find($sum_item) ? $main_currency[] = \Modules\Currency\Entities\Sum::find($sum_item)->sum_currency_id : 0;
                    }

                    ?>
                    <div class="card-body">
                        <h4 class="card-title">{{ $data->name }}</h4>

                        <ul class="nav nav-tabs" role="tablist">
                            @foreach(array_unique($main_currency) as $item)
                                @if(isset(currency($item)->currency))
                                <li class="nav-item">
                                    <a class="nav-link @if($loop->first) active @endif" data-bs-toggle="tab"
                                       href="#main_currency-{{ $item }}" role="tab">
                                        <span class="d-block d-sm-none"><i class="fas fa-home"></i></span>
                                        <span class="d-none d-sm-block">{{ currency($item)->currency }}</span>
                                    </a>
                                </li>
                                @endif
                            @endforeach
                        </ul>

                        <div class="tab-content p-3 text-muted">
                            @foreach(array_unique($main_currency) as $item)
                                <?php
                                $client_operations = \Modules\Client\Entities\ClientOperation::where([['client_id', $data->id], ['sum_currency_id', $item]])->get();
                                $residue[$item] = 0;
                                ?>
                                    <div class="tab-pane @if($loop->first) active @endif" id="main_currency-{{ $item }}"
                                         role="tabpanel">
                                        <div class="table-responsive">
                                            <table class="table table-sm table-hover table-bordered table-striped table-nowrap align-middle">
                                                <thead>
                                                <tr>
                                                    <th>Sana</th>
                                                    <th>Turi</th>
                                                    <th>Asosiy Summa ({{ currency($item) ? currency($item)->currency : null }})</th>
                                                    <th>Summa ({{ currency($item) ? currency($item)->currency : null }})</th>
                                                    @foreach(\Modules\Currency\Entities\Currency::where('id', '!=', $item)->get() as $s_currency)
                                                        <th>Summa ({{ currency($s_currency->id) ? currency($s_currency->id)->currency : null }})</th>
                                                    @endforeach
                                                    <th>Qoldiq ({{ currency($item) ? currency($item)->currency : null }}) </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                @foreach($client_operations as $cp)
                                                    <?php $second_sum = explode("|", sum($cp->sum_id)->second_currency_id);?>
                                                    <tr>
                                                        <td>{{$cp->date}}</td>
                                                        <td>{{$cp->operation}}</td>
                                                        <td>{{sum($cp->sum_id)->sum_currency_pay}}</td>
                                                        <td>{{sum($cp->sum_id)->main_currency_pay}}</td>
                                                        @foreach(\Modules\Currency\Entities\Currency::where('id', '!=', $item)->get() as $s_currency_e)
                                                            <td>
                                                                @if(in_array($s_currency_e->id, $second_sum) && $cp->sum_id)
                                                                    <?php $sum_key = array_search($s_currency_e->id, $second_sum);?>
                                                                    {{ explode("|", sum($cp->sum_id)->second_currency_pay)[$sum_key] }}
                                                                @endif
                                                            </td>
                                                        @endforeach
                                                        <td>
                                                            <?php
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
                                                                    default:
                                                                        $operation = $cp->type;

                                                                };
                                                                $residue[$item] += $operation*sum($cp->sum_id)->sum_currency_pay;
                                                                $residue[$item] -= $operation*sum($cp->sum_id)->sum_currency_pay_will;
                                                                echo $residue[$item];
                                                            ?>
                                                        </td>
                                                    </tr>
                                                @endforeach
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- end row -->
    </div> <!-- container-fluid -->

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


    <script src="/assets/libs/table-edits/build/table-edits.min.js"></script>

    <script src="/assets/js/pages/table-editable.int.js"></script>

@endsection
