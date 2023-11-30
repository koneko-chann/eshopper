<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Session;

class Cart extends Model
{
    use HasFactory;
   protected $guarded = [];
   
    public function addCart($product){
        $cart = [
            'id'=>$product->id,
            'user_id'=>auth()->id(),
            'product_id'=>$product->id,
            'quantity'=>0,
       
        ];
        if(Session::has('cart')){
            $cart = Session::get('cart');
        }
        $cart['quantity']++;
        $cart['price']=$product->price*$cart['quantity'];
        Session::put('cart',$cart);
        Session::save();
    }
    public function product()
    {
        return $this->belongsTo(Product::class);
    }   
}
