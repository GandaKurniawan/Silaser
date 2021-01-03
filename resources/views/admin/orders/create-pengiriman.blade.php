@extends('admin.layouts.master')
@section('title','Konfirmasi Pengiriman')
@section('content')
<div id="breadcrumb"> <a href="{{url('/admin')}}" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>
        Home</a> <a href="#">Orders</a> <a href="{{url('admin/orders/sedang-proses')}}" class="current">Sedang
        Proses</a> </div>
<div class="container-fluid">
    @if(Session::has('message'))
    <div class="alert alert-success text-center" role="alert">
        <strong>Well done! &nbsp;</strong>{{Session::get('message')}}
    </div>
    @endif
    <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
            <h5>Konfirmasi Pengiriman #{{$order->id}}</h5>
        </div>
        <div class="widget-content nopadding">
            <form action="{{route('pengiriman',$order->id)}}" method="post" class="form-horizontal">
                @csrf
                {{method_field("PUT")}}
                <input type="hidden" name="shipping_status" value="sudah dikirim">
                <div class="control-group">
                    <label for="resi" class="control-label">No Resi</label>
                    <div class="controls{{$errors->has('resi')?' has-error':''}}">
                        <input type="text" name="resi" id="resi" class="form-control" style="width: 200px;">
                        <span class="text-danger">{{$errors->first('resi')}}</span>
                    </div>
                </div>

                <div class="control-group">
                    <label for="shipping_date" class="control-label">Tanggal Pengiriman</label>
                    <div class="controls{{$errors->has('shipping_date')?' has-error':''}}">
                        <div class="input-prepend">
                            <div data-date="12-02-2012" class="input-append date datepicker">
                                <input type="text" name="shipping_date" id="shipping_date" data-date-format="yyyy-mm-dd"
                                    class="span11" style="width: 175px;" placeholder="yyyy-mm-dd">
                                <span class="add-on"><i class="icon-th"></i></span>
                            </div>
                        </div>
                        <span class="text-danger">{{$errors->first('shipping_date')}}</span>
                    </div>
                </div>
                <div class="control-group">
                    <label for="" class="control-label"></label>
                    <div class="controls">
                        <button type="submit" class="btn btn-warning">Edit Pengiriman</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
@section('jsblock')
<script src="{{asset('js/jquery.min.js')}}"></script>
<script src="{{asset('js/jquery.ui.custom.js')}}"></script>
<script src="{{asset('js/bootstrap.min.js')}}"></script>
<script src="{{asset('js/bootstrap-colorpicker.js')}}"></script>
<script src="{{asset('js/bootstrap-datepicker.js')}}"></script>
<script src="{{asset('js/jquery.toggle.buttons.js')}}"></script>
<script src="{{asset('js/masked.js')}}"></script>
<script src="{{asset('js/jquery.uniform.js')}}"></script>
<script src="{{asset('js/select2.min.js')}}"></script>
<script src="{{asset('js/matrix.js')}}"></script>
<script src="{{asset('js/matrix.form_common.js')}}"></script>
<script src="{{asset('js/wysihtml5-0.3.0.js')}}"></script>
<script src="{{asset('js/jquery.peity.min.js')}}"></script>
<script src="{{asset('js/bootstrap-wysihtml5.js')}}"></script>
<script>
    $('.textarea_editor').wysihtml5();
</script>
@endsection