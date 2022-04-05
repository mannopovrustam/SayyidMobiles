<?php

namespace Modules\Mark\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Modules\Product\Entities\Product;

class Mark extends Model
{
    use HasFactory;

    protected $guarded = [];
    public function type_id(){return $this->belongsTo(Type::class);}
    public function brand(){return $this->belongsTo(Brand::class);}

    public function products() { return $this->hasMany(Product::class); }

    protected static function newFactory()
    {
        return \Modules\Mark\Database\factories\MarkFactory::new();
    }
}
