<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use App\Trait\VariablesTrait;
use Illuminate\Http\Request;

class ShopController extends Controller
{
    //
   use VariablesTrait;

    public function index(Request $request){
        $categories = Category::all();
        $products = Product::query();
    
        if ($request->has(['min_price', 'max_price']) && $request->filled(['min_price', 'max_price'])) {
            $products = $products->whereBetween('price', [$request->min_price, $request->max_price])->paginate(9);
        $products->appends($request->only(['min_price', 'max_price']));

        } else {
            $products = $products->paginate(9);
        }
    
    
        return view('shop.shop',compact('categories','products'));
    }
    public function search(Request $request)
{
    $categories = Category::all();
    $query = $request['query'];
    $products = Product::where('name', 'like', "%{$query}%")->paginate(9);
    return view('shop.shop', compact('products', 'categories'));    
}
public function categoryProducts($id)
{
    $categories = Category::all();
    $category = Category::find($id);
    $products = $category->products()->paginate(9);
    return view('shop.shop', compact('products', 'categories'));
}
}
