<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Trait\VariablesTrait;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth; // Add this import statement
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
 // Add this import statement
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Str;
use App\Models\User;
use App\Models\Cart;
use App\Models\Product;



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
    public function updatePassword(Request $request)
    {
        $request->validate(['email' => 'required|email']);
 
         $status = Password::sendResetLink(
        $request->only('email')
    );
 
    return $status === Password::RESET_LINK_SENT
                ? back()->with(['status' => __($status)])
                : back()->withErrors(['email' => __($status)]);

    }

    public function confirmPassword(Request $request){
        $request->validate([
            'token' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:6|confirmed',
        ]);
     
        $status = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'),
            function (User $user, string $password) {
                $user->forceFill([
                    'password' => Hash::make($password)
                ])->setRememberToken(Str::random(60));
     
                $user->save();
     
                event(new PasswordReset($user));
            }
        );
     
        return $status === Password::PASSWORD_RESET
                    ? redirect()->route('login.index')->with('status', __($status))
                    : back()->withErrors(['email' => [__($status)]]);
    }
}

