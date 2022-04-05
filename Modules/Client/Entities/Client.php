<?php

namespace Modules\Client\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Client extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function client_operations(){return $this->hasMany(ClientOperation::class);}

    protected static function newFactory()
    {
        return \Modules\Client\Database\factories\ClientFactory::new();
    }
}
