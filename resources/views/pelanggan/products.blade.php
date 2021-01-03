@extends('pelanggan.layouts.master')
@section('title','List Products')
@section('slider')
@endsection
@section('content')
<div class="container">
    <div class="row">
        <div class="col-sm-3">
            @include('pelanggan.layouts.category_menu')
        </div>
        <div class="col-sm-9 padding-right">
            <div class="features_items">
                <!--features_items-->


                {{-- @if ($byCate != "") {
                    $products = $list_product;
                    echo '<h2 class="title text-center">Category ' . $byCate->name . '</h2>';
                } @else {
                    echo '<h2 class="title text-center">List Products</h2>';
                } --}}

                @foreach($list_products as $list)
                <div class="col-sm-4">
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <a href="{{url('/product-detail',$list->id)}}"><img
                                        src="{{url('products/small/',$list->image)}}" alt="" /></a>
                                <h2>Rp {{@rupiah($list->price)}}</h2>
                                <p>{{$list->p_name}}</p>
                                <a href="{{url('/product-detail',$list->id)}}" class="btn btn-default add-to-cart">View
                                    Product</a>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
                {{--<ul class="pagination">
                        <li class="active"><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">&raquo;</a></li>
                    </ul>--}}
            </div>
            <!--features_items-->
        </div>
    </div>
</div>
@endsection