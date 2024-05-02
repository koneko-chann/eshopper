<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Scopes\HiddenScope;

class Product extends Model
{
    use HasFactory,SoftDeletes;
    protected $table='products';
    protected $guarded = [];    
     /**
     * The "booting" method of the model.
     *
     * @return void
     */
    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope(new HiddenScope);
    }
    public function productImages()
    {
        return $this->hasMany(ProductImage::class,'product_id');
    }
    public function category()
    {
        return $this->belongsTo(Category::class,'category_id');
    }
}
