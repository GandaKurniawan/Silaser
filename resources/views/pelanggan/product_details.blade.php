@extends('pelanggan.layouts.master')
@section('title','Detail Produk | SILASER - Sistem Informasi Penjualan dan Layanan Servis Laptop')
@section('slider')
@endsection
@section('content')
<div class="container">
    <div class="row">
        <div class="col-sm-3">
            @include('pelanggan.layouts.category_menu')
        </div>
        <div class="col-sm-9 padding-right">
            @if(Session::has('message'))
            <div class="alert alert-success text-center" role="alert">
                {{Session::get('message')}}
            </div>
            @endif
            <div class="product-details">
                <!--product-details-->

                <div class="col-sm-5">
                    <div class="easyzoom easyzoom--overlay easyzoom--with-thumbnails">
                        <a href="{{url('products/large',$detail_product->image)}}">
                            <img src="{{url('products/small',$detail_product->image)}}" alt="" id="dynamicImage" />
                        </a>
                    </div>

                    <ul class="thumbnails" style="margin-left: -10px;">
                        <li>
                            <a href="{{url('products/large',$detail_product->image)}}" data-standard="{{url('products/small',$detail_product->image)}}">
                                <img src="{{url('products/small',$detail_product->image)}}" alt="" width="75" style="padding: 8px;">
                            </a>
                            @foreach($imagesGalleries as $imagesGallery)
                            <a href="{{url('products/large',$imagesGallery->image)}}" data-standard="{{url('products/small',$imagesGallery->image)}}">
                                <img src="{{url('products/small',$imagesGallery->image)}}" alt="" width="75" style="padding: 8px;">
                            </a>
                            @endforeach
                        </li>
                    </ul>
                </div>
                <div class="col-sm-7">
                    <form action="{{route('addToCart')}}" method="post" role="form">
                        @csrf
                        <input type="hidden" name="products_id" value="{{$detail_product->id}}">
                        <input type="hidden" name="price" value="{{$detail_product->price}}" id="dynamicPriceInput">
                        <div class="product-information">
                            <!--/product-information-->
                            <img src="{{asset('pelanggan/images/product-details/new.jpg')}}" class="newarrival" alt="product_image" />
                            <h2>{{$detail_product->p_name}}</h2>
                            <span>
                                <span id="dynamic_price">Rp {{@rupiah($detail_product->price)}}</span>
                                @if($detail_product->stock>0)
                                <label>Jumlah:</label>
                                <input type="text" name="quantity" value="1" id="inputStock" />
                                <button type="submit" class="btn btn-fefault cart" id="buttonAddToCart">
                                    <i class="fa fa-shopping-cart"></i>
                                    Add to cart
                                </button>
                                @endif
                            </span>
                            <p><b>Stock:</b>
                                @if($detail_product->stock>0)
                                <span id="availableStock">{{$detail_product->stock}}</span>
                                @else
                                <span id="availableStock">Kosong</span>
                                @endif
                            </p>
                            <p><b>Kondisi:</b> Baru</p>
                            <a href="#"><img src="{{asset('pelanggan/images/product-details/share.png')}}" class="share img-responsive" alt="" /></a>
                        </div>
                        <!--/product-information-->
                    </form>

                </div>
            </div>
            <!--/product-details-->

            <div class="category-tab shop-details-tab">
                <!--category-tab-->
                <div class="col-sm-12">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#details" data-toggle="tab">Details</a></li>
                    </ul>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="details">
                        {{!!$detail_product->description!!}}
                    </div>

                </div>
            </div>
            <!--/category-tab-->

            <div class="recommended_items">
                <!--recommended_items-->
                <h2 class="title text-center">Produk Lain</h2>

                <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <?php $countChunk = 0; ?>
                        @foreach($relateProducts->chunk(3) as $chunk)
                        <?php $countChunk++; ?>
                        <div class="item<?php if ($countChunk == 1) {
                                            echo ' active';
                                        } ?>">
                            @foreach($chunk as $item)
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="{{url('/products/small',$item->image)}}" alt="" style="width: 150px;" />
                                            <h2>{{$item->price}}</h2>
                                            <p>{{$item->p_name}}</p>
                                            <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Tambah ke dalam Keranjang</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                        @endforeach
                    </div>
                    <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                    </a>
                    <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                    </a>
                </div>
            </div>
            <!--/recommended_items-->

        </div>
    </div>
</div>
@endsection