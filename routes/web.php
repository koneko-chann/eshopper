<?php

use App\Http\Controllers\ShopController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\CartController;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\DetailController;
use App\Http\Controllers\CheckoutController;

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

Route::get('/shop/search', [ShopController::class, 'search'])->name('shop.search');
Route::get('/shop/category/{id}', [ShopController::class, 'categoryProducts'])->name('shop.category');
Route::get('/shop/{id}', [DetailController::class, 'index'])->name('detail.index'); 

Route::get('/checkout', [CheckoutController::class, 'index'])->name('checkout.index');
Route::post('/checkout', [CheckoutController::class, 'store'])->name('checkout.store');

Route::get('/checkout/success', function () {
    return view('checkout.success');
})->name('checkout.success');
Route::get('/404', function () {
    return view('404.404');
})->name('404');
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
