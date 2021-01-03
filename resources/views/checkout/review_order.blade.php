@extends('pelanggan.layouts.master')
@section('title','Review Order Page')
@section('slider')
@endsection
@section('content')
<div class="container">
    <div class="step-one">
        <h2 class="heading">Shipping To</h2>
    </div>
    <div class="row">
        <form action="{{url('/submit-order')}}" method="post" class="form-horizontal">
            @csrf
            <input type="hidden" name="users_id" value="{{$user_data->id}}">
            <input type="hidden" name="address" value="{{$user_data->address}}">
            <input type="hidden" name="kelurahan" value="{{$user_data->kelurahan}}">
            <input type="hidden" name="kecamatan" value="{{$user_data->kecamatan}}">
            <input type="hidden" name="postcode" value="{{$user_data->postcode}}">
            <input type="hidden" name="mobile" value="{{$user_data->mobile}}">
            @if(Session::has('expedition'))
            <input type="hidden" name="expedition" value="{{Session::get('expedition')}}">
            <input type="hidden" name="shipping_charge" value="{{Session::get('expedition_total')}}">
            @else
            <input type="hidden" name="expedition" value="1">
            <input type="hidden" name="shipping_charge" value="10000">
            @endif
            <input type="hidden" name="order_date" value="{{date('Y-m-d')}}" data-date-format="yyyy-mm-dd">
            @if(Session::has('discount_amount_price'))
            <input type="hidden" name="coupon_id" value="{{$coupon_id}}">
            <input type="hidden" name="coupon_amount" value="{{Session::get('discount_amount_price')}}">
            <input type="hidden" name="grand_total"
                value="{{$total_price+Session::get('expedition_total')-Session::get('discount_amount_price')+$order_id}}">
            @else
            <input type="hidden" name="coupon_id" value="">
            <input type="hidden" name="coupon_amount" value="">
            <input type="hidden" name="grand_total" value="{{$total_price+Session::get('expedition_total')+$order_id}}">
            @endif

            <div class="col-sm-12">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Nama</th>
                                <th>Alamat</th>
                                <th>Kelurahan/Desa</th>
                                <th>Kecamatan</th>
                                <th>Kode Pos</th>
                                <th>Email</th>
                                <th>No. HP</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>{{$user_data->name}}</td>
                                <td>{{$user_data->address}}</td>
                                <td>{{$user_data->kelurahan}}</td>
                                <td>{{$user_data->kecamatan}}</td>
                                <td>{{$user_data->postcode}}</td>
                                <td>{{$user_data->email}}</td>
                                <td>{{$user_data->mobile}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <section id="cart_items">
                    <div class="review-payment">
                        <h2>Review & Payment</h2>
                    </div>
                    <div class="table-responsive cart_info">
                        <table class="table table-condensed">
                            <thead>
                                <tr class="cart_menu">
                                    <td class="image">Produk</td>
                                    <td class="description"></td>
                                    <td class="price">Harga</td>
                                    <td class="quantity">Jumlah</td>
                                    <td class="total">Total</td>
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
                                        <h4><a href="">{{$cart_data->p_name}}</a></h4>
                                        <?= '<p>' . (substr($cart_data->description, 0, 30)) . '...' . '</p>' ?>
                                    </td>
                                    <td class="cart_price">
                                        <p>Rp {{@rupiah($cart_data->price)}}</p>
                                    </td>
                                    <td class="cart_price">
                                        <p>{{$cart_data->quantity}}</p>
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price">Rp
                                            {{@rupiah($cart_data->price*$cart_data->quantity)}}</p>
                                    </td>
                                </tr>
                                @endforeach
                                <tr>
                                    <td colspan="4">&nbsp;</td>
                                    <td colspan="2">
                                        <table class="table table-condensed total-result">
                                            <tr>
                                                <td>Cart Sub Total</td>
                                                <td>Rp {{@rupiah($total_price)}}</td>
                                            </tr>
                                            @if(Session::has('expedition_total'))
                                            <tr>
                                                <td>Ongkir</td>
                                                <td>Rp {{@rupiah(Session::get('expedition_total'))}}</td>
                                            </tr>
                                            @if(Session::has('discount_amount_price'))
                                            <tr class="shipping-cost">
                                                <td>Coupon Discount</td>
                                                <td>- Rp {{@rupiah(Session::get('discount_amount_price'))}}</td>
                                            </tr>
                                            <tr>
                                                <td>Kode Unik Pembayaran</td>
                                                <td>Rp {{@rupiah($order_id)}}</td>
                                            </tr>
                                            <tr>
                                                <td>Total</td>
                                                <td><span>Rp
                                                        {{@rupiah($total_price+Session::get('expedition_total')-Session::get('discount_amount_price')+$order_id)}}</span>
                                                </td>
                                            </tr>
                                            @else
                                            <tr>
                                                <td>Kode Unik</td>
                                                <td>Rp {{@rupiah($order_id)}}</td>
                                            </tr>
                                            <tr>
                                                <td>Total</td>
                                                <td><span>Rp
                                                        {{@rupiah($total_price+Session::get('expedition_total')+$order_id)}}</span>
                                                </td>
                                            </tr>
                                            @endif
                                            @else
                                            <tr>
                                                <td>Ongkir</td>
                                                <td>Rp 10.000</td>
                                            </tr>
                                            @if(Session::has('discount_amount_price'))
                                            <tr class="shipping-cost">
                                                <td>Coupon Discount</td>
                                                <td>- Rp {{@rupiah(Session::get('discount_amount_price'))}}</td>
                                            </tr>
                                            <tr>
                                                <td>Kode Unik</td>
                                                <td>Rp {{@rupiah($order_id)}}</td>
                                            </tr>
                                            <tr>
                                                <td>Total</td>
                                                <td><span>Rp
                                                        {{@rupiah($total_price+10000-Session::get('discount_amount_price')+$order_id)}}</span>
                                                </td>
                                            </tr>
                                            @else
                                            <tr>
                                                <td>Kode Unik</td>
                                                <td>Rp {{@rupiah($order_id)}}</td>
                                            </tr>
                                            <tr>
                                                <td>Total</td>
                                                <td><span>Rp {{@rupiah($total_price+10+$order_id)}}</span></td>
                                            </tr>
                                            @endif
                                            @endif
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="payment-options">
                        <button type="submit" class="btn btn-primary" style="float: right;">Bayar Sekarang</button>
                    </div>
                </section>

            </div>
        </form>
    </div>
</div>
<div style="margin-bottom: 20px;"></div>
@endsection