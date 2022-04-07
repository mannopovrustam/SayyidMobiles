<?php

namespace Modules\Trade\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Modules\Invoice\Entities\Invoice;

class IncomeExport implements FromView
{
    protected $invoices;

    public function __construct($invoices)
    {
        $this->invoices = $invoices;
    }

    public function view(): View
    {
        switch (Invoice::find($this->invoices)->type){
            case 1: $type = 'cash'; break;
            case 2: $type = 'loan'; break;
            case 3: $type = 'installment'; break;
            case 4: $type = 'income'; break;
        }

        return view('trade::trade.excel.'.$type, [
            'invoice' => Invoice::find($this->invoices),
        ]);
    }
}
