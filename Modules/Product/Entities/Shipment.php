<?php

namespace Modules\Product\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Shipment extends Model
{
    use HasFactory;

    protected $guarded = [];
    public function products() { return $this->hasMany(Product::class); }

    protected static function newFactory()
    {
        return \Modules\Product\Database\factories\ShipmentFactory::new();
    }
}
