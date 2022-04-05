<div xmlns:wire="http://www.w3.org/1999/xhtml">
    <div class="row">
        <div class="col-md-2">
            <label class="col-form-label-sm"
                   for="validationTooltip02">Sana</label>
            <input class="form-control form-control-sm" type="date" name="date"
                   value="{{ \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', now())->format('Y-m-d') }}"
                   id="example-date-input">
        </div>
        <br>
        <div class="col-md-2">
            <label class="col-form-label-sm"
                   for="validationTooltip02">Kirim\Chiqim</label>
            <select name="type" class="form-control form-control-sm"  id="">
                <option value="1">Kirim</option>
                <option value="-1">Chiqim</option>
            </select>
        </div>

        <div class="col-md-2">
            <label class="col-form-label-sm"
                   for="validationTooltip02">Valyuta</label>
            <select wire:model="currency_id" name="sum_currency_id" class="form-select form-select-sm"  id="">
                <option value="{{ $main_currency }}">{{ currency($main_currency) ? currency($main_currency)->currency : null }}</option>
                @foreach(explode("|", $second_currency) as $item)
                    <option value="{{ $item }}">{{ currency($item) ? currency($item)->currency : null }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-md-5">
            <label class="col-form-label-sm" for="validationTooltip02">Izoh</label>
            <input class="form-control form-control-sm" type="text" name="note" value="" id="example-date-input">
        </div>
    </div>
    <br>
{{--    {{dd($main_currency)}}--}}
{{--        {{dd($currency_id)}}--}}
    <div class="row">
        <?php
            $residue = (int)$summ;
            $residue = $residue - change_currency($main_currency_pay, $main_currency, $currency_id);
            for ($i = 0; $i<count(explode("|", $this->second_currency)); $i++){
                $item = explode("|", $this->second_currency)[$i];
                $residue = $residue - change_currency($this->second_currency_pay[$item], $item, $currency_id);
            }
        ?>

        <div class="col-md-2">
            <label class="col-form-label-sm"
                   for="validationTooltip02">Summa {{ currency($currency_id) ? currency($currency_id)->currency : null }}</label>
            <input class="form-control form-control-sm" type="text" wire:model="summ" name="sum" id="example-date-input">
        </div>
        <div class="col-md-2">
            <label class="col-form-label-sm"
                   for="validationTooltip02">Valyuta {{ currency($currency_id) ? currency($currency_id)->currency : null }}</label>
            <?php
                $sum_val = 0 + change_currency($main_currency_pay, $main_currency, $currency_id);
                foreach($second_currency_pay as $key => $pay){
                    $sum_val += change_currency($pay, $key, $currency_id);
                }

                if((int)$summ!=0){
                    if(currency($currency_id)){
                        $sum_rate = (($sum_val   *     (intval(currency($currency_id)->rate))     ) / (int)$summ);
                    }else{
                        $sum_rate = 0;
                    }
                }else{
                    $sum_rate = null;
                }
            ?>

            <input type="text" name="sum_currency_rate" class="form-control form-control-sm" value="{{ round($sum_rate,2) }}" readonly>
        </div>
        <div class="col-md-1">
            <label class="col-form-label-sm"
                   for="validationTooltip02">{{ currency($main_currency) ? currency($main_currency)->currency : null }}(kassa) {{ change_currency($residue, $currency_id, $main_currency) }}</label>
            <input class="form-control form-control-sm" type="text" wire:model="main_currency_pay" name="main_currency_pay" value="" id="example-date-input">
            <input type="hidden" name="main_currency_id" value="{{$main_currency}}" >
            <input type="hidden" name="second_currency_id" value="{{$second_currency}}" >
        </div>
        @foreach(explode("|", $second_currency) as $item)
            <div class="col-md-1">
                <label class="col-form-label-sm" for="validationTooltip02">{{ currency($item) ? currency($item)->currency : null }}(kassa) {{ change_currency($residue, $currency_id, $item) }}</label>
                <input class="form-control form-control-sm" type="text" wire:model="second_currency_pay.{{ $item }}" name="second_currency_pay[]" value="" id="example-date-input">
            </div>
        @endforeach


        <div class="col-md-2 d-grid gap-2">
            <input class="btn btn-success" type="submit" value="Saqlash">
        </div>
    </div>
    <script>
        document.getElementsByTagName("input").addEventListener("focus", function () {
            this.select();
        });
    </script>


</div>
