<?php

namespace Modules\Stock\Exports;

use Modules\Stock\Entities\StockPayment;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class StockPaymentExport implements FromView
{
    public function view(): View
    {
        return view('stock::stockpayments.export', [
            'stock_id' => session()->get('stock_id')
        ]);
    }
}
