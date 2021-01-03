@extends('pelanggan.layouts.master')
@section('title','Cart Page')
@section('slider')
@endsection
@section('content')
<section id="cart_items">
    <div class="container">
        @if(Session::has('message'))
        <div class="alert alert-success text-center" role="alert">
            {{Session::get('message')}}
        </div>
        @endif
        <div class="table-responsive cart_info">
            <table class="table table-condensed">
                <thead>
                    <tr class="cart_menu">
                        <td class="image">Produk</td>
                        <td class="description"></td>
                        <td class="price">Harga</td>
                        <td class="quantity">Jumlah</td>
                        <td class="total">Total</td>
                        <td>Hapus</td>
                    </tr>
                </thead>
                <tbody>
                    @foreach($cart_datas as $cart_data)
                    <tr>
                        <td class="cart_product">
                            <a href=""><img src="{{url('products/small',$cart_data->image)}}" alt=""
                                    style="width: 100px;"></a>
                        </td>
                        <td class="cart_description" style="text-align: center">
                            <h4><a href="#">{{$cart_data->p_name}}</a></h4>
                            <?= '<p>' . (substr($cart_data->description, 0, 50)) . '...' . '</p>' ?>
                        </td>
                        <td class="cart_price">
                            <p>Rp {{@rupiah($cart_data->price)}}</p>
                        </td>
                        <td class="cart_quantity">
                            <div class="cart_quantity_button">
                                @if($cart_data->quantity<$cart_data->stock)
                                    <a class="cart_quantity_up"
                                        href="{{url('/cart/update-quantity/'.$cart_data->id.'/1')}}"> + </a>
                                    @else
                                    <a class="cart_quantity_up"></a>
                                    @endif

                                    <input class="cart_quantity_input" type="text" name="quantity"
                                        value="{{$cart_data->quantity}}" autocomplete="off" disabled size="2">

                                    @if($cart_data->quantity>1)
                                    <a class="cart_quantity_down"
                                        href="{{url('/cart/update-quantity/'.$cart_data->id.'/-1')}}"> - </a>
                                    @else
                                    <a class="cart_quantity_up"></a>
                                    @endif
                            </div>
                        </td>
                        <td class="cart_total">
                            <p class="cart_total_price">Rp {{@rupiah($cart_data->price*$cart_data->quantity)}}</p>
                        </td>
                        <td class="cart_delete">
                            <a class="cart_quantity_delete" href="{{url('/cart/deleteItem',$cart_data->id)}}"><i
                                    class="fa fa-times"></i></a>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col-sm-6">
                {{-- @if(Session::has('message_expedition'))
                <div class="alert alert-danger text-center" role="alert">
                    {{Session::get('message_expedition')}}
            </div>
            @endif --}}
        </div>
    </div>
    <h4>Pilih Jasa Ekspedisi</h4>
    <form action="{{url('/apply-expedition')}}" method="post" role="form">
        @csrf
        <select id="expedition" name="expedition">
            <option selected>Pilih Jasa Pengiriman</option>
            @foreach($expedition_datas as $data)
            <option value="{{$data->id}}">{{$data->expedition_name}} ({{$data->type.'-'.$data->estimation}}): Rp
                {{@rupiah($data->base_charge)}}</option>
            @endforeach
        </select>
        <button type="submit" class="btn btn-primary">Apply Expedition</button>
    </form>
</section>
<!--/#cart_items-->

<section id="do_action">
    <div class="container">
        <div class="heading">
            <h3>What would you like to do next?</h3>
            <p>Choose if you have a discount code or reward points you want to use or would like to estimate your
                delivery cost.</p>
        </div>
        <div class="row">
            <div class="col-sm-6">
                @if(Session::has('message_coupon'))
                <div class="alert alert-danger text-center" role="alert">
                    {{Session::get('message_coupon')}}
                </div>
                @endif
                <div class="chose_area" style="padding: 20px;">
                    <form action="{{url('/apply-coupon')}}" method="post" role="form">
                        @csrf
                        <input type="hidden" name="Total_amountPrice" value="{{$total_price}}">
                        <div class="form-group">
                            <label for="coupon_code">Kode Kupon</label>
                            <div class="controls {{$errors->has('coupon_code')?'has-error':''}}">
                                <input type="text" class="form-control" name="coupon_code" id="coupon_code"
                                    placeholder="Masukkan Kode Kupon">
                                <span class="text-danger">{{$errors->first('coupon_code')}}</span>
                            </div>
                            <button type="submit" class="btn btn-primary">Apply Coupon</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-6">
                @if(Session::has('message_apply_sucess'))
                <div class="alert alert-success text-center" role="alert">
                    {{Session::get('message_apply_sucess')}}
                </div>
                @endif
                <div class="total_area">
                    <ul>
                        @if(Session::has('expedition_total'))
                        @if(Session::has('discount_amount_price'))
                        <li>Sub Total <span>Rp {{@rupiah($total_price)}}</span></li>
                        <li>Ongkir <span>Rp {{@rupiah(Session::get('expedition_total'))}}</span></li>
                        <li>Coupon Discount (Code : {{Session::get('coupon_code')}}) <span>- Rp
                                {{@rupiah(Session::get('discount_amount_price'))}}</span></li>
                        <li>Total Seluruhnya <span>Rp
                                {{@rupiah($total_price+Session::get('expedition_total')-Session::get('discount_amount_price'))}}</span>
                        </li>
                        @else
                        <li>Sub Total <span>Rp {{@rupiah($total_price)}}</span></li>
                        <li>Ongkir <span>Rp {{@rupiah(Session::get('expedition_total'))}}</span></li>
                        <li>Total Seluruhnya<span>Rp {{@rupiah($total_price+Session::get('expedition_total'))}}</span>
                        </li>
                        @endif
                        @else
                        @if(Session::has('discount_amount_price'))
                        <li>Sub Total <span>Rp {{@rupiah($total_price)}}</span></li>
                        <li>Ongkir <span>Rp {{@rupiah($expedition)}}</span></li>
                        <li>Coupon Discount (Code : {{Session::get('coupon_code')}}) <span>- Rp
                                {{@rupiah(Session::get('discount_amount_price'))}}</span></li>
                        <li>Total Seluruhnya<span>Rp
                                {{@rupiah($total_price+$expedition-Session::get('discount_amount_price'))}}</span></li>
                        @else
                        <li>Sub Total <span>Rp {{@rupiah($total_price)}}</span></li>
                        <li>Ongkir <span>Rp {{@rupiah($expedition)}}</span></li>
                        <li>Total Seluruhnya<span>Rp {{@rupiah($total_price+$expedition)}}</span></li>
                        @endif
                        @endif
                    </ul>
                    <div style="margin-left: 20px;"><a class="btn btn-default check_out"
                            href="{{url('/check-out')}}">Check Out</a></div>
                </div>
            </div>
        </div>
    </div>
    <!--/#do_action-->
    @endsection