@extends('layouts.master')
@section('title')
<title>Login sdfgsdf</title>
@endsection
@section('navbar')
@endsection
@section('content')
<div class="container-fluid justify-content-center align-content-center">
  <form class="p-4" action="{{route('login.auth')}}" method="POST">
    @csrf
    <div class="form-group">
      <label for="exampleDropdownFormEmail2">Email address</label>
      <input type="email" name="email" class="form-control" id="email" placeholder="email@example.com">
    </div>
    <div class="form-group">
      <label for="exampleDropdownFormPassword2">Password</label>
      <input type="password" name="password" class="form-control" id="password" placeholder="Password">
    </div>
    <div class="form-check">
      <input type="checkbox" name="remember" class="form-check-input" id="dropdownCheck2">
      <label class="form-check-label" for="dropdownCheck2">
        Remember me
      </label>
    </div>
    <button type="submit" class="btn btn-primary">Sign in</button>
  </form>
</div>
  @endsection
 