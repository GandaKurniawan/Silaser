@extends('admin.layouts.master')
@section('title','Add Products Page')
@section('content')
<div id="breadcrumb"> <a href="{{url('/admin')}}" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>
        Home</a> <a href="{{route('product.index')}}">Produk</a> <a href="{{route('product.create')}}"
        class="current">Tambah Produk</a> </div>
<div class="container-fluid">
    @if(Session::has('message'))
    <div class="alert alert-success text-center" role="alert">
        <strong>Well done! &nbsp;</strong>{{Session::get('message')}}
    </div>
    @endif
    <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
            <h5>Tambah Produk</h5>
        </div>
        <div class="widget-content nopadding">
            <form action="{{route('product.store')}}" method="post" class="form-horizontal"
                enctype="multipart/form-data">
                @csrf
                <div class="control-group">
                    <label class="control-label">Kategori Produk</label>
                    <div class="controls">
                        <select name="categories_id" style="width: 415px;">
                            <option selected>Pilih Kategori</option>
                            @foreach($categories as $category)
                            <option value="{{$category->id}}">{{$category->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label for="p_name" class="control-label">Nama Produk</label>
                    <div class="controls{{$errors->has('p_name')?' has-error':''}}">
                        <input type="text" name="p_name" id="p_name" class="form-control" value="{{old('p_name')}}"
                            title="" placeholder="Nama Produk" style="width: 400px;">
                        <span class="text-danger">{{$errors->first('p_name')}}</span>
                    </div>
                </div>
                <div class="control-group">
                    <label for="description" class="control-label">Deskripsi</label>
                    <div class="controls{{$errors->has('description')?' has-error':''}}">
                        <textarea class="textarea_editor span12" name="description" id="description" rows="6"
                            placeholder="Deskripsi Produk" style="width: 580px;">{{old('description')}}</textarea>
                        <span class="text-danger">{{$errors->first('description')}}</span>
                    </div>
                </div>
                <div class="control-group">
                    <label for="price" class="control-label">Harga</label>
                    <div class="controls{{$errors->has('price')?' has-error':''}}">
                        <div class="input-prepend"> <span class="add-on">Rp</span>
                            <input type="number" name="price" id="price" class="" value="{{old('price')}}" title=""
                                placeholder="Harga Produk">
                            <span class="text-danger">{{$errors->first('price')}}</span>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <label for="stock" class="control-label">Stok</label>
                    <div class="controls{{$errors->has('stock')?' has-error':''}}">
                        <input type="text" name="stock" id="stock" class="form-control" value="{{old('stock')}}"
                            placeholder="Stok" title="" style="width: 400px;">
                        <span class="text-danger">{{$errors->first('stock')}}</span>
                    </div>
                </div>
                <div class="control-group">
                    <label for="weight" class="control-label">Berat (Gram)</label>
                    <div class="controls{{$errors->has('weight')?' has-error':''}}">
                        <input type="text" name="weight" id="weight" class="form-control" value="{{old('weight')}}"
                            placeholder="Berat (Gram)" title="" style="width: 400px;">
                        <span class="text-danger">{{$errors->first('weight')}}</span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Upload Gambar</label>
                    <div class="controls">
                        <input type="file" name="image" id="image" />
                        <span class="text-danger">{{$errors->first('image')}}</span>
                    </div>
                </div>
                <div class="control-group">
                    <label for="" class="control-label"></label>
                    <div class="controls">
                        <a href="{{url('/admin/product')}}"><button type="button"
                                class="btn btn-info">Batal</button></a>
                        <button type="submit" class="btn btn-success">Tambah
                        </button>
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