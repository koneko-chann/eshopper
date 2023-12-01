<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Trait\VariablesTrait;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth; // Add this import statement

class LoginController extends Controller
{
    //
    use VariablesTrait;

    protected function attemptLogin(Request $request)
    {
        $credentials = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required'],
        ]);

        if (Auth::attempt($credentials)) { // Update this line
           // $request->session()->regenerate();
            
           // session()->forget('cart');
            return redirect()->route('home.index');
        }

        return back()->withErrors([
            'email' => 'The provided credentials do not match our records.',
        ]);
    }

    public function index()
    {
        $categories = $this->categories;
        $products = $this->products;
   
        return view('login.index', compact('categories', 'products'));
    }
    public function logout()
    {
        Auth::logout();
        dd(auth()->user());
        return redirect()->route('home.index');
    }
}

