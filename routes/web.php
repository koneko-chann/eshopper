<?php

use App\Http\Controllers\{
    ShopController,
    HomeController,
    LoginController,
    RegisterController,
    CartController,
    DetailController,
    CheckoutController,
    UserController
};
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

// Home routes
Route::get('/', [HomeController::class, 'index'])->name('home.index');

// Shop routes
Route::prefix('shop')->group(function () {
    Route::get('/', [ShopController::class, 'index'])->name('shop.index');
    Route::get('/search', [ShopController::class, 'search'])->name('shop.search');
    Route::get('/category/{id}', [ShopController::class, 'categoryProducts'])->name('shop.category');
    Route::get('/{id}', [DetailController::class, 'index'])->name('detail.index');
});

// Auth routes
Route::get('/login', [LoginController::class, 'index'])->name('login.index');
Route::post('/login', [LoginController::class, 'attemptLogin'])->name('login.auth');
Route::get('/logout', function () {
    Auth::logout();
    return redirect()->route('home.index');
})->name('logout');
Route::get('/register', [RegisterController::class, 'index'])->name('register.index');
Route::post('/register', [RegisterController::class, 'register'])->name('register.auth');

// Cart routes
Route::middleware('auth')->group(function () {
    Route::get('/cart', [CartController::class, 'index'])->name('cart.index');
    Route::get('add-to-cart/{id}', [CartController::class,'addToCart'])->name('cart.add');
    Route::patch('update-cart', [CartController::class,'update'])->name('cart.update');
    Route::delete('remove-from-cart', [CartController::class,'remove'])->name('cart.remove');
    Route::get('/checkout', [CheckoutController::class, 'index'])->name('checkout.index');
    Route::post('/checkout', [CheckoutController::class, 'store'])->name('checkout.store');
    Route::get('/checkout/success', function () {
        return view('checkout.success');
    })->name('checkout.success');
    Route::get('/profile', [UserController::class, 'index'])->name('profile.index');
    Route::post('/profile', [UserController::class, 'update'])->name('profile.update');
    Route::get('/profile/orders', [UserController::class, 'orders'])->name('profile.orders');
    Route::get('/rating/{id}', [UserController::class, 'rating'])->name('rate.index');
    Route::post('/rating/{id}', [UserController::class, 'rateStore'])->name('rate.store');
});

// Error routes
Route::get('/404', function () {
    return view('404.404');
})->name('404');
Route::get('/500error', function () {
    return view('errors.500');
})->name('500');