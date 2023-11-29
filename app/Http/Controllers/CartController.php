<?php

namespace App\Http\Controllers;

use App\Trait\VariablesTrait;
use Illuminate\Http\Request;
use App\Models\Cart;
use Illuminate\Support\Str;
use App\Models\Product;

class CartController extends Controller
{
    //
    use VariablesTrait;
    public function index()
    {
        $categories = $this->categories;
        $products =  $this->products;
        $carts = auth()->user()->carts;
        //dd($carts);
       


        return view('cart.index', compact('carts', 'categories', 'products'));
    }
    public function update(Request $request, $cart)
    {
        dd($request->quantity1, $cart);
        Cart::find($cart)->update(['quantity' => $request->quantity1]);
        return response()->json(['success' => true]);
    }

    public function store(Request $request)
    {
        $cart = Cart::firstOrCreate([
            'user_id' => auth()->id(),
            'product_id' => $request->product_id,
        ]);

        $cart->increment('quantity');

        return redirect()->route('cart.index');
    }
    public function addToCart(Request $request,$id){
        $quantity = $request->quantity>1 ? $request->quantity : 1;
$product = Product::find($id);  
$cart = Cart::firstOrCreate([
    'user_id' => auth()->id(),
    'product_id' => $request->$id,
    'quantity' => 1
]);

    }
}
