<?php

namespace Modules\Invoice\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Modules\Product\Entities\Product;

class Order extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function order_detail() { return $this->hasMany(OrderDetail::class); }
    public function order_products() { return $this->hasMany(Product::class); }

    protected static function newFactory()
    {
        return \Modules\Invoice\Database\factories\OrderFactory::new();
    }
}
