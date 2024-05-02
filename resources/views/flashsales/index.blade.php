@extends('layouts.master')
@section('title')
<title>Flash Sales</title>
@endsection

@section('css')

<style>
   
   @import url(http://fonts.googleapis.com/css?family=Lato:100,400);
.mb20{
    margin-bottom:20px;
}
section {
    padding: 40px 0;
}
#timer .countdown-wrapper {
    margin: 0 auto;
}
#timer #countdown {
    font-family: 'Lato', sans-serif;
    text-align: center;
    color: #eee;
    text-shadow: 1px 1px 5px black;
    padding: 40px 0;
}
#timer .countdown-wrapper #countdown .timer {
    margin: 10px;
    padding: 20px;
    font-size: 45px;
    border-radius: 50%;
    cursor: pointer;
}
#timer .col-md-4.countdown-wrapper #countdown .timer {
    margin: 10px;
    padding: 20px;
    font-size: 35px;
    border-radius: 50%;
    cursor: pointer;
}
#timer .countdown-wrapper #countdown #hour {
    -webkit-box-shadow: 0 0 0 5px rgba(92, 184, 92, .5);
    -moz-box-shadow: 0 0 0 5px rgba(92, 184, 92, .5);
    box-shadow: 0 0 0 5px rgba(92, 184, 92, .5);
}
#timer .countdown-wrapper #countdown #hour:hover {
    -webkit-box-shadow: 0px 0px 15px 1px rgba(92, 184, 92, 1);
    -moz-box-shadow: 0px 0px 15px 1px rgba(92, 184, 92, 1);
    box-shadow: 0px 0px 15px 1px rgba(92, 184, 92, 1);
}
#timer .countdown-wrapper #countdown #min {
    -webkit-box-shadow: 0 0 0 5px rgba(91, 192, 222, .5);
    -moz-box-shadow: 0 0 0 5px rgba(91, 192, 222, .5);
    box-shadow: 0 0 0 5px rgba(91, 192, 222, .5);
}
#timer .countdown-wrapper #countdown #min:hover {
    -webkit-box-shadow: 0px 0px 15px 1px rgb(91, 192, 222);
    -moz-box-shadow: 0px 0px 15px 1px rgb(91, 192, 222);
    box-shadow: 0px 0px 15px 1px rgb(91, 192, 222);
}
#timer .countdown-wrapper #countdown #sec {
    -webkit-box-shadow: 0 0 0 5px rgba(2, 117, 216, .5);
    -moz-box-shadow: 0 0 0 5px rgba(2, 117, 216, .5);
    box-shadow: 0 0 0 5px rgba(2, 117, 216, .5)
}
#timer .countdown-wrapper #countdown #sec:hover {
    -webkit-box-shadow: 0px 0px 15px 1px rgba(2, 117, 216, 1);
    -moz-box-shadow: 0px 0px 15px 1px rgba(2, 117, 216, 1);
    box-shadow: 0px 0px 15px 1px rgba(2, 117, 216, 1);
}
#timer .countdown-wrapper .card .card-footer .btn {
    margin: 2px 0;
}
@media (min-width: 992px) and (max-width: 1199px) {
    #timer .countdown-wrapper #countdown .timer {
        margin: 10px;
        padding: 20px;
        font-size: 65px;
        border-radius: 50%;
        cursor: pointer;
    }
}
@media (min-width: 768px) and (max-width: 991px) {
     #timer .countdown-wrapper #countdown .timer {
        margin: 10px;
        padding: 20px;
        font-size: 72px;
        border-radius: 50%;
        cursor: pointer;
    }
}
@media (max-width: 768px) {
    #timer .countdown-wrapper #countdown .timer {
        margin: 10px;
        padding: 20px;
        font-size: 73px;
        border-radius: 50%;
        cursor: pointer;
    }
}
@media (max-width: 767px) {
    #timer .countdown-wrapper #countdown #hour,
    #timer .countdown-wrapper #countdown #min,
    #timer .countdown-wrapper #countdown #sec {
        font-size: 60px;
        border-radius: 4%;
    }
}
@media (max-width: 576px){
    #timer .countdown-wrapper #countdown #hour,
    #timer .countdown-wrapper #countdown #min,
    #timer .countdown-wrapper #countdown #sec {
        font-size: 25px;
        border-radius: 4%;
    }
    #timer .countdown-wrapper #countdown .timer {
        padding: 13px;
    }
}
</style>
@endsection
@section('content')
<div class="container">
    <div class="container">
        <section id="timer">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 countdown-wrapper text-center mb20">
                    <div class="card" style="width:fit-content">
                        <input type="datetime-local" id="datetime" value="{{$actived_flashSale->start_at}}" hidden disabled>
                        <div class="card-header">
                            Upcomming Event countdown timer
                        </div>
                        <div class="card-block">
                            <div id="countdown">
                                <div class="well">
                                    <span id="day" class="timer bg-success"></span>
                                    <span id="hour" class="timer bg-success"></span>
                                    <span id="min" class="timer bg-info"></span>
                                    <span id="sec" class="timer bg-primary"></span>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-primary">Book now</a>
                            <a href="#" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">Subscrib for upcomming</a>
                            <a href="#" class="btn btn-danger">14 remaining</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- Subscribe for upcomming event modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Subscribe for our upcomming Events</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">×</span> </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="email">Email address</label>
                            <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email"> 
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> 
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-success">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        @foreach($products as $product)
                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                    <div class="card product-item border-0 mb-4">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" style="height:15rem"src="{{config('app.base_url').$product['feature_image_path']}}" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">{{$product['name']}}</h6>
                            <div class="d-flex justify-content-center">
                                <h6>????????</h6><h6 class="text-muted ml-2"><del>{{number_format($product['price'])}}</del></h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="{{route('detail.index',['id'=>$product['id']])}}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                            <span data-url="{{ route('cart.add', ['id' => $product['id']]) }}" class="btn btn-sm text-dark p-0 add-to-cart-btn"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</span>
                        </div>
                    </div>
                </div>
                @endforeach
    </div>
</div>
@endsection
@section('js')
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="{{asset('eshopper/js/jquery.countdown.min.js')}}"></script>
<script>
   $(document).ready(function() {
  setInterval(function() {
    var dValue = new Date($("#datetime").val()); 
    console.log(dValue);
    var d = new Date(dValue); // Chuyển đổi chuỗi thành đối tượng Date
    
    var now = new Date(); // Lấy thời gian hiện tại
    var totalSec = (d - now) / 1000; // Tính tổng số giây còn lại
    console.log(totalSec);
    if(totalSec < 0) {
      console.log("The specified time is in the past");
      return; // Nếu thời gian đã qua, dừng hàm
    }
    
    var days = parseInt(totalSec / 86400); // Tính số ngày còn lại
    totalSec = totalSec % 86400;
    
    var hours = parseInt(totalSec / 3600); // Tính số giờ còn lại
    totalSec = totalSec % 3600;
    
    var min = parseInt(totalSec / 60); // Tính số phút còn lại
    var sec = parseInt(totalSec % 60); // Tính số giây còn lại
    
    // Đảm bảo rằng giờ, phút, và giây có đủ 2 chữ số
    if(hours < 10) {
      hours = '0' + hours;
    }
    if(min < 10) {
      min = '0' + min;
    }
    if(sec < 10) {
      sec = '0' + sec;
    }

    // Cập nhật HTML
    jQuery('#countdown #day').html(days);
    jQuery('#countdown #hour').html(hours);
    jQuery('#countdown #min').html(min);
    jQuery('#countdown #sec').html(sec);
  }, 1000);
});
</script>