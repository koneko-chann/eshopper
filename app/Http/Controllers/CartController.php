<?php

namespace App\Http\Controllers;

use App\Trait\VariablesTrait;
use Illuminate\Http\Request;
use App\Models\Cart;
use Illuminate\Support\Str;
use App\Models\Product;
use App\Models\Warehouse;
use Illuminate\Support\Facades\Session;
use App\Models\WarehouseProducts;

class CartController extends Controller
{
    //
    use VariablesTrait;
    private $warehouseProducts;
    private $cart;
   private $warehouse;
    public function __construct( WarehouseProducts $warehouseProducts,Cart $cart,Warehouse $warehouse)
    {
        $this->warehouseProducts = $warehouseProducts;
        $this->cart = $cart;
        $this->warehouse = $warehouse;
    }
    public function index()
    {
        
        $categories = $this->categories;
        $products =  $this->products;

        if(auth()->check()){
            $carts = auth()->user()->carts;
         //   dd($carts);

        }
       else{
    
        $carts = session()->get('cart');
      
       }


        return view('cart.index', compact('carts', 'categories', 'products'));
    }
    public function update(Request $request)
    {
        $availableQuantity = $this->warehouseProducts::where('product_id',$this->cart->find($request->id)->product->id )->sum('quantity');
if($request->quantity > $availableQuantity){
    return response()->json([
        'error' => "Số lượng sản phẩm không đủ, thêm tối đa " . $availableQuantity . " sản phẩm.",
        'max_quantity' => $availableQuantity,
        'product_id' => $request->id
    ]);
}

// Continue with the rest of your code if the quantity is sufficient

        if(auth()->check()) {
            $user = auth()->user();
            $user->carts()->where('id', $request->id)->update(['quantity' => $request->quantity]);
            return response()->json(['success' => true]);
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
    // public function checkQuantity($id,$quantity)
    // {
    //     $quantityAvailable = $this->warehouseProducts->productQuantityInWarehouse($id);
    //     if($quantityAvailable < $quantity){
    //         return false;
    //     }
        
    // }
    public function addToCart(Request $request,$id){
        // $sss=session()->get('cart');
        // dd($sss);
        $product = Product::find($id);

        if (!$product) {
            abort(404);
        }
        $cart = session()->get('cart', []);
        
        session()->put('cart', $cart);
        
       if($this->warehouseProducts->where('product_id',$id)->sum('quantity')<$request->query('quantity')){
           return response()->json(['error' => "Số lượng sản phẩm không đủ, thêm tối đa ".$this->warehouseProducts->productQuantityInWarehouse($id) ." sản phẩm "]);
       }
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
        $cartCount=count(auth()->user()->carts);
        
        return response()->json(['success' => "Thêm sản phẩm vào giỏ hàng thành công",'cartCount'=>$cartCount]);
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

