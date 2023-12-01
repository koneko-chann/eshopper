<?php

namespace App\Http\Controllers;

use App\Trait\VariablesTrait;
use Illuminate\Http\Request;
use App\Models\Cart;
use Illuminate\Support\Str;
use App\Models\Product;
use Illuminate\Support\Facades\Session;

class CartController extends Controller
{
    //
    use VariablesTrait;
    public function index()
    {
        
        $categories = $this->categories;
        $products =  $this->products;
        if(auth()->check())
        $carts = auth()->user()->carts;
        //dd($carts);
       else{
    
        $carts = session()->get('cart');
      
       }


        return view('cart.index', compact('carts', 'categories', 'products'));
    }
    public function update(Request $request)
    {
        if(auth()->check()) {
            $user = auth()->user();
            $user->carts()->where('id', $request->id)->update(['quantity' => $request->quantity]);
        }   
        else if($request->id and $request->quantity)
        {
            $cart = session()->get('cart');
            $cart[$request->id]["quantity"] = $request->quantity;
            session()->put('cart', $cart);
            return redirect()->back()->with('success', 'Cart updated successfully');
        }
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
        // $sss=session()->get('cart');
        // dd($sss);
        $product = Product::find($id);

        if (!$product) {
            abort(404);
        }
        $cart = session()->get('cart', []);
        
        session()->put('cart', $cart);
        
       
        if (auth()->check()) {
            $user = auth()->user();
            $userCart = $user->carts()->firstOrCreate(['product_id' => $id]);
            $quantity=$request->query('quantity');
            $userCart->quantity = $userCart->quantity + $quantity;
           
            $userCart->save();
        }
        else{
           
            if (isset($cart[$id])) {
                $cart[$id]['quantity']++;
            } else {
                $cart[$id] = [
                    'name' => $product->name,
                    'quantity' => 1,
                    'price' => $product->price,
                  
                ];
            }
          

        }
        
        return response()->json(['success' => "Thêm vào giỏ hàng thành công"]);
    }
    public function remove(Request $request)
{
    if(auth()->check()) {
        $user = auth()->user();
        $user->carts()->where('id', $request->id)->delete();
    }
    if($request->id) {
        $cart = session()->get('cart');
        if(isset($cart[$request->id])) {
            unset($cart[$request->id]);
           
            session()->put('cart', $cart);
        }
        return response()->json(['success' => true]);
    }
}

}

