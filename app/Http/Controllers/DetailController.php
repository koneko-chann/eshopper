<?php

namespace App\Http\Controllers;

use App\Models\Order_items;
use App\Models\Product;
use App\Trait\VariablesTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DetailController extends Controller
{
    //
    use VariablesTrait;
    public function index($id){
        $categories = $this->categories;
        $products = $this->products;
        $product=Product  ::find($id);
       // $comments = Order_items::where('product_id',$id)->whereNotNull('comment')->get(['comment']);
    $comments = DB::table('order_items')
    ->join('orders','order_items.order_id','=','orders.id')
    ->join('users','orders.user_id','=','users.id')
    ->select('users.name','order_items.comment','order_items.comment_time','order_items.rate')
    ->where('order_items.product_id',$id)
    ->whereNotNull('order_items.comment')
    ->get();
        return view('shop.detail',compact('id','categories','products','product','comments'));
    }
}
