<?php

use App\Http\Controllers\ShopController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\CartController;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\DetailController;

Route::get('/', [HomeController::class, 'index'])->name('home.index');
Route::get('/shop', [ShopController::class, 'index'])->name('shop.index');
Route::get('/login', [LoginController::class, 'index'])->name('login.index');
Route::post('/login', [LoginController::class, 'attemptLogin'])->name('login.auth');
Route::get('/logout', function () {
    Auth::logout();
    return redirect()->route('home.index');
})->name('logout');
Route::get('/register', [RegisterController::class, 'index'])->name('register.index');
Route::post('/register', [RegisterController::class, 'register'])->name('register.auth');
Route::get('/cart', [CartController::class, 'index'])->name('cart.index');

Route::get('add-to-cart/{id}', [CartController::class,'addToCart'])->name('cart.add');


Route::patch('update-cart', [CartController::class,'update'])->name('cart.update');
Route::delete('remove-from-cart', [CartController::class,'remove'])->name('cart.remove');
Route::get('checkout', [CartController::class,'checkout'])->name('cart.checkout');
Route::post('checkout', [CartController::class,'checkoutStore'])->name('cart.checkout.store');

Route::get('/shop/{id}', [DetailController::class, 'index'])->name('detail.index'); 
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

//Route::get('/', 'HomeController@index');
