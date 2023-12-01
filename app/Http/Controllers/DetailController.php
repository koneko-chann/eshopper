<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Trait\VariablesTrait;
use Illuminate\Http\Request;

class DetailController extends Controller
{
    //
    use VariablesTrait;
    public function index($id){
        $id = $id;
        $categories = $this->categories;
        $products = $this->products;
        $product=Product  ::find($id);

    
        return view('shop.detail',compact('id','categories','products','product'));
    }
}
