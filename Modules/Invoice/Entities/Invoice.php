<?php

namespace Modules\Invoice\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Modules\Client\Entities\ClientOperation;
use Modules\Product\Entities\Product;

class Invoice extends Model
{
    use HasFactory, SoftDeletes;

    protected $guarded = [];
    public function products() { return $this->hasMany(Product::class); }
    public function client_operations() { return $this->hasMany(ClientOperation::class); }
    public function orders() { return $this->hasMany(Order::class); }

    protected static function newFactory()
    {
        return \Modules\Invoice\Database\factories\InvoiceFactory::new();
    }
}
