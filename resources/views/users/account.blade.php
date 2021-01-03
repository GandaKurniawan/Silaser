@extends('pelanggan.layouts.master')
@section('title','My Account Page')
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
        <div class="col-sm-4 col-sm-offset-1">
            <div class="login-form">
                <!--login form-->
                <form action="{{url('/update-profile',$user_login->id)}}" method="post" class="form-horizontal">
                    <input type="hidden" name="_token" value="{{csrf_token()}}">
                    {{method_field('PUT')}}
                    <legend>Account Profile</legend>
                    <div class="form-group">
                        <input type="text" value="{{$user_login->email}}" disabled>
                    </div>
                    <div class="form-group">
                        <input type="text" value="{{$user_login->name}}" disabled>
                    </div>
                    <div class="form-group {{$errors->has('address')?'has-error':''}}">
                        <input type="text" class="form-control" value="{{$user_login->address}}" name="address"
                            id="address" placeholder="Address">
                        <span class="text-danger">{{$errors->first('address')}}</span>
                    </div>
                    <div class="form-group {{$errors->has('kelurahan')?'has-error':''}}">
                        <input type="text" class="form-control" name="kelurahan" value="{{$user_login->kelurahan}}"
                            id="kelurahan" placeholder="kelurahan">
                        <span class="text-danger">{{$errors->first('kelurahan')}}</span>
                    </div>
                    <div class="form-group {{$errors->has('kecamatan')?'has-error':''}}">
                        <input type="text" class="form-control" name="kecamatan" value="{{$user_login->kecamatan}}"
                            id="kecamatan" placeholder="kecamatan">
                        <span class="text-danger">{{$errors->first('kecamatan')}}</span>
                    </div>
                    <div class="form-group">
                        <input type="text" value="Jember" disabled>
                    </div>
                    <div class="form-group {{$errors->has('postcode')?'has-error':''}}">
                        <input type="text" class="form-control" name="postcode" value="{{$user_login->postcode}}"
                            id="postcode" placeholder="postcode">
                        <span class="text-danger">{{$errors->first('postcode')}}</span>
                    </div>
                    <div class="form-group {{$errors->has('mobile')?'has-error':''}}">
                        <input type="text" class="form-control" name="mobile" value="{{$user_login->mobile}}"
                            id="mobile" placeholder="Mobile">
                        <span class="text-danger">{{$errors->first('mobile')}}</span>
                    </div>
                    <button type="submit" class="btn btn-primary" style="float: right;">Edit Profile</button>
                </form>
            </div>
            <!--/login form-->
        </div>
        <div class="col-sm-1">
            <h2 class="or">OR</h2>
        </div>
        <div class="col-sm-4">
            <div class="signup-form">
                <!--sign up form-->
                <form action="{{url('/update-password',$user_login->id)}}" method="post" class="form-horizontal">
                    <legend>Update New Password</legend>
                    <input type="hidden" name="_token" value="{{csrf_token()}}">
                    {{method_field('PUT')}}
                    <div class="form-group {{$errors->has('password')?'has-error':''}}">
                        <input type="password" class="form-control" name="password" id="password"
                            placeholder="Old Password">
                        @if(Session::has('oldpassword'))
                        <span class="text-danger">{{Session::get('oldpassword')}}</span>
                        @endif
                    </div>
                    <div class="form-group {{$errors->has('newPassword')?'has-error':''}}">
                        <input type="password" class="form-control" name="newPassword" id="newPassword"
                            placeholder="New Password">
                        <span class="text-danger">{{$errors->first('newPassword')}}</span>
                    </div>
                    <div class="form-group {{$errors->has('newPassword_confirmation')?'has-error':''}}">
                        <input type="password" class="form-control" name="newPassword_confirmation"
                            id="newPassword_confirmation" placeholder="Confirm Password">
                        <span class="text-danger">{{$errors->first('newPassword_confirmation')}}</span>
                    </div>
                    <button type="submit" class="btn btn-primary" style="float: right;">Edit Password</button>
                </form>
            </div>
            <!--/sign up form-->
        </div>
    </div>
</div>
<div style="margin-bottom: 20px;"></div>
@endsection