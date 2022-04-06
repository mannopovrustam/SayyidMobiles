<?php

namespace Modules\Stock\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;

class CashExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        //
    }
}
