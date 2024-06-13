<?php

use App\Http\Controllers\{
    ShopController,
    HomeController,
    LoginController,
    RegisterController,
    CartController,
    DetailController,
    CheckoutController,
    FlashSaleController,
    UserController,
    PaymentController
};
use Faker\Provider\ar_EG\Payment;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\EmailVerificationRequest;
use Illuminate\Http\Request;
 
Route::post('/email/verification-notification', function (Request $request) {
    $request->user()->sendEmailVerificationNotification();
    return back()->with('resent', 'Verification link sent!');
})->middleware(['auth', 'throttle:6,1'])->name('verification.send');
Route::get('/email/verify/{id}/{hash}', function (EmailVerificationRequest $request) {
    $request->fulfill();
    return redirect()->route('home.index');
})->middleware(['auth', 'signed'])->name('verification.verify');
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
Route::middleware(['auth','verified'])->group(function () {
    Route::get('/cart', [CartController::class, 'index'])->name('cart.index');
    Route::get('add-to-cart/{id}', [CartController::class,'addToCart'])->name('cart.add');
    Route::patch('update-cart', [CartController::class,'update'])->name('cart.update');
    Route::delete('remove-from-cart', [CartController::class,'remove'])->name('cart.remove');
    Route::get('/checkout', [CheckoutController::class, 'index'])->name('checkout.index');
    Route::post('/checkout/{ids}', [CheckoutController::class, 'store'])->name('checkout.store');
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
Route::get('/email/verify', function () {
    return view('auth.verify-email');
})->middleware('auth')->name('verification.notice');
Route::get('/forgot-password', function () {
    return view('auth.passwords.email');
})->middleware('guest')->name('password.request');
Route::post('/forgot-password', [LoginController::class, 'updatePassword'])->middleware('guest')->name('password.email');
Route::get('/reset-password/{token}', function (string $token) {
    return view('auth.passwords.reset', ['token' => $token]);
})->middleware('guest')->name('password.reset');
Route::post('/reset-password',[LoginController::class,'confirmPassword'])->middleware('guest')->name('password.update');
Route::get('/flashsales', [FlashSaleController::class,'index'])->name('flashsales.index');
Route::get('/vnpay/payment-return', [CheckoutController::class, 'vnpayReturn'])->name('payment.vnpay.return');