<?php

namespace Modules\Stock\Entities;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Cashbox extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected static function newFactory()
    {
        return \Modules\Stock\Database\factories\CashboxFactory::new();
    }

    public static function balance($data)
    {
        $cashbox = self::create($data);
        $cashbox->date = Carbon::createFromFormat('Y-m-d H:i:s', now())->format('d.m.Y');
        $cashbox->save();
    }

}
