<?php

namespace Modules\Trade\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class TransferExport implements FromView
{
    public function view(): View
    {
        return view('trade::trade.excel.transfer');
    }
}
