<?php

namespace Modules\Product\Entities;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Modules\Invoice\Entities\Invoice;
use Modules\Invoice\Entities\Order;
use Modules\Mark\Entities\Mark;
use Modules\Stock\Entities\Stock;

class Product extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function stock_id(){return $this->belongsTo(Stock::class);}
    public function user_id(){return $this->belongsTo(User::class);}
    public function shipment_id(){return $this->belongsTo(Shipment::class);}
    public function invoice_id(){return $this->belongsTo(Invoice::class);}
    public function mark(){return $this->belongsTo(Mark::class);}
    public function order_id(){return $this->belongsTo(Order::class);}

    protected static function newFactory()
    {
        return \Modules\Product\Database\factories\ProductFactory::new();
    }
}
