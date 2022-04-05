<?php

function change_currency($cur_value, $cur_from, $cur_to){
    if(\Modules\Currency\Entities\Currency::find($cur_from) && \Modules\Currency\Entities\Currency::find($cur_to)){
        $usd = 1/(double)\Modules\Currency\Entities\Currency::find($cur_from)->rate;
        $crrM = (double)\Modules\Currency\Entities\Currency::find($cur_to)->rate;
        return round(($cur_value?$cur_value:0)*$usd*$crrM, 2,0);
    }else{
        return null;
    }
}

function change_currency_rate($cur_value, $cur_from_rate, $cur_to_rate){
    if ($cur_from_rate != 0) {
        $usd = 1 / $cur_from_rate;
        $crrM = $cur_to_rate;
        return round(($cur_value ? $cur_value : 0) * $usd * $crrM, 2, 0);
    }else{
        return round(($cur_value ? $cur_value : 0) * 1 * $cur_to_rate, 2, 0);
    }
}

function get_rate($sum, $main_val, $second_val){
    if ($sum != null || $main_val != null || $second_val != null){
        if($sum != $main_val){
            return round($second_val / ($sum - $main_val), 2, 0);
        }else{
            return round($second_val/$main_val, 2, 0);
        }
    }
}

function currency($id){
    return \Modules\Currency\Entities\Currency::find($id);
}

function sum($id){
    return \Modules\Currency\Entities\Sum::find($id);
}
