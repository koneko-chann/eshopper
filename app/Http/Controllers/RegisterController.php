<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Auth\Events\Registered;
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
        try{
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
           
            $user_role=$user->roles()->attach(2);
            $user->sendEmailVerificationNotification();
            event(new Registered($user));
            auth()->login($user);
            return redirect()->route('verification.notice');
        }
        catch(\Exception $e){
            return redirect()->route('register.index')->with('error',$e->getMessage());
        }
       

    }
}
