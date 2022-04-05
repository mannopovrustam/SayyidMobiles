<?php

namespace Modules\Currency\Http\Livewire;

use Livewire\Component;

class ConvertEdit extends Component
{
    public $currency_from = 1, $currency_to = 1, $summ_from, $summ_to, $currency_rate, $data_id, $data, $from, $to;

    public function mount($data, $data_id)
    {
        $this->data_id = $data_id;
        $this->data = $data;
        $this->summ_from = $data->main_currency_val;
        $this->summ_to = $data->second_currency_val;
        $this->currency_to = $data->currency_to;
        $this->currency_from = $data->currency_from;
    }
    public function render()
    {
        return view('currency::livewire.convert-edit', ['data_id'=>$this->data_id, 'data'=>$this->data]);
    }
}
