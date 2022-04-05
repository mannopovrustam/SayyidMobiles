<?php

namespace Modules\Mark\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Brand extends Model
{
    use HasFactory;

    protected $guarded = [];
    public function marks() { return $this->hasMany(Mark::class); }

    protected static function newFactory()
    {
        return \Modules\Mark\Database\factories\BrandFactory::new();
    }
}
