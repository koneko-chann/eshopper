<?php
function randomFloat($min = 0, $max = 1) {
    return $min + mt_rand() / mt_getrandmax() * ($max - $min);
}

$randomFloat = randomFloat(1.1, 1.5);
?>
@extends('layouts.master')
@section('title')
<title>Shop page</title>
@endsection
@section('css')

@endsection
@section('content')

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

<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <!-- Shop Sidebar Start -->
        <div class="col-lg-3 col-md-12">
            <!-- Price Start -->
            <div class="border-bottom mb-4 pb-4">
                <h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
                <form id="price-filter-form">
                    <input type="hidden" id="min-price" name="min_price">
    <input type="hidden" id="max-price" name="max_price">
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-all" {{ request()->has('min_price') && request()->filled('min_price') ? '' : 'checked' }}>
                        <label class="custom-control-label" for="price-all">All price</label>
                        <span class="badge border font-weight-normal">1000</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-1">
                        <label class="custom-control-label" for="price-1">$0 - $500000</label>
                        <span class="badge border font-weight-normal">150</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-2">
                        <label class="custom-control-label" for="price-2">$100 - $200</label>
                        <span class="badge border font-weight-normal">295</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-3">
                        <label class="custom-control-label" for="price-3">$200 - $300</label>
                        <span class="badge border font-weight-normal">246</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-4">
                        <label class="custom-control-label" for="price-4">$300 - $400</label>
                        <span class="badge border font-weight-normal">145</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="checkbox" class="custom-control-input" id="price-5">
                        <label class="custom-control-label" for="price-5">$400 - $500</label>
                        <span class="badge border font-weight-normal">168</span>
                    </div>
                </form>
            </div>
            <!-- Price End -->
            
          
        </div>
        <!-- Shop Sidebar End -->


        <!-- Shop Product Start -->
        <div class="col-lg-9 col-md-12">
            <div class="row pb-3">
                <div class="col-12 pb-1">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <form action="">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search by name">
                                <div class="input-group-append">
                                    <span class="input-group-text bg-transparent text-primary">
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                            </div>
                        </form>
                        <div class="dropdown ml-4">
                            <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Sort by
                                    </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                <a class="dropdown-item" href="#">Latest</a>
                                <a class="dropdown-item" href="#">Popularity</a>
                                <a class="dropdown-item" href="#">Best Rating</a>
                            </div>
                        </div>
                    </div>
                </div>
                @foreach($products as $product)
                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                    <div class="card product-item border-0 mb-4">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" style="height:15rem"src="{{config('app.base_url').$product['feature_image_path']}}" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">{{$product['name']}}</h6>
                            <div class="d-flex justify-content-center">
                                <h6>{{number_format($product['price'])}}</h6><h6 class="text-muted ml-2"><del>{{number_format($product['price']*randomFloat(1.1,1.5))}}</del></h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="{{route('detail.index',['id'=>$product['id']])}}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                            <span data-url="{{ route('cart.add', ['id' => $product['id']]) }}" class="btn btn-sm text-dark p-0 add-to-cart-btn"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</span>
                        </div>
                    </div>
                </div>
                @endforeach
                <div class="col-12 pb-1">
                    {{ $products->links() }}
                </div>
                {{-- <div class="col-12 pb-1">
                    <nav aria-label="Page navigation">
                      <ul class="pagination justify-content-center mb-3">
                        <li class="page-item disabled">
                          <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">«</span>
                            <span class="sr-only">Previous</span>
                          </a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                          <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">»</span>
                            <span class="sr-only">Next</span>
                          </a>
                        </li>
                      </ul>
                    </nav>
                </div> --}}
              
               
            </div>
            <!-- Shop Product End -->
            </div>
            </div>

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
$('input[type="checkbox"]').on('change', function() {
    // Uncheck all other checkboxes
    $('input[type="checkbox"]').not(this).prop('checked', false);

    // Get the selected price range
    try{

    
    var priceRange = $(this).next('label').text().split(' - ');
    var minPrice = priceRange[0].replace('$', '');
    var maxPrice = priceRange[1].replace('$', '');

    // Update the hidden fields
    $('#min-price').val(minPrice);
    $('#max-price').val(maxPrice);
    $('#price-filter-form').submit();

}
catch(err){
  
    $('#price-filter-form').submit();
}
    // Submit the form


    // Submit the form
});
window.onload = function() {

    var urlParams = new URLSearchParams(window.location.search);
    var minPrice = urlParams.get('min_price');
    var maxPrice = urlParams.get('max_price');

    if (minPrice == 0 && maxPrice == 500000) {
        document.getElementById('price-1').checked = true;
    } else if (minPrice == 100 && maxPrice == 200) {
        document.getElementById('price-2').checked = true;
    } else if (minPrice == 200 && maxPrice == 300) {
        document.getElementById('price-3').checked = true;
    } else if (minPrice == 300 && maxPrice == 400) {
        document.getElementById('price-4').checked = true;
    } else if (minPrice == 400 && maxPrice == 500) {
        document.getElementById('price-5').checked = true;
    }
}

</script>


@endsection