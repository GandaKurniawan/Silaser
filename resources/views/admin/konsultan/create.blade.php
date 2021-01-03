@extends('admin.layouts.master')
@section('title','Add Category')
@section('content')
<div id="breadcrumb"> <a href="{{url('/admin')}}" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>
        Home</a> <a href="{{route('category.index')}}">Daftar Kategori</a> <a href="{{route('category.create')}}"
        class="current">Tambah Kategori</a> </div>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <div class="widget-box">
                <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
                    <h5>Tambah Konsultan</h5>
                </div>
                <div class="widget-content nopadding">
                    <form class="form-horizontal" method="post" action="{{url('admin/konsultan')}}"
                        name="basic_validate" id="basic_validate" novalidate="novalidate">
                        @csrf
                        <div class="control-group{{$errors->has('name')?' has-error':''}}">
                            <label class="control-label">Nama Konsultan:</label>
                            <div class="controls">
                                <input type="text" name="name" id="name" value="{{old('name')}}" required>
                                <span class="text-danger" id="name"
                                    style="color: red;">{{$errors->first('name')}}</span>
                            </div>
                        </div>
                        <div class="control-group{{$errors->has('email')?' has-error':''}}">
                            <label class="control-label">Email:</label>
                            <div class="controls">
                                <input type="email" name="email" id="email" value="{{old('email')}}" required>
                                <span class="text-danger" id="email"
                                    style="color: red;">{{$errors->first('email')}}</span>
                            </div>
                        </div>
                        <div class="control-group{{$errors->has('password')?' has-error':''}}">
                            <label class="control-label">Password (<i> secret </i>):</label>
                            <div class="controls">
                                <input type="password" name="password" id="password" value="secret" required>
                                <span class="text-danger" id="password"
                                    style="color: red;">{{$errors->first('password')}}</span>
                            </div>
                        </div>
                        <input type="hidden" name="status" value="2">
                        <div class="control-group">
                            <label for="control-label"></label>
                            <div class="controls">
                                <input type="submit" value="Buat" class="btn btn-success">
                            </div>
                        </div>
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