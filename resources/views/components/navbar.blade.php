<div class="container-fluid" style="z-index: 0">
    <div class="row border-top px-xl-5">
        <div class="col-lg-3 d-none d-lg-block ">
            <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;" aria-expanded="false">
                <h6 class="m-0">Categories</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <nav class="{{url()->current()==route('home.index')?'':'collapse'}} position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
                <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                    @foreach($categories as $category)
                <div class="nav-item dropdown">
                    <a href="{{route('shop.category',['id'=>$category['id']])}}" class="nav-link">
                        {{$category['name']}}
                        {!! count($category->categoryChildren) > 0 ? ' <i class="fa fa-angle-down float-right mt-1"></i>' : '' !!}
                    </a>
            
                </div>
                @endforeach
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                <a href="" class="text-decoration-none d-block d-lg-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="{{route('home.index')}}" class="d-flex align-items-center justify-content-center nav-item nav-link">Home</a>
                        <a href="{{route('shop.index')}}" class="nav-item nav-link">Shop</a>
                       
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Pages</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="{{route('cart.index')}}" class="dropdown-item">Shopping Cart</a>
                                <a href="{{route('checkout.index')}}" class="dropdown-item">Checkout</a>
                            </div>
                        </div>
                        <a href="{{route('flashsales.index')}}" class="nav-item nav-link">Flashsales</a>

                        <a href="contact.html" class="nav-item nav-link">Contact</a>
                    </div>
                    <div class="navbar-nav ml-auto py-0">
                        @if(!Auth::check())
                            <a href="{{route('login.index')}}" class="nav-item nav-link">Login</a>
                            <a href="{{route('register.index')}}" class="nav-item nav-link">Register</a>
                        @else
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="true">{{ Auth::user()->name }}</a>
                                <div class="dropdown-menu rounded-0 m-0">
                                    <a href="{{route('profile.index')}}" class="dropdown-item">Profile</a>
                                    <a href="{{route('cart.index')}}" class="dropdown-item">Cart</a>
                                    <a href="{{route('profile.orders')}}" class="dropdown-item">Orders</a>
                                </div>
                            </div>
                            <a href="{{route('logout')}}" class="nav-item nav-link">Logout</a>
                        @endif
                    </div>
                </div>
            </nav>
        @yield('slider')
        </div>
    </div>
</div>