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
    const host = "https://provinces.open-api.vn/api/";
var callAPI = (api) => {
    return axios.get(api)
        .then((response) => {
            renderData(response.data, "city");
        });
}
callAPI('https://provinces.open-api.vn/api/?depth=1');
var callApiDistrict = (api) => {
    return axios.get(api)
        .then((response) => {
            renderData(response.data.districts, "district");
        });
}
var callApiWard = (api) => {
    return axios.get(api)
        .then((response) => {
            renderData(response.data.wards, "ward");
        });
}

var renderData = (array, select) => {
    let row = ' <option disable value="">Chọn</option>';
    array.forEach(element => {
        row += `<option data-id="${element.code}" value="${element.name}">${element.name}</option>`
    });
    document.querySelector("#" + select).innerHTML = row
}

$("#city").change(() => {
    callApiDistrict(host + "p/" + $("#city").find(':selected').data('id') + "?depth=2");
    printResult();
});
$("#district").change(() => {
    callApiWard(host + "d/" + $("#district").find(':selected').data('id') + "?depth=2");
    printResult();
});
$("#ward").change(() => {
    printResult();
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
    <form action="{{route('checkout.store')}}" method="POST">
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
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="payment" id="directcheck">
                            <label class="custom-control-label" name="payment" for="directcheck">Direct Check</label>
                        </div>
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