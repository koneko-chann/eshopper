@extends('layouts.master')
@section('title')
<title>Orders</title>
@endsection
@section('content')
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Shopping Cart</p>
        </div>
    </div>
</div>
<!-- Page Header End -->


<!-- Cart Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <div class="col-lg-10 table-responsive mb-7">
            <table class="table table-bordered text-center mb-0">
                <thead class="bg-secondary text-dark">
                    <tr>
                        <th>Products</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Customer's name</th>
                        <th>Phone</th>
                        <th>Shipping address</th>
                        <th>Payment Method</th>
                        <th>Status</th>
                        <th>Created at</th>
                    </tr>
                </thead>
                <tbody class="align-middle"  id="cart">
                @if($orders!=null)
                @foreach($orders as $order)
                @foreach($order->orderItems as $item)
                    <tr style="color: black">
                        <td class="align-middle"><img src="{{config('app.base_url').$item->product['feature_image_path']}}" alt="" style="width: 50px;">{{$item->product['name']}}</td>
                        <td class="align-middle">{{number_format($item['price'])}}</td>
                        <td class="align-middle">{{$item['quantity']}}</td>
                        <td class="align-middle">{{number_format($order['total_price'])}}</td>
                        <td class="align-middle">{{$order['first_name'].' '.$order['last_name']}}</td>
                        <td class="align-middle">{{$order['phone_number']}}</td>
                        <td class="align-middle">{{$order['address']}}</td>
                        <td class="align-middle">{{$order['payment_method']}}</td>
                        <td class="align-middle">{{$order['status']==0?'Failed':($order['status']==1?'Pending':($order['status']==3?'Processing':'Done'))}}</td>
                        <td class="align-middle">{{$order['created_at']}}</td>
                    </tr>
                 @endforeach
                    @endforeach
                    @endif  
               
                </tbody>
            </table>
         
        </div>
    </div>
</div>
<!-- Cart End -->


<!-- Footer Start -->

<!-- Footer End -->


<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


@endsection