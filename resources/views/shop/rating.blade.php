@extends('layouts.master')
@section('title')
<title>Rating</title>
@endsection
@section('css')
<style>
    .col-md-6 {
        margin-left: 25%;
        margin-top: 5%;
        margin-bottom: 5%;
    }
.star-rating {
    display: flex;
    flex-direction: row-reverse;
    justify-content: flex-end;
}
.star-rating input {
    display: none;
}
.star-rating label {
    color: lightgray;
    font-size: 30px;
    padding: 0 5px;
    cursor: pointer;
    transition: color 0.2s;
}
.star-rating label:hover,
.star-rating label:hover ~ label,
.star-rating input:checked ~ label {
    color: gold;
}

</style>
@endsection
@section('content')
<div class="col-md-6">
    <h4 class="mb-4">Leave a review</h4>
    <small>Your email address will not be published. Required fields are marked *</small>
    <div class="">
        <p>Product</p>
        <div class="d-flex">
            <img src="{{ config('app.base_url') . $order->orderItems[0]->product->feature_image_path }}" alt="" style="width: 50px;">
            <div class="ml-3">
                <p class="mb-0">{{ $order->orderItems[0]->product->name }}</p>
                <p class="mb-0">Price: {{ number_format($order->orderItems[0]->price) }}</p>
            </div>
        </div>
    </div>
    <div class="d-flex my-3">
        <p class="mb-0 mr-2">Your Rating * :</p>
        <div class="star-rating">
            <input id="star-5" type="radio" name="rating" value="5">
            <label for="star-5" title="5 stars">
                <i class="active fa fa-star"></i>
            </label>
            <input id="star-4" type="radio" name="rating" value="4">
            <label for="star-4" title="4 stars">
                <i class="active fa fa-star"></i>
            </label>
            <input id="star-3" type="radio" name="rating" value="3">
            <label for="star-3" title="3 stars">
                <i class="active fa fa-star"></i>
            </label>
            <input id="star-2" type="radio" name="rating" value="2">
            <label for="star-2" title="2 stars">
                <i class="active fa fa-star"></i>
            </label>
            <input id="star-1" type="radio" name="rating" value="1" checked>
            <label for="star-1" title="1 star">
                <i class="active fa fa-star"></i>
            </label>
        </div>
    </div>
  
    <form method="POST" action="{{route('rate.store',['id'=>$order->id,'product_id'=>request('product_id')])}}">
        @csrf
        <div class="form-group">
            <input type="hidden" id="rating" name="rating" value="">
            <label for="comment">Your Review *</label>
            <textarea id="comment" cols="30" rows="5" name="comment" class="form-control"></textarea>
        </div>
        <div class="form-group mb-0">
            <input type="submit" value="Leave Your Review" class="btn btn-primary px-3">
        </div>
    </form>
</div>
@endsection
@section('js')
<script>
const radios = document.querySelectorAll('input[type="radio"][name="rating"]');
document.getElementById('rating').value = 1;
let rateStar = 1;
function handleChange() {
    console.log('Star', this.value, 'is selected.');
    rateStar = this.value;
    document.getElementById('rating').value = rateStar;
}
radios.forEach(radio => radio.addEventListener('change', handleChange));
</script>
@endsection