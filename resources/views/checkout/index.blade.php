@extends('layouts.master')
@section('title')
<title>Checkout page</title>
@endsection
@section('css')
<style>

</style>
@endsection
@section('js')
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    <script>
    const host = "https://vapi.vnappmob.com/api/province";
    var callAPI = (api) => {
    return axios.get(api)
        .then((response) => {
       let  data=renderData(response.data.results, "city");
       console.log(response);
        });
}
callAPI(host);
var callApiDistrict = (api) => {
    return axios.get(api)
        .then((response) => {
            renderDistrictData(response.data.results, "district");
        });
}
var callApiWard = (api) => {
    return axios.get(api)
        .then((response) => {
            renderWarddata(response.data.results, "ward");
        });
}

var renderData = (array, select) => {
    let row = ' <option disable value="">Chọn</option>';
    array.forEach(element => {
        row += `<option data-id="${element.province_id}" value="${element.province_name}">${element.province_name}</option>`
    });
    document.querySelector("#" + select).innerHTML = row
}
var renderDistrictData=(array,select)=>{
    let row = ' <option disable value="">Chọn</option>';
    array.forEach(element => {
        row += `<option data-id="${element.district_id}" value="${element.district_name}">${element.district_name}</option>`
    });
    document.querySelector("#" + select).innerHTML = row
}
var renderWarddata=(array,select)=>{
    let row = ' <option disable value="">Chọn</option>';
    array.forEach(element => {
        row += `<option data-id="${element.ward_id}" value="${element.ward_name}">${element.ward_name}</option>`
    });
    document.querySelector("#" + select).innerHTML = row
}
$("#city").change(() => {
    callApiDistrict(host + "/district/" + $("#city").find(':selected').data('id'));
    
});
$("#district").change(() => {
    callApiWard(host + "/ward/" + $("#district").find(':selected').data('id'));
    printResult();
});
$("#ward").change(() => {
    
})
var printResult = () => {
    if ($("#district").find(':selected').data('id') != "" && $("#city").find(':selected').data('id') != "" &&
        $("#ward").find(':selected').data('id') != "") {
        let result = $("#city option:selected").text() +
            " | " + $("#district option:selected").text() + " | " +
            $("#ward option:selected").text();
        $("#result").text(result)
    }

}
$(document).ready(function() {
    let total = 0;
    $('.price').each(function() {
        total += parseFloat($(this).text());
    });
    $('.subtotal').text(total.toFixed(2));
    $('.total').text(total.toFixed(2));
    $('.total').val(total.toFixed(2));
});
$(document).ready(function() {
    $('form').on('submit', function(e) {
        if ($('#city').val() === '' || $('#district').val() === '' || $('#ward').val() === '') {
            e.preventDefault();
            alert('Please choose city, district and ward');
        }
    });
});
	</script>
@endsection
@section('content')
 <!-- Page Header Start -->
 <div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Checkout</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Checkout</p>
        </div>
    </div>
</div>
<!-- Page Header End -->


<!-- Checkout Start -->
<div class="container-fluid pt-5">
    <form action="{{route('checkout.store',['ids'=>request()->query('ids')])}}" method="POST">
    @csrf
    <div class="row px-xl-5">
        <div class="col-lg-8">
            <div class="mb-4">
                <h4 class="font-weight-semi-bold mb-4">Billing Address</h4>
                
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label>First Name</label>
                        <input class="form-control" name="first_name" type="text" placeholder="John" required>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Last Name</label>
                        <input class="form-control" name="last_name"  type="text" placeholder="Doe" required>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>E-mail</label>
                        <input class="form-control" name="email"type="text" placeholder="example@email.com" required>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Mobile No</label>
                        <input class="form-control" name="phone_number"type="text" placeholder="+123 456 789" required>
                    </div>
                    
                    <div class="col-md-6 form-group">
                        <label>City</label>
                        <select id="city" name="city"class="custom-select dropdown" required>
                            <option selected value="">Choose city</option>
                        </select>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>District</label>
                        <select id="district" name="district" class="custom-select dropdown" required>
                            <option selected value="">Choose district</option>
                        </select>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Ward</label>
                        <select id="ward" name="ward" class="custom-select dropdown" required>
                            <option selected value="">Choose ward</option>
                        </select>
                    </div>
                   
                    <div class="col-md-6 form-group">
                        <label>Street</label>
                        <input class="form-control" name="street" type="text" placeholder="Street">
                    </div>
                </div>
            </div>
           
        </div>
        <div class="col-lg-4">
            <div class="card border-secondary mb-5">
                <div class="card-header bg-secondary border-0">
                    <h4 class="font-weight-semi-bold m-0">Order Total</h4>
                </div>
                <div class="card-body">
                    <h5 class="font-weight-medium mb-3">Products</h5>
                    @foreach($cart as $item)
                    <div class="d-flex justify-content-between">
                        <p>{!!$item['quantity'].'x '.'<strong>'.$item->product['name']!!}</strong></p>
                        <p class="price">{{$item->product['price']}}</p>

                    </div>
                   @endforeach
                    <hr class="mt-0">
                    <div class="d-flex justify-content-between mb-3 pt-1">
                        <h6 class="font-weight-medium">Subtotal</h6>
                        <h6 class="font-weight-medium subtotal"></h6>
                    </div>
                    <div class="d-flex justify-content-between">
                        <h6 class="font-weight-medium">Shipping</h6>
                        <h6 class="font-weight-medium">Free</h6>
                    </div>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <div class="d-flex justify-content-between mt-2">
                        <h5 class="font-weight-bold">Total</h5>
                        <h5 class="font-weight-bold total" name="total" value=""></h5>
                    </div>
                </div>
            </div>
            <div class="card border-secondary mb-5">
                <div class="card-header bg-secondary border-0">
                    <h4 class="font-weight-semi-bold m-0">Payment</h4>
                </div>
                <div class="card-body">
                        <div class="form-group">
                            <label for="payment_method">Phương thức thanh toán:</label>
                            <select class="form-control" id="payment_method" name="payment_method" required>
                                <option value="cash">Thanh toán khi nhận hàng</option>
                                <option value="vnpay">VNPay</option>
                            </select>
                        </div>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <input type="submit" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3" value="Place Order" />
                </div>
            </div>
        </div>
    </div>
</form>

</div>
<!-- Checkout End -->

@endsection