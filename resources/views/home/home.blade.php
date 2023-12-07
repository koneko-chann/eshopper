<?php
global $base_url;
$base_url = "http://localhost/test/public";
?>
@extends('layouts.master')
@section('title')
<title>Home page</title>
@endsection

@section('content')
@section('collapse')
collapse
@endsection


<!-- Navbar Start -->

<!-- Navbar End -->
@section('slider')
@include('components.slider')
@endsection


<!-- Featured Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5 pb-3">
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
            </div>
        </div>
    </div>
</div>
<!-- Featured End -->




<div class="container-fluid pt-5">
    <div class="row px-xl-5 pb-3">
        @foreach($categoriesLimit as $category)
        <div class="col-lg-4 col-md-6 pb-1">
            <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                <p class="text-right">{!! count($category->products) !!} Products</p>
                <a href="{{route('shop.category',['id'=>$category['id']])}}" class="cat-img position-relative overflow-hidden mb-3">
                    <img class="img-fluid" src="eshopper/img/cat-1.jpg" alt="">
                </a>
                <h5 class="font-weight-semi-bold m-0">{{$category['name']}}</h5>
            </div>
        </div>
        @endforeach
    </div>
</div>
<!-- Offer Start -->
<div class="container-fluid offer pt-5">
    <div class="row px-xl-5">
        <div class="col-md-6 pb-4">
            <div class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
                <img src="eshopper/img/offer-1.png" alt="">
                <div class="position-relative" style="z-index: 1;">
                    <h5 class="text-uppercase text-primary mb-3">20% off the all order</h5>
                    <h1 class="mb-4 font-weight-semi-bold">Spring Collection</h1>
                    <a href="" class="btn btn-outline-primary py-md-2 px-md-3">Shop Now</a>
                </div>
            </div>
        </div>
        <div class="col-md-6 pb-4">
            <div class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
                <img src="eshopper/img/offer-2.png" alt="">
                <div class="position-relative" style="z-index: 1;">
                    <h5 class="text-uppercase text-primary mb-3">20% off the all order</h5>
                    <h1 class="mb-4 font-weight-semi-bold">Winter Collection</h1>
                    <a href="" class="btn btn-outline-primary py-md-2 px-md-3">Shop Now</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Offer End -->


<!-- Products Start -->
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">Trandy Products</span></h2>
    </div>
    <div class="row px-xl-5 pb-3">
        @foreach($products as $product)
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="card product-item border-0 mb-4">
                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                    <img class="img-fluid w-100" src="{{$base_url.$product->feature_image_path}}" alt="">
                </div>
                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                    <h6 class="text-truncate mb-3">{{$product['name']}}</h6>
                    <div class="d-flex justify-content-center">
                        <h6>{{number_format($product['price'])}} VNĐ</h6>
                        <h6 class="text-muted ml-2"><del>{{number_format($product['price'])}} VNĐ</del></h6>
                    </div>
                </div>
                <div class="card-footer d-flex justify-content-between bg-light border">
                    <a href="{{route('detail.index',['id'=>$product['id']])}}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View
                        Detail</a>
                    <span data-url="{{ route('cart.add', ['id' => $product['id']]) }}" class="btn btn-sm text-dark p-0 add-to-cart-btn" ><i
                            class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</span>
                </div>
            </div>
        </div>
        @endforeach
    </div>
</div>
<!-- Products End -->


<!-- Subscribe Start -->
<div class="container-fluid bg-secondary my-5">
    <div class="row justify-content-md-center py-5 px-xl-5">
        <div class="col-md-6 col-12 py-5">
            <div class="text-center mb-2 pb-2">
                <h2 class="section-title px-5 mb-3"><span class="bg-secondary px-2">Stay Updated</span></h2>
                <p>Amet lorem at rebum amet dolores. Elitr lorem dolor sed amet diam labore at justo ipsum eirmod duo
                    labore labore.</p>
            </div>
            <form action="">
                <div class="input-group">
                    <input type="text" class="form-control border-white p-4" placeholder="Email Goes Here">
                    <div class="input-group-append">
                        <button class="btn btn-primary px-4">Subscribe</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Subscribe End -->


<!-- Products Start -->
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">Just Arrived</span></h2>
    </div>
    <div class="row px-xl-5 pb-3">
        @foreach($recommendProducts as $product)
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="card product-item border-0 mb-4">
                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                    <img class="img-fluid w-100" src="{{$base_url.$product['feature_image_path']}}" alt="">
                </div>
                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                    <h6 class="text-truncate mb-3">{{$product['name']}}</h6>
                    <div class="d-flex justify-content-center">
                        <h6>{{number_format($product['price'])}} VNĐ</h6>
                        <h6 class="text-muted ml-2"><del>{{number_format($product['price'])}} VNĐ</del></h6>
                    </div>
                </div>
                <div class="card-footer d-flex justify-content-between bg-light border">
                    <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View
                        Detail</a>
                    <span data-url="{{ route('cart.add', ['id' => $product['id']]) }}" class="btn btn-sm text-dark p-0"><i
                            class="fas fa-shopping-cart text-primary mr-1 add-to-cart-btn"></i>Add To Cart</span>
                </div>
            </div>
        </div>
        @endforeach
    </div>
</div>
<!-- Products End -->



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <script>
   $('.add-to-cart-btn').click(function(e) {
    if({{ json_encode(Auth::check()) }} == false){
        Swal.fire({
            position: "top-end",
            icon: "error",
            width: 300,
            height: 50,
            title: "Please login to add to cart",
            showConfirmButton: false,
            timer: 1500
        });
            return;
    }
    e.preventDefault();

    let quantity = 1;
    let url = $(this).data('url') + '?quantity=' + quantity;

    $.ajax({
        url: url,
        type: 'GET',
        success: function(data) {
            Swal.fire({
                position: "top-end",
                icon: "success",
                width: 300,
                height: 50,
                title: "Added to cart",
                showConfirmButton: false,
                timer: 1500
            });
        },
        error: function(error) {
            console.error('Error:', error);
        }
    });
});
</script>
<!-- JavaScript Libraries -->
@endsection
