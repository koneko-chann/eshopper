<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class UserController extends Controller
{
    //
    public function index(){
        $categories = Category::all();
        $user = auth()->user();
        return view('profile.index',compact('categories','user'));
    }
    public function update(Request $request){
        $user = auth()->user();
        $user->update([
            'name'=>$request->name,
            'email'=>$request->email,
            'phone'=>$request->phone,
            'address'=>$request->city.'/'.$request->district. '/'.$request->ward.'/'.$request->street,
        ]
        );
        return redirect()->back()->with('success','Cập nhật thông tin thành công');
    }
    public function orders(){
        $categories = Category::all();
        $user = auth()->user();
        $orders = $user->orders->take(10);
        return view('profile.orders',compact('categories','user','orders'));
    }
    public function rating(Request $request,$id){
        $categories = Category::all();
        $user = auth()->user();
        $order=$user->orders->find($id);
        $product_id=request()->product_id;
      
      return view('shop.rating',compact('categories','user','order'));
    }
    public function rateStore(Request $request,$id){
        $user = auth()->user();
        $order=$user->orders->find($id);
        $product_id=request()->product_id;
        $order->orderItems->where('product_id',$product_id)->first()->update([
            'comment'=>$request->comment,
            'rate'=>$request->rating,
            'comment_time'=>now(),
        ]);
        return redirect()->route('profile.orders')->with('success','Đánh giá thành công');

    }

}
