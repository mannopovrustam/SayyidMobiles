<?php

namespace Modules\Invoice\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class OrderDetail extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function order_id(){return $this->belongsTo(Order::class);}

    protected static function newFactory()
    {
        return \Modules\Invoice\Database\factories\OrderDetailFactory::new();
    }
}
