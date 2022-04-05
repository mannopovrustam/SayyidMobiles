<?php

namespace Modules\Stock\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Modules\Invoice\Entities\Invoice;

class StockOperation extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function invoice(){return $this->belongsTo(Invoice::class);}
    public function stock(){return $this->belongsTo(Stock::class);}

    protected static function newFactory()
    {
        return \Modules\Stock\Database\factories\StockOperationFactory::new();
    }
}
