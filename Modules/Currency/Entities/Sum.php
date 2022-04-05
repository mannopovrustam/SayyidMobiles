<?php

namespace Modules\Currency\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Modules\Client\Entities\Client;
use Modules\Client\Entities\ClientOperation;

class Sum extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function client_operation(){return $this->belongsTo(ClientOperation::class);}

    protected static function newFactory()
    {
        return \Modules\Currency\Database\factories\SumFactory::new();
    }
}
