<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\WarehouseProducts;
use App\Models\FlashSale;
use App\Models\Warehouse;

class CheckoutController extends Controller
{
    //
    private $wareHouse;
    public function __construct(Warehouse $wareHouse)
    {
        $this->wareHouse = $wareHouse;
    }
    public function index(Request $request)
    {
        $categories = \App\Models\Category::all();
        $ids = explode(',', $request->ids); // convert ids string to array
        $cart = Cart::where('user_id', auth()->id())->whereIn('id', $ids)->get();

        if ($cart->count() == 0) {
            return redirect()->route('cart.index')->with('error', 'Giỏ hàng của bạn đang trống,hãy chọn một vài sản phấm');
        }
        return view('checkout.index', compact('categories', 'cart'));
    }
    public function store(Request $request, $ids)
    {
        $categories = \App\Models\Category::all();
        DB::beginTransaction();

        try {
            $ids = explode(',', $ids);
            $totalPrice = 0;
            // Kiểm tra tồn tại của sản phẩm trong kho hàng
            foreach ($ids as $id) {
                $cart = Cart::find($id);
                $product = $cart->product;
                $warehouseProduct = WarehouseProducts::where('product_id', $product->id)->sum('quantity');
                if ($warehouseProduct < $cart->quantity) {
                    DB::rollBack();
                    return redirect()->route('cart.index')->with('error', 'Sản phẩm ' . $product->name . ' không đủ số lượng');
                }
            }
            // Tạo đơn hàng
            $order = Order::create([
                'user_id' => auth()->id(),
                'payment_method' => $request->payment_method,
                'first_name' => $request->first_name,
                'last_name' => $request->last_name,
                'address' => $request->city . '/' . $request->district . '/' . $request->ward . '/' . $request->street,
                'phone_number' => $request->phone_number,
                'total_price' => 0 // ban đầu set là 0, sẽ cập nhật sau
            ]);

            $cartItems = Cart::where('user_id', auth()->id())->whereIn('id', $ids)->get();

            foreach ($cartItems as $c) {
                $price = 0;
                $activeFlashSale = FlashSale::active()->where('start_at', '<=', now())->where('end_at', '>=', now())->get();
                $isFlashSaleProduct = false;

                foreach ($activeFlashSale as $flashSale) {
                    $flashSaleProduct = $flashSale->products()->where('product_id', $c->product_id)->first();

                    if ($flashSaleProduct) {
                        $isFlashSaleProduct = true;
                        $oldPrice = $c->product->price;
                        $price = $flashSaleProduct->pivot->price_after_discount;

                        if ($c->quantity > $flashSaleProduct->pivot->quantity) {
                            $totalPrice += $flashSaleProduct->pivot->quantity * $price + ($c->quantity - $flashSaleProduct->pivot->quantity) * $oldPrice;
                            $flashSaleProduct->pivot->decrement('quantity', $flashSaleProduct->pivot->quantity);
                        } else {
                            $totalPrice += $c->quantity * $price;
                            $flashSaleProduct->pivot->decrement('quantity', $c->quantity);
                        }

                        if ($flashSaleProduct->pivot->quantity <= 0) {
                            $flashSale->products()->detach($c->product_id);
                        }
                        break;
                    }
                }

                if (!$isFlashSaleProduct) {
                    $price = $c->product->price;
                    $totalPrice += $c->quantity * $price;
                }
                // Giảm số lượng trong kho
                $warehouse = WarehouseProducts::where('product_id', $c->product_id)->first();
                if ($warehouse) {
                    if ($c->quantity > $warehouse->quantity) {
                        DB::rollBack();
                        return redirect()->back()->withErrors('Đã có lỗi xảy ra, hết hàng trong kho');
                    }
                    $warehouse->decrement('quantity', $c->quantity);
                }

                // Thêm sản phẩm vào đơn hàng
                $order->orderItems()->create([
                    'product_id' => $c->product_id,
                    'quantity' => $c->quantity,
                    'price' => $price,
                ]);

                // Xóa sản phẩm khỏi giỏ hàng
                $c->delete();
            }

            // Cập nhật tổng giá cho đơn hàng
            $order->update(['total_price' => $totalPrice]);

            if ($request->payment_method == 'vnpay') {
                return $this->vnpayPayment($order);
            }

            DB::commit();
            return view('checkout.success', compact('categories', 'order'));
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->route('cart.index')->with('error', 'Đã xảy ra lỗi: ' . $e->getMessage());
        }
    }

    public function vnpayPayment($order)
    {
        date_default_timezone_set('Asia/Ho_Chi_Minh');

        $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
        $vnp_Returnurl = route('payment.vnpay.return'); // Định nghĩa route cho kết quả thanh toán
        $vnp_TmnCode = env('VNPAY_TMNCODE'); // Mã website tại VNPAY
        $vnp_HashSecret = env('VNPAY_HASHSECRET'); // Chuỗi bí mật

        $vnp_TxnRef = $order->id; // Mã đơn hàng
        $vnp_OrderInfo = "Thanh toán đơn hàng " . $order->id;
        $vnp_OrderType = 'billpayment';
        $vnp_Amount = $order->total_price * 100;
        $vnp_Locale = 'vn';
        $vnp_IpAddr = request()->ip();

        $inputData = array(
            "vnp_Version" => "2.1.0",
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_Amount" => $vnp_Amount,
            "vnp_Command" => "pay",
            "vnp_CreateDate" => date('YmdHis'),
            "vnp_CurrCode" => "VND",
            "vnp_IpAddr" => $vnp_IpAddr,
            "vnp_Locale" => $vnp_Locale,
            "vnp_OrderInfo" => $vnp_OrderInfo,
            "vnp_OrderType" => $vnp_OrderType,
            "vnp_ReturnUrl" => 'http://eshopper.test/vnpay/payment-return',
            "vnp_TxnRef" => $vnp_TxnRef,
        );

        ksort($inputData);
        $query = "";
        $i = 0;
        $hashdata = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
            } else {
                $hashdata .= urlencode($key) . "=" . urlencode($value);
                $i = 1;
            }
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }

        $vnp_Url = $vnp_Url . "?" . $query;
        if (isset($vnp_HashSecret)) {
            $vnpSecureHash = hash_hmac('sha512', $hashdata, $vnp_HashSecret);
            $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
        }

        return redirect($vnp_Url);
    }

    public function vnpayReturn(Request $request)
    {
        // Xử lý kết quả thanh toán từ VNPay
        $vnp_ResponseCode = $request->get('vnp_ResponseCode');
        $orderId = $request->get('vnp_TxnRef');

        if ($vnp_ResponseCode == '00') {
            // Thanh toán thành công
            return redirect()->route('cart.index')->with('success', 'Thanh toán thành công đơn hàng ' . $orderId);
        } else {
            // Thanh toán thất bại
            return redirect()->route('cart.index')->with('error', 'Thanh toán thất bại đơn hàng ' . $orderId);
        }
    }
    }

