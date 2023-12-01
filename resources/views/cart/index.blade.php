@extends('layouts.master')
@section('title')
<title>Cart</title>
@endsection 
@section('content')
    <!-- Topbar Start -->
   
    <!-- Topbar End -->


    <!-- Navbar Start -->
  
    <!-- Navbar End -->


    <!-- Page Header Start -->
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
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle"  id="cart">
                    @if($carts!=null)
                        @foreach($carts as $item)
                        <tr data-id="{{$item['id']}}" >
                            <td class="align-middle"><img src="{{config('app.base_url').$item->product['feature_image_path']}}" alt="" style="width: 50px;"> {{$item->product->name}}</td>
                            <td class="align-middle">{{number_format($item->product->price)}}</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn minus" >
                                        <button class="btn btn-sm btn-primary btn-minus quantity" >
                                        <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text" class="form-control form-control-sm bg-secondary text-center update-cart"  value="{{$item->quantity}}">
                                    
                                    <div class="input-group-btn plus1" >
                                        <button class="btn btn-sm btn-primary btn-plus " >
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle">{{number_format($item->quantity*$item->product->price)}}</td>
                            <td class="align-middle"><button class="btn btn-sm btn-primary remove-from-cart"><i class="fa fa-times"></i></button></td>
                        </tr>
                       @endforeach
                    @endif
                    </tbody>
                </table>
                <div class="d-flex justify-content-between mt-2">

                </div>
         
            </div>
            <div class="col-lg-4">
               
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium ">Subtotal</h6>
                            <h6 class="font-weight-medium subtotal">$150</h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Shipping</h6>
                            <h6 class="font-weight-medium">Free</h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold total"></h5>
                            <h5 class="font-weight-bold totalPrice"></h5>
                        </div>
                        <button class="btn btn-block btn-primary my-3 py-3">Proceed To Checkout</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart End -->


    <!-- Footer Start -->
 
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
   let subtotal = 0;
$("tr").each(function() {
    if($(this).children().eq(3).text()!="Total") {
        let value = $(this).children().eq(3).text().replaceAll(',','');
        value = parseFloat(value);
        if (!isNaN(value)) {
            subtotal += value;
        }
    }
});
$(".total").text("Total ("+parseInt(document.querySelectorAll('tr').length-1)+" items):");
$(".subtotal").text(subtotal.toLocaleString('it-IT', {style : 'currency', currency : 'VND'}).replaceAll('.',','));
$(".totalPrice").text(subtotal.toLocaleString('it-IT', {style : 'currency', currency : 'VND'}).replaceAll('.',','));    


        $(".plus1, .minus").click(function (e) {
    e.preventDefault();
    var ele=$(this);

    if ($(this).hasClass('plus1')) {
       quantity= $(this).parents("tr").find(".update-cart").val();
       
        
    }  if ($(this).hasClass('minus')) {
      quantity=  $(this).parents("tr").find(".update-cart").val();
       
    }

    $.ajax({
        url: '{{ route('cart.update') }}',
        method: "patch",
        data: {
            _token: '{{ csrf_token() }}', 
            id: ele.parents("tr").attr("data-id"), 
            quantity: quantity
        },
        success: function (response) {
            window.location.reload();
        }
    });
});
         $(".update-cart").change(function (e) {
        e.preventDefault();
  
        var ele = $(this);
  
        $.ajax({
            url: '{{ route('cart.update') }}',
            method: "patch",
            data: {
                _token: '{{ csrf_token() }}', 
                id: ele.parents("tr").attr("data-id"), 
                quantity: ele.val()
            },
            success: function (response) {
               window.location.reload();
            }
        });
    });
       $(".remove-from-cart").click(function (e) {
        e.preventDefault();
  
        var ele = $(this);
  
        if(confirm("Are you sure want to remove?")) {
            $.ajax({
                url: '{{ route('cart.remove') }}',
                method: "DELETE",
                data: {
                    _token: '{{ csrf_token() }}', 
                    id: ele.parents("tr").attr("data-id")
                },
                success: function (response) {
                    ele.parents("tr").remove();
                    window.location.reload();
                }
            });
        }
    });
    </script>

@endsection
