<?php

namespace Modules\Currency\Http\Livewire;

use Livewire\Component;

class CurrencyDifference extends Component
{
    public $date_from, $date_to, $submit;

    public function mount()
    {
        $this->date_from = '';
        $this->date_to = '';

    }
    public function render()
    {
        return view('currency::livewire.currency-difference');
    }

    public function product_summ()
    {

    }
    public function debtor()
    {

    }
    public function creditor()
    {

    }
}
