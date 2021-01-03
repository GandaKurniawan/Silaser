@extends('pelanggan.layouts.master')
@section('title','Sistem Informasi Penjualan dan Layanan Servis Laptopx')
@section('content')
<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                @include('pelanggan.layouts.category_menu')
            </div>

            <div class="col-sm-9 padding-right">
                <div class="features_items">
                    <!--features_items-->
                    <h2 class="title text-center">Features Items</h2>
                    @foreach($products as $product)
                    <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <a href="{{url('/product-detail',$product->id)}}"><img
                                            src="{{url('products/small/',$product->image)}}" alt="" /></a>
                                    <h2>{{ ($product->p_name)}}</h2>
                                    <h4>Rp {{@rupiah($product->price)}}</h4>
                                    <p>{{$product->name}}</p>
                                    <a href="{{url('/product-detail',$product->id)}}"
                                        class="btn btn-default add-to-cart">Detail Produk</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
                <!--features_items-->

            </div>
        </div>
    </div>
</section>
@endsection