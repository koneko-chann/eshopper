@extends('layouts.master')
@section('title')
<title>Profile</title>
@endsection
@section('css')
<style>
.container{
    margin-top: 100px;

}
.account-settings .user-profile {
    margin: 0 0 1rem 0;
    padding-bottom: 1rem;
    text-align: center;
}
.account-settings .user-profile .user-avatar {
    margin: 0 0 1rem 0;
}
.account-settings .user-profile .user-avatar img {
    width: 90px;
    height: 90px;
    -webkit-border-radius: 100px;
    -moz-border-radius: 100px;
    border-radius: 100px;
}
.account-settings .user-profile h5.user-name {
    margin: 0 0 0.5rem 0;
}
.account-settings .user-profile h6.user-email {
    margin: 0;
    font-size: 0.8rem;
    font-weight: 400;
    color: #9fa8b9;
}
.account-settings .about {
    margin: 2rem 0 0 0;
    text-align: center;
}
.account-settings .about h5 {
    margin: 0 0 15px 0;
    color: #007ae1;
}
.account-settings .about p {
    font-size: 0.825rem;
}
.form-control {
    border: 1px solid #cfd1d8;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    font-size: .825rem;
    background: #ffffff;
    color: #2e323c;
}

.card {
    background: #ffffff;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    border: 0;
    margin-bottom: 1rem;
}
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
    
});
$("#district").change(() => {
    callApiWard(host + "d/" + $("#district").find(':selected').data('id') + "?depth=2");
    printResult();
});
$("#ward").change(() => {
    
})
  window.addEventListener('load',async (event) => {
    @if(Auth::user()->address === null || Auth::user()->address === "///")
        return;
    @endif
    var address = @json(Auth::user()->address);
    var parts = address.split('/');
var city = parts[0];
var district = parts[1];
var ward = parts[2];
var street=parts[3];
    var selectElement = document.getElementById('city');
    var valueToSelect = city;
    selectElement.value = valueToSelect;
    await callApiDistrict(host + "p/" + $("#city").find(':selected').data('id') + "?depth=2");
    var selectElement = document.getElementById('district');
    var valueToSelect = district;
    selectElement.value = valueToSelect;
   await  callApiWard(host + "d/" + $("#district").find(':selected').data('id') + "?depth=2");
    var selectElement = document.getElementById('ward');
    var valueToSelect = ward;
    selectElement.value = valueToSelect;
    document.querySelector("#street").value=street;

  });


	</script>
@endsection
@section('content')
<div class="container">
    <div class="row gutters">
    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
    <div class="card h-100">
        <div class="card-body">
            <div class="account-settings">
                <div class="user-profile">
                    <div class="user-avatar">
                        <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Maxwell Admin">
                    </div>
                    <h5 class="user-name">{{$user['name']}}</h5>
                    <h6 class="user-email">{{$user['email']}}</h6>
                </div>
                <div class="about">
                    <h5>About</h5>
                    <p>I'm Yuki. Full Stack Designer I enjoy creating user-centric, delightful and human experiences.</p>
                </div>
            </div>
        </div>
    </div>
    </div>
    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
    <div class="card h-100">
        <form action="{{route('profile.update')}}" method="post">
            @csrf
        <div class="card-body">
            <div class="row gutters">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <h6 class="mb-2 text-primary">Personal Details</h6>
                </div>
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                    <div class="form-group">
                        <label for="fullName">Full Name</label>
                        <input type="text" class="form-control" id="fullName" name="name" value="{{$user['name']}}">
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                    <div class="form-group">
                        <label for="eMail">Email</label>
                        <input type="email" class="form-control" id="eMail" name="email" value="{{$user['email']}}">
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="{{$user['phone']}}">
                    </div>
                </div>
              
            </div>
            <div class="row gutters">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <h6 class="mt-3 mb-2 text-primary">Address</h6>
                </div>
                <div class="col-md-6 form-group">
                    <label>City</label>
                    <select id="city" name="city"class="custom-select dropdown" >
                        <option selected value="">Choose city</option>
                    </select>
                </div>
                <div class="col-md-6 form-group">
                    <label>District</label>
                    <select id="district" name="district" class="custom-select dropdown" >
                        <option selected value="">Choose district</option>
                    </select>
                </div>
                <div class="col-md-6 form-group">
                    <label>Ward</label>
                    <select id="ward" name="ward" class="custom-select dropdown" >
                        <option selected value="">Choose ward</option>
                    </select>
                </div>
               
                <div class="col-md-6 form-group">
                    <label>Street</label>
                    <input class="form-control" name="street" type="text" placeholder="Street">
                </div>
            </div>
            <div class="row gutters">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="text-right">
                        <input type="reset" id="submit" name="submit" class="btn btn-secondary" value="Reset"/>
                        <input type="submit" id="submit" name="submit" class="btn btn-primary"value="Update"/>
                    </div>
                </div>
            </div>
    </form>

        </div>
    </div>
    </div>
    </div>
    </div>
    @endsection