@extends('layouts.master')
@section('title')
<title>Shop page</title>
@endsection
@section('css')
<script src="https://cdn.tailwindcss.com"></script>
@endsection
@section('content')
@section('products')
@include('products.mainproducts')
@endsection
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Shop</p>
        </div>
    </div>
</div>
<!-- Page Header End -->
<!-- Shop Start -->

@include('products.products')
              


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <script>
   $('.add-to-cart-btn').click(function(e) {
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
@endsection