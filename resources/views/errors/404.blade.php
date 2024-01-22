@extends('layouts.master')
@section('title')
<title>404 Not Found</title>
@endsection
@section('css')
@php
use App\Models\Category;
$categories = Category::all();
@endphp
<link rel="stylesheet" href="{{asset('eshopper/resources/css/404.css')}}">
@endsection
@section('content')
<div class="row justify-content-center">
    <div class="col-md-12 col-sm-12">
        <div class="card shadow-lg border-0 rounded-lg mt-5 mx-auto" style="width: 30rem;">
            <h3 class="card-header display-1 text-muted text-center">
                404
            </h3>
            <span class="card-subtitle mb-2 text-muted text-center">
                Page Could Not Be Found 
            </span>
            <div class="card-body mx-auto">
                <a type="button" href="{{route('home.index')}}"
                class="btn btn-sm btn-info text-white"> Back To Home </a>
            </div>
        </div>
    </div>
</div>
@endsection