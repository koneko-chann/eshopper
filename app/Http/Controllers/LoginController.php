<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Trait\VariablesTrait;
class LoginController extends Controller
{
    //
    use VariablesTrait;
    public function index(){
    $categories = $this->categories;
    $products = $this->products;
        return view('login.index',compact('categories','products'));
    }
}
