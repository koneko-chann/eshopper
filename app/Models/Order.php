<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
        protected $guarded = [];
        protected $table='orders';
        public function orderItems(){
            return $this->hasMany(Order_items::class,'order_id');
        }
        public function user(){
            return $this->belongsTo(User::class,'user_id');
        }
}
