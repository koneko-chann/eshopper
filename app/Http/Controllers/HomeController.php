<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Slider;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    //
    public function index(){

        Auth::attempt(['email' => 'admin@gmail.com', 'password' => '1']);
        $sliders=Slider::latest()->get();
        $categories=Category::where('parent_id',0)->get();
        $products=Product::latest()->take(8)->get();
        $recommendProducts=Product::latest('view_count','desc')->take(6)->get();
        $categoriesLimit=Category::take(6)->get();
        return view('home.home',compact('sliders','categories','products','recommendProducts','categoriesLimit'));
    }
}
