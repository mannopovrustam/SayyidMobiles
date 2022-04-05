<?php

namespace App\Imports;

use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Modules\Mark\Entities\Mark;
use Modules\Product\Entities\Product;
use Modules\Stock\Entities\StockMark;

class StockMarksImport implements ToModel, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        $request = request();

        if (Mark::where('name', $row['maxsulot'])->get()->count() == 0){ $mark = Mark::create(['name' => $row['maxsulot']]); }
        else{ $mark = Mark::where('name', $row['maxsulot'])->first(); }

        StockMark::updateOrCreate(['price_type_id' => $request->price_type_id, 'mark_id' => $mark->id], [
            'price_type_id' => $request->price_type_id,
            'currency_id' => $request->main_currency_id,
            'mark_id' => $mark->id,
            'price' => $row['narx'],
            'bonus' => $request->get('bonus', null)
        ]);
    }
}
