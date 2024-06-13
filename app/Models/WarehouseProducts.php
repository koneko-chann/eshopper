<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WarehouseProducts extends Model
{
    use HasFactory;
    protected $table = 'warehouse_products';
    public function productQuantityInWarehouse($id){
        return $this->where('product_id', $id)->where('warehouse_id',config('default_warehouse'))->value('quantity');
    }
}
