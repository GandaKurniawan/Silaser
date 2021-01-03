@extends('pelanggan.layouts.master')
@section('title','checkOut Page')
@section('slider')
@endsection
@section('content')
<div class="container">
    @if(Session::has('message'))
    <div class="alert alert-success text-center" role="alert">
        {{Session::get('message')}}
    </div>
    @endif
    <div class="row">
        <form action="{{url('/submit-checkout')}}" method="post" class="form-horizontal">

            @for($i=0; $i<3; $i++) <div class="col-sm-1">
    </div>
    @endfor

    <div class="col-sm-4 col-sm-offset-1">
        <div class="login-form">
            <!--Form Alamat-->
            @csrf
            <legend>Alamat Pengiriman</legend>
            <div class="form-group {{$errors->has('billing_name')?'has-error':''}}">
                <input type="text" class="form-control" name="billing_name" id="billing_name"
                    value="{{$user_login->name}}" placeholder="Nama Pembeli" readonly>
                <span class="text-danger">{{$errors->first('billing_name')}}</span>
            </div>
            <div class="form-group {{$errors->has('billing_address')?'has-error':''}}">
                <input type="text" class="form-control" value="{{$user_login->address}}" name="billing_address"
                    id="billing_address" placeholder="Alamat Lenkap">
                <span class="text-danger">{{$errors->first('billing_address')}}</span>
            </div>
            <div class="form-group {{$errors->has('billing_kelurahan')?'has-error':''}}">
                <input type="text" class="form-control" value="{{$user_login->kelurahan}}" name="billing_kelurahan"
                    id="billing_kelurahan" placeholder="Kelurahan/Desa">
                <span class="text-danger">{{$errors->first('billing_kelurahan')}}</span>
            </div>
            <div class="form-group {{$errors->has('billing_address')?'has-error':''}}">
                <input type="text" class="form-control" value="{{$user_login->kecamatan}}" name="billing_kecamatan"
                    id="billing_kecamatan" placeholder="Kecamatan">
                <span class="text-danger">{{$errors->first('billing_kecamatan')}}</span>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" value="Jember" disabled>
            </div>
            <div class=" form-group {{$errors->has('billing_postcode')?'has-error':''}}">
                <input type="text" class="form-control" value="{{$user_login->postcode}}" name="billing_postcode"
                    id="billing_postcode" placeholder="Kode Pos">
                <span class="text-danger">{{$errors->first('billing_postcode')}}</span>
            </div>
        </div>
        <div class="form-group {{$errors->has('billing_mobile')?'has-error':''}}">
            <input type="text" class="form-control" value="{{$user_login->mobile}}" name="billing_mobile"
                id="billing_mobile" placeholder="No HP">
            <span class="text-danger">{{$errors->first('billing_mobile')}}</span>
        </div>
        <button type="submit" class="btn btn-primary" style="float: right;">CheckOut</button>
    </div>
    <!--/login form-->
</div>
<div class="col-sm-1">
    </form>
</div>
</div>
<div style="margin-bottom: 20px;"></div>
@endsection