<?php

namespace Modules\Client\Http\Livewire;

use Livewire\Component;
use Modules\Client\Entities\ClientPayment;
use Modules\Currency\Entities\Sum;
use Modules\Invoice\Entities\Invoice;

class ClientReportSetting extends Component
{

    public $currency_id, $summ_array = [], $summ, $clients_report, $arr = [], $sort = [], $radioType;

    public function mount()
    {
        $this->currency_id = 1;
        $this->radioType = 1;
    }

    public function render()
    {

        foreach (\Modules\Client\Entities\Client::all() as $key=>$value){
            $clients_report_marge = array_merge(Invoice::where('client_id', $value->id)->get()->toArray(),
                ClientPayment::where('client_id', $value->id)->get()->toArray());

            $this->summ_array = [];
            $this->clients_report[$key] = $value;

            if (!$clients_report_marge){
                $this->clients_report[$key]['summ'] = 0;
                $this->sort['sort'][$key] = 0;
            }

            if ($clients_report_marge){
                foreach ($clients_report_marge as $key1 => $cr){
                    $sum = Sum::find($cr['sum_id']);
                    if ($cr['type'] == -1){
                        if($sum->main_currency_pay && $sum->main_currency_rate){
                            $this->summ_array[] = -change_currency_rate($sum->main_currency_pay, $sum->main_currency_rate, 1);
                        }
                        if($sum->second_currency_id && $sum->main_currency_pay){
                            foreach (explode("|", $sum->second_currency_id) as $second_currency_rate){
                                if ($second_currency_rate){
                                    $this->summ_array[] = -change_currency_rate($sum->main_currency_pay, $second_currency_rate, 1);
                                }
                            }
                        }
                    }else{
                        if($cr['sum_id']){
                            if($sum){
                                if(!is_null($sum->main_currency_pay) && !is_null($sum->main_currency_rate)) {
                                    $this->summ_array[] = change_currency_rate($sum->main_currency_pay, $sum->main_currency_rate, 1);
                                }
                                if($sum->second_currency_id && $sum->main_currency_pay) {
                                    foreach (explode("|", $sum->second_currency_id) as $second_currency_rate) {
                                        if ($second_currency_rate) {
                                            $this->summ_array[] = change_currency_rate($sum->main_currency_pay, $second_currency_rate, 1);
                                        }
                                    }
                                }
                            }
                        }
                    }
                    $this->clients_report[$key]['summ'] = array_sum($this->summ_array);
                    $this->sort['sort'][$key] = array_sum($this->summ_array);
                    $this->clients_report[$key]['summ'] = change_currency($this->clients_report[$key]['summ'], 1, $this->currency_id);

                    switch ($this->radioType){
                        case 2:
                            if ($this->clients_report[$key]['summ'] > 0){
                                unset($this->clients_report[$key]);
                                unset($this->sort['sort'][$key]);
                            }
                            break;
                        case 3:
                            if ($this->clients_report[$key]['summ'] < 0){
                                unset($this->clients_report[$key]);
                                unset($this->sort['sort'][$key]);
                            }
                            break;
                    }
                }

            }
        }

        array_multisort($this->sort['sort'], SORT_ASC, $this->clients_report);

        return view('client::livewire.client-report-setting');
    }

}
