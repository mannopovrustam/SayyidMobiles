<?php

namespace Modules\Stock\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Modules\Product\Entities\Product;

class Stock extends Model
{
    use HasFactory;

    protected $guarded = [];
    public function products() { return $this->hasMany(Product::class); }
    public function stock_operations(){return $this->hasMany(StockOperation::class);}

    protected static function newFactory()
    {
        return \Modules\Stock\Database\factories\StockFactory::new();
    }
}
