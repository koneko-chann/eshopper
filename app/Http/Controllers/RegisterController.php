<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use App\Trait\VariablesTrait;

class RegisterController extends Controller
{
    //
    use VariablesTrait;
    public function index()
    {
        $categories=$this->categories;
      $products=  $this->products;
        return view('register.index',compact('categories','products'));
    }

    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|max:255',
            'email' => 'required|email|max:255|unique:users',
            'password' => 'required|min:6|confirmed',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);
       

        auth()->login($user);

        return redirect()->route('home.index');
    }
}
