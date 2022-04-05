<?php

namespace Modules\Client\Http\Livewire;

use Livewire\Component;

class ClientPay extends Component
{
    public $data, $currency_rate, $currency_id, $main_currency_pay = 0, $main_currency_pay_offer = 0, $second_currency_pay = [], $second_currency_pay_offer = [];
    public $main_currency, $second_currency = [], $summ, $second_currency_pay_rate;

    public function mount($data)
    {
        $this->data = $data;
        $this->currency_id = $this->data->main_currency_id;
        foreach (explode("|", $this->data->second_currency_id) as $item){
            $this->second_currency_pay[$item] = 0;
        }
    }

    public function render()
    {
        $this->main_currency = $this->data->main_currency_id;
        $this->second_currency = $this->data->second_currency_id;

        return view('client::livewire.client-pay');
    }

    public function next_element($subject)
    {

    }
}
