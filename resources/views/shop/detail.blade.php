@extends('layouts.master')  
@section('title')
<title>Detail</title>
@endsection
@section('css')
<style>
    .user-rate {
        justify-content: center;
        align-items: center;
        margin-left: 50%;
        margin-bottom: 5px;
        padding-bottom: 10px;
    }
    .heading {
  font-size: 25px;
  margin-right: 25px;
}

.fa {
  font-size: 25px;
}

.fa1{
    color: orange;
}
.checked {
  color: orange;
}

/* Three column layout */
.side {
  float: left;
  width: 15%;
  margin-top: 10px;
}

.middle {
  float: left;
  width: 70%;
  margin-top: 10px;
}

/* Place text to the right */
.right {
  text-align: right;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* The bar container */
.bar-container {
  width: 100%;
  background-color: #f1f1f1;
  text-align: center;
  color: white;
}

/* Individual bars */
.bar-5 { height: 18px; background-color: #04AA6D;}
.bar-4 { height: 18px; background-color: #2196F3;}
.bar-3 {height: 18px; background-color: #00bcd4;}
.bar-2 { height: 18px; background-color: #ff9800;}
.bar-1 {height: 18px; background-color: #f44336;}

/* Responsive layout - make the columns stack on top of each other instead of next to each other */
@media (max-width: 400px) {
  .side, .middle {
    width: 100%;
  }
  /* Hide the right column on small screens */
  .right {
    display: none;
  }
}
</style>
@endsection
@section('js')
<script>

</script>
@endsection
@section('content')
@php
$rate = 0;
$count = 0;
foreach($comments as $comment) {
    $rate += $comment->rate;
    $count++;
}
if ($count > 0) {
    $rate = $rate / $count;
}
$rateCounts = array_fill(1, 5, 0);
foreach($comments as $comment) {
    if ($comment->rate >= 1 && $comment->rate <= 5) {
        $rateCounts[$comment->rate]++;
    }
}
@endphp
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Shop Detail</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Shop Detail</p>
        </div>
    </div>
</div>
<div class="container-fluid py-5">
    <div class="row px-xl-5">
        <div class="col-lg-5 pb-5">
            <div id="product-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner border">
                    @foreach($product->productImages as $key=>  $productImage)
                    <div class="carousel-item {{$key==0?'active':''}}">
                        <img class="w-100 h-100" src="{{config('app.base_url').$productImage->image_path}}" alt="Image">
                    </div>
                    @endforeach
                  
                </div>
                <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                    <i class="fa fa-2x fa-angle-left text-dark"></i>
                </a>
                <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                    <i class="fa fa-2x fa-angle-right text-dark"></i>
                </a>
            </div>
        </div>

        <div class="col-lg-7 pb-5">
            <h3 class="font-weight-semi-bold">{!!$product['name']!!}</h3>
            <div class="d-flex mb-3">
                <div class="text-primary mr-2">
                    @for($i=1;$i<=5;$i++)
                    @if($i <= (int)$rate)
                    <i class="fas fa-star"></i>
                @elseif($i - $rate > 0 && $i - $rate < 1)
                    <i class="fas fa-star-half-alt"></i>
                @else
                    <i class="far fa-star"></i>
                @endif
                    
                    @endfor
                </div>
            </div>
            <h3 class="font-weight-semi-bold mb-4">{!!number_format($product['price'])!!} đ</h3>
            <p class="mb-4">{!!$product['description']!!}</p>
            <div class="d-flex mb-3">
            
            </div>
            <div class="d-flex mb-4">
              
            </div>
            <div class="d-flex align-items-center mb-4 pt-2">
                <div  class="input-group  mr-3" style="width: 130px;">
                    <div class="input-group-btn quantity">
                        <button class="btn btn-primary btn-minus" >
                        <i class="fa fa-minus"></i>
                        </button>
                    </div>
                    <input id="quantity1" type="text" class="form-control bg-secondary text-center" name="" value="1">
                    <div class="input-group-btn quantity">
                        <button class="btn btn-primary btn-plus">
                            <i class="fa fa-plus"></i>
                        </button>
                    </div>
                </div>
                <button id="add" data-url="{{ route('cart.add', ['id' => $product['id']]) }}" class="btn btn-primary px-3 "><i class="fa fa-shopping-cart mr-1"></i>Add to cart</button>
            </div>
            <div class="d-flex pt-2">
                <p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
                <div class="d-inline-flex">
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-pinterest"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="row px-xl-5">
        <div class="col">
            <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Description</a>
                <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Information</a>
                <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews (0)</a>
            </div>
            <div class="tab-content">
                <div class="tab-pane fade show active" id="tab-pane-1">
                    <h4 class="mb-3">Product Description</h4>
                   {!!$product['content']!!}
                </div>
                <div class="tab-pane fade" id="tab-pane-2">
                    <h4 class="mb-3">Additional Information</h4>
                    <div class="row">
                   {!!$product['content']!!}
                       
                    </div>
                </div>
                <div class="tab-pane fade" id="tab-pane-3">
                    <div class="row">
                        <div class="col-md-6">
                            <h4 class="mb-4">{{count($comments)}} review for "{{$product['name']}}"</h4>
                            <div class="user-rate">
                                <span class="heading">User Rating</span>
                              
                               @for($i=1;$i<=5;$i++)
                                    <span class="fa fa-star{{($i-$rate>0 && $i - $rate < 1)?'-half-alt fa1':''}} {{$rate>=$i?'checked':''}} "></span>
                                @endfor
                                <p>{{$rate}} average based on {{count($comments)}} reviews.</p>
                                <hr style="border:3px solid #f1f1f1">

                                <div class="row">
                                    @for($i = 5; $i >= 1; $i--)
                                        <div class="side">
                                            <div>{{ $i}} <i class="fas fa-star ml-2"></i></div>
                                        </div>
                                        <div class="middle">
                                            <div class="bar-container">
                                                <div class="bar-{{ $i }}" style="width:{{$count>0?$rateCounts[$i]/$count*100:0}}%"></div>
                                            </div>
                                        </div>
                                        <div class="side right">
                                            <div>{{ $rateCounts[$i]<=1?$rateCounts[$i].' rate':$rateCounts[$i].' rates' }}</div>
                                        </div>
                                    @endfor
                                </div>
                            </div>
                            @if($comments)
                            @foreach($comments as $comment )
                      
                            <div class="media mb-4">
                                <div class="media-body">
                                    <h6>{{$comment->name}}<small> - <i>{{ \Carbon\Carbon::parse($comment->comment_time)->format('d-m-Y') }}</i></small></h6>                                    <div class="text-primary mb-2">
                                        @for($i=1;$i<=$comment->rate;$i++)
                                            <i class="fas fa-star"></i>
                                        @endfor
                                    </div>
                                    <p>{{$comment->comment}}</p>
                                </div>
                            </div>
                          @endforeach
                          @endif
                        </div>
                    
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Shop Detail End -->


<!-- Products Start -->
<div class="container-fluid py-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
    </div>
    <div class="row px-xl-5">
        <div class="col">
            <div class="owl-carousel related-carousel">
                <div class="card product-item border-0">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="{{config('app.base_url').$products[rand(1,count($products)-1)]['feature_image_path']}}" alt="">
                    </div> 
                     <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">{{$products[rand(1,count($products)-1)]['name']}}</h6>
                        <div class="d-flex justify-content-center">
                            <h6>{{number_format($products[rand(1,count($products)-1)]['price'])}}</h6><h6 class="text-muted ml-2"><del>{{number_format($products[rand(1,count($products)-1)]['price'])}}</del></h6>
                        </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
                @foreach($products as $product)
                <div class="card product-item border-0">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="{{config('app.base_url').$product['feature_image_path']}}" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">{{$product['name']}}</h6>
                        <div class="d-flex justify-content-center">
                            <h6>{{number_format($product['price'])}}</h6><h6 class="text-muted ml-2"><del>{{number_format($product['price'])}}</del></h6>
                        </div>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
             @endforeach
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
  
       
  document.getElementById('add').addEventListener('click', function(e) {
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

    let quantity = document.getElementById('quantity1').value;
    let url = this.getAttribute('data-url') + '?quantity=' + quantity;

    fetch(url, {
        method: 'GET',
    })
    .then(response => response.json())
    .then(data => {
        Swal.fire({
  position: "top-end",
  icon: "success",
  width:300,
  height:50,
  title: "Added to cart",
  showConfirmButton: false,
  timer: 1500
});
    })
    .catch((error) => {
      console.error('Error:', error);
    });
});
</script>
@endsection

