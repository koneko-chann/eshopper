<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CheckoutController extends Controller
{
    //
    public function index(Request $request)
    {
        $categories = \App\Models\Category::all();
    $ids = explode(',', $request->ids); // convert ids string to array
    $cart = Cart::where('user_id', auth()->id())->whereIn('id', $ids)->get();

    if ($cart->count() == 0) {
        return redirect()->route('cart.index')->with('error', 'Giỏ hàng của bạn đang trống,hãy chọn một vài sản phấm');
    }
    return view('checkout.index', compact('categories', 'cart'));
    }
    public function store(Request $request,$ids)
    {
        $categories = \App\Models\Category::all();
        DB::beginTransaction();
        $ids = explode(',', $ids);
        $cart = Cart::where('user_id', auth()->id())->whereIn('id',$ids)->get();
        $totalPrice = 0;
        foreach ($cart as $item) {
            $totalPrice += $item->product->price * $item->quantity;
        }
        // add to orders table
        $order = [
            'user_id' => auth()->id(),
            'total_price' => $totalPrice,
            'payment_method' => 'cash',
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'address' => $request->city . '/' . $request->district . '/' . $request->ward . '/' . $request->street,
            'phone_number' => $request->phone_number,
        ];
        $order = Order::create($order);
        foreach ($cart as $c) {
            
            $order->orderItems()->create([
                'product_id' => $c->product_id,
                'quantity' => $c->quantity,
                'price' => $c->product->price,
            ]);
            $c->delete();
        }
        DB::commit();
        return view('checkout.success', compact('categories', 'order'));
    }
}
