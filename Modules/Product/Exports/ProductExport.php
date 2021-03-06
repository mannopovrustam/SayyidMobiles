<?php

namespace Modules\Product\Exports;

use Modules\Product\Entities\Product;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class ProductExport implements FromView
{
    public function view(): View
    {
        return view('product::exportproducts.export');
    }
}
