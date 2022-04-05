<?php

namespace App\Imports;

use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Modules\Mark\Entities\Brand;
use Modules\Mark\Entities\Mark;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToModel;

class MarksImport implements ToModel, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        if (Brand::where('name', $row['brend'])->get()->count() == 0){ $brand = Brand::create(['name' => $row['brend']]); }
        else{ $brand = Brand::where('name', $row['brend'])->first(); }

        $data = new Mark();
        $data->type_id = 1;
        $data->brand_id = $brand->id;
        $data->name = $row['maxsulot'];
        $data->version = $row['versiya'];
        $data->save();
    }
}
