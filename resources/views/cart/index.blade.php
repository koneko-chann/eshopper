@extends('layouts.master')
@section('title')
<title>Cart</title>
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
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Check all<input type="checkbox" name="chekall"></th>
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
                       <!-- Phần HTML của bạn không thay đổi nhiều -->
<tr data-id="{{$item['id']}}">
    <td class="align-middle"><input type="checkbox" name="checkedtobuy"></td>
    <td class="align-middle"><img src="{{config('app.base_url').$item->product['feature_image_path']}}" alt="" style="width: 50px;"><a href="{{route('detail.index',['id'=>$item->product->id])}}" style="color:black">{{$item->product->name}}</a></td>
    <td class="align-middle">{{number_format($item->product->new_price??$item->product->price)}}</td>
    <td class="align-middle">
        <div class="input-group quantity mx-auto" style="width: 100px;">
            <div class="input-group-btn minus">
                <button class="btn btn-sm btn-primary btn-minus quantity">
                    <i class="fa fa-minus"></i>
                </button>
            </div>
            <input type="text" class="form-control form-control-sm bg-secondary text-center update-cart" value="{{$item->quantity}}">
            <div class="input-group-btn plus1">
                <button class="btn btn-sm btn-primary btn-plus">
                    <i class="fa fa-plus"></i>
                </button>
            </div>
        </div>
        <div class="error-message text-danger" style="display:none;"></div>
    </td>
    @php
    $quantity = $item->quantity;
    $new_price = $item->product->new_price ?? $item->product->price;
    $price = $item->product->price;
    $quantity_remain_discount = $item->product->quantity_remain_discount;

    if ($quantity > $quantity_remain_discount) {
        $total_price = $quantity_remain_discount * $new_price + $price * ($quantity - $quantity_remain_discount);
    } else {
        $total_price = $quantity * $new_price;
    }
@endphp
    <td class="align-middle">{{ number_format($total_price) }}</td>
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
                            <h6 class="font-weight-medium subtotal"></h6>
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
                       <button class="btn btn-block btn-primary my-3 py-3 checkout-btn" >Proceed To Checkout</button>
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
$(document).ready(function() {
    var carts = Array.from({ length: {{$carts->count()}} }, () => true);
    function reCalculate() {
        var total = 0;
        $("tr").each(function() {
            var checkbox = $(this).find('input[name="checkedtobuy"]');
            if (checkbox.is(":checked")) {
                var value = $(this).children().eq(4).text().replaceAll(',', '');
                value = parseFloat(value);
                if (!isNaN(value)) {
                    total += value;
                }
            }
        });
        $(".totalPrice").text(total.toLocaleString('it-IT', {style : 'currency', currency : 'VND'}).replaceAll('.', ','));
        $(".subtotal").text(total.toLocaleString('it-IT', {style : 'currency', currency : 'VND'}).replaceAll('.', ','));
        $(".total").text("Total (" + $('input[name="checkedtobuy"]:checked').length + " items):");
    }

    $('input[name="chekall"]').click(function() {
        if($(this).is(":checked")) {
            $('input[name="checkedtobuy"]').prop('checked', true);
        } else {
            $('input[name="checkedtobuy"]').prop('checked', false);
        }
        reCalculate();
    });

    $('input[name="checkedtobuy"]').change(function() {
        reCalculate();
    });

    $('.checkout-btn').click(function() {
        var ids = [];
        $('input[type="checkbox"]:checked').each(function() {
            var id = $(this).parents("tr").attr("data-id");
            if(id){
                ids.push(id);
            }
        });
        window.location.href = "{{route('checkout.index', ['ids'=> ''])}}" + ids.join(',');
    });

    let subtotal = 0;
    $("tr").each(function() {
        if($(this).children().eq(3).text() != "Total") {
            let value = $(this).children().eq(3).text().replaceAll(',','');
            value = parseFloat(value);
            if (!isNaN(value)) {
                subtotal += value;
            }
        }
    });
    $(".total").text("Total (0 items):");
    $(".subtotal").text(subtotal.toLocaleString('it-IT', {style : 'currency', currency : 'VND'}).replaceAll('.',','));
    $(".totalPrice").text(subtotal.toLocaleString('it-IT', {style : 'currency', currency : 'VND'}).replaceAll('.',','));

    $(".plus1, .minus").click(async function (e) {
        e.preventDefault();
        var ele = $(this);
        var quantity = ele.parents("tr").find(".update-cart").val();

        if (ele.hasClass('plus1')) {
            quantity++;
        } else if (ele.hasClass('minus')) {
            quantity--;
        }
        await $.ajax({
            url: '{{ route('cart.update') }}',
            method: "patch",
            data: {
                _token: '{{ csrf_token() }}', 
                id: ele.parents("tr").attr("data-id"), 
                quantity: quantity
            },
            success: function (response) {
                if (response.error) {
                    var errorMessage = ele.parents("tr").find(".error-message");
                    errorMessage.text('Số lượng vượt quá giới hạn: ' + response.max_quantity).show();
                    carts[ele.parents("tr").index()] = false;
                    console.log(carts);
                    if(carts.includes(false)){
                        $('.checkout-btn').attr('disabled', true);
                    } else {
                        $('.checkout-btn').attr('disabled', false);
                    }
                } else {
                    reCalculate();
                    ele.parents("tr").find(".error-message").hide();
                    carts[ele.parents("tr").index()] = true;
                    if(carts.includes(false)){
                        $('.checkout-btn').attr('disabled', true);
                    } else {
                        $('.checkout-btn').attr('disabled', false);
                    }

                }
            }
        });
    });

    $(".update-cart").change(async function (e) {
        e.preventDefault();
        var ele = $(this);
        var quantity = ele.val();
       
        await $.ajax({
            url: '{{ route('cart.update') }}',
            method: "patch",
            data: {
                _token: '{{ csrf_token() }}', 
                id: ele.parents("tr").attr("data-id"), 
                quantity: quantity
            },
            success: function (response) {
                if (response.error) {
                    var errorMessage = ele.parents("tr").find(".error-message");
                    errorMessage.text('Số lượng vượt quá giới hạn: ' + response.max_quantity).show();
                    
                    cart[ele.parents("tr").index()] = false;
                    if(cart.includes(false)){
                        $('.checkout-btn').attr('disabled', true);
                    } else {
                        $('.checkout-btn').attr('disabled', false);
                    }
                } else {
                    reCalculate();
                    ele.parents("tr").find(".error-message").hide();
                    cart[ele.parents("tr").index()] = true;
                    
                    if(cart.includes(false)){
                        $('.checkout-btn').attr('disabled', true);
                    } else {
                        $('.checkout-btn').attr('disabled', false);
                    }
                }
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
                    reCalculate();
                }
            });
        }
    });
});

    </script>

@endsection
