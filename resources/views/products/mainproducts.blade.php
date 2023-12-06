@foreach($products as $product)
                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                    <div class="card product-item border-0 mb-4">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" style="height:15rem"src="{{config('app.base_url').$product['feature_image_path']}}" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">{{$product['name']}}</h6>
                            <div class="d-flex justify-content-center">
                                <h6>{{$product['price']}}</h6><h6 class="text-muted ml-2"><del>{{$product['price']}}</del></h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="{{route('detail.index',['id'=>$product['id']])}}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                            <span data-url="{{ route('cart.add', ['id' => $product['id']]) }}" class="btn btn-sm text-dark p-0 add-to-cart-btn"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</span>
                        </div>
                    </div>
                </div>
                @endforeach
                <div class="col-12 pb-1">
                    {{ $products->links() }}
                </div>