<div xmlns:wire="http://www.w3.org/1999/xhtml">

    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title"><span class="text-primary">Valyuta Farqi</span></h4>
                    <div class="row">
                        <div class="col-md-3">
                            <label class="col-form-label-sm"
                                   for="validationTooltip02">Sanadan</label>
                            <input class="form-control form-control-sm" type="date" wire:model="date_from" />
                        </div>
                        <div class="col-md-3">
                            <label class="col-form-label-sm"
                                   for="validationTooltip02">Sanagacha</label>
                            <input class="form-control form-control-sm" type="date" wire:model="date_to" />
                        </div>
                        <div class="col-md-3">
                            <label class="col-form-label-sm"
                                   for="validationTooltip02" style="visibility: hidden">12</label>
                            <br>
                            <button class="btn btn-secondary btn-sm edit" data-bs-toggle="modal"
                               data-bs-target="#currencies" title="Edit">
                                Valyutalar kursi
                            </button>
                            <div id="currencies" class="modal fade" tabindex="-1" role="dialog"
                                 aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            Valyutalar kursi
                                        </div>
                                        <div class="modal-body">
                                            @if(count(\Modules\Currency\Entities\Currency::all()) > 0)
                                            <form action="/currencies/1" method="post" class="d-flex">
                                                @csrf
                                                {{ method_field('put') }}
                                                @foreach(\Modules\Currency\Entities\Currency::all() as $value)
                                                    <input type="hidden" name="currency_id[{{ $value->id }}]"
                                                           class="form-control form-control-sm" value="{{ $value->id }}">
                                                <div>
                                                    {{ $value->currency }}
                                                    <input type="text" style="width: 100px;" name="currency_rate[{{ $value->id }}]"
                                                           class="form-control form-control-sm" value="{{ $value->rate }}">
                                                </div>
                                                    <br>
                                                @endforeach
                                                <div>
                                                    <label for="" style="visibility: hidden">22</label><br>
                                                    <button class="btn-sm btn-primary" style="position: absolute; right: 5px;">Saqlash</button>
                                                </div>
                                            </form>
                                            <hr>
                                            @endif
                                            <form action="/currencies" method="post" class="d-flex">
                                                @csrf
                                                <input type="text" style="width: 100px;margin-right: 5px;" name="currency"
                                                       class="form-control form-control-sm" placeholder="Nomlanish, USD, EUR.." required>
                                                <input type="text" style="width: 100px;margin-right: 5px;" name="rate"
                                                       class="form-control form-control-sm" placeholder="Kurs (1$:nisbat)" required>
                                                <input type="text" style="width: 100px;margin-right: 5px;" name="icon"
                                                       class="form-control form-control-sm" placeholder="Kurs simvoli">
                                                <button class="btn-sm btn-primary" style="position: absolute; right: 5px;">Saqlash</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- end col -->
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
                                <th>Turi</th>
                                @foreach(\Modules\Currency\Entities\Currency::all() as $value)
                                    <th>{{ $value->currency }}</th>
                                @endforeach
                                <th>Jami <u style="font-weight: lighter">Eskida</u></th>
                                <th>Jami <u style="font-weight: lighter">Hozirgida</u></th>
                                <th>Kurs farqi</th>
                            </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Kassa</td>
                                    <td></td>
                                    <td> $</td>
                                    <td> $</td>
                                    <td> $</td>
                                </tr>
                                <tr>
                                    <td>Mol summasi</td>
                                    <td></td>
                                    <td> $</td>
                                    <td> $</td>
                                    <td> $</td>
                                </tr>
                                <tr>
                                    <td>Qarzdor</td>
                                    <td></td>
                                    <td> $</td>
                                    <td> $</td>
                                    <td> $</td>
                                </tr>
                                <tr>
                                    <td>Xaqdor</td>
                                    <td></td>
                                    <td> $</td>
                                    <td> $</td>
                                    <td> $</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
        <!-- end col -->
    </div>
</div>

@section('scripts')
    <script src="https://cdn.jsdelivr.net/npm/pikaday/pikaday.js"></script>
    <script>
        var picker = new Pikaday({
            field: document.getElementById('datepicker'),
            format: 'd.m.Y',
            onSelect: function() {
                console.log(this.getMoment().format('d.m.Y'));
            }
        });
    </script>
@endsection
