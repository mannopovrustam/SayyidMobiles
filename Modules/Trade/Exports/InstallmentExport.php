<?php

namespace Modules\Trade\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Modules\Invoice\Entities\Invoice;

class InstallmentExport implements FromView
{
    public function view(): View
    {
        switch (Invoice::find(session()->get('excel_invoice_id'))->type){
            case 1: $type = 'cash'; break;
            case 2: $type = 'loan'; break;
            case 3: $type = 'installment'; break;
            case 4: $type = 'income'; break;
        }

        return view('trade::trade.excel.'.$type, [
            'invoice' => Invoice::find(session()->get('excel_invoice_id')),
        ]);
    }
}
