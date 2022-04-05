<?php

namespace Modules\Currency\Http\Livewire;

use Livewire\Component;

class Convert extends Component
{
    public $currency_from = 1, $currency_to = 1, $summ_from, $summ_to, $currency_rate, $data_id, $data, $from, $to, $summ_id;

    public function mount($data, $data_id)
    {
        $this->data_id = $data_id;
        $this->data = $data;
        if(!$data_id==null){
            $this->summ_from = \Modules\Currency\Entities\Convert::find($data_id)->main_currency_val;
            $this->summ_to = \Modules\Currency\Entities\Convert::find($data_id)->second_currency_val;
        };
    }
    public function render()
    {
        return view('currency::livewire.convert', ['data_id'=>$this->data_id, 'data'=>$this->data]);
    }
}
