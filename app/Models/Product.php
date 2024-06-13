<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Scopes\HiddenScope;
use App\Models\FlashSaleProducts;
use App\Models\FlashSale;

class Product extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'products';
    protected $guarded = [];

    // Thêm các thuộc tính vào mảng $appends để chúng được tự động thêm vào JSON hoặc mảng
    protected $appends = ['old_price', 'new_price', 'quantity_remain_discount'];

    protected static function boot()
    {
        parent::boot();
        static::addGlobalScope(new HiddenScope);
    }

    public function productImages()
    {
        return $this->hasMany(ProductImage::class, 'product_id');
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function flashSaleProducts()
    {
        return $this->hasMany(FlashSaleProducts::class);
    }

    // Accessor để lấy giá cũ
    public function getOldPriceAttribute()
    {
        return $this->price;
    }

    // Accessor để lấy giá mới nếu có Flash Sale
    public function getNewPriceAttribute()
    {
        $flashSale = FlashSale::active()
            ->where('start_at', '<=', now())
            ->where('end_at', '>=', now())
            ->first();

        if ($flashSale) {
            $flashSaleProduct = $flashSale->products()->where('product_id', $this->id)->first();
            if ($flashSaleProduct && $flashSaleProduct->pivot->quantity > 0) {
                return $flashSaleProduct->pivot->price_after_discount;
            }
        }
        return null; // Nếu không có Flash Sale, trả về null
    }

    // Accessor để lấy số lượng còn lại trong Flash Sale
    public function getQuantityRemainDiscountAttribute()
    {
        $flashSale = FlashSale::active()
            ->where('start_at', '<=', now())
            ->where('end_at', '>=', now())
            ->first();
        if ($flashSale) {
            $flashSaleProduct = $flashSale->products()->where('product_id', $this->id)->first();
            if ($flashSaleProduct) {
                return $flashSaleProduct->pivot->quantity;
            }
        }
        return 0; // Nếu không có Flash Sale, trả về 0
    }
}
