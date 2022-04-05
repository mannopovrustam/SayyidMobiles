<?php

namespace Modules\Client\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Modules\Currency\Entities\Sum;
use Modules\Invoice\Entities\Invoice;

class ClientOperation extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function invoice(){return $this->belongsTo(Invoice::class);}
    public function client(){return $this->belongsTo(Client::class);}

    protected static function newFactory()
    {
        return \Modules\Client\Database\factories\ClientOperationFactory::new();
    }
}
