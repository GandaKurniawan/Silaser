@extends('admin.layouts.master')
@section('title','Edit Kategori | SILASER - Sistem Informasi Penjualan dan Layanan Servis Laptop')
@section('content')
<div id="breadcrumb"> <a href="{{url('/admin')}}" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>
        Home</a> <a href="{{route('category.index')}}">Daftar Kategori</a> <a href="#" class="current">Edit Kategori</a>
</div>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <div class="widget-box">
                <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
                    <h5>Edit Kateogri</h5>
                </div>
                <div class="widget-content nopadding">
                    <form class="form-horizontal" method="post" action="{{route('category.update',$categories->id)}}"
                        name="basic_validate" id="basic_validate" novalidate="novalidate">
                        @csrf
                        {{method_field("PUT")}}
                        <div>
                            <label class="control-label">ID:</label>
                            <div class="controls">
                                <input type="text" name="id" id="id" value="{{$categories->id}}" readonly>
                            </div>
                        </div>
                        <div class="control-group{{$errors->has('name')?' has-error':''}}">
                            <label class="control-label">Nama Kategori:</label>
                            <div class="controls">
                                <input type="text" name="name" id="name" value="{{$categories->name}}" required>
                                <span class="text-danger" style="color: red;">{{$errors->first('name')}}</span>
                            </div>
                        </div>
                        <label for="control-label"></label>
                        <div class="controls">
                            <a href="{{url('/admin/category')}}"><button type="button"
                                    class="btn btn-info">Batal</button></a>
                            <input type="submit" value="Edit" class="btn btn-success">
                        </div>
                </div>
                <div class="control-group">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('jsblock')
<script src="{{ asset('js/jquery.min.js') }}"></script>
<script src="{{ asset('js/jquery.ui.custom.js') }}"></script>
<script src="{{ asset('js/bootstrap.min.js') }}"></script>
<script src="{{ asset('js/jquery.uniform.js') }}"></script>
<script src="{{ asset('js/select2.min.js') }}"></script>
<script src="{{ asset('js/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('js/jquery.validate.js') }}"></script>
<script src="{{ asset('js/matrix.js') }}"></script>
<script src="{{ asset('js/matrix.form_validation.js') }}"></script>
<script src="{{ asset('js/matrix.tables.js') }}"></script>
<script src="{{ asset('js/matrix.popover.js') }}"></script>
@endsection