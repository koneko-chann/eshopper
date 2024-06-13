<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FlashSaleProducts extends Model
{
    use HasFactory;
    protected $guarded = [];
    protected $table = 'product_sale';
    public function product()
    {
        return $this->belongsTo(Product::class);
    }
    public function flashSale()
    {
        return $this->belongsTo(FlashSale::class);
    }
}
