@extends('admin.layouts.master')
@section('title','Edit Produk | SILASER - Sistem Informasi Penjualan dan Layanan Servis Laptop')
@section('content')
<div id="breadcrumb"> <a href="{{url('/admin')}}" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>
        Home</a> <a href="{{route('product.index')}}">Produk</a> <a href="#" class="current">Edit Produk</a> </div>
<div class="container-fluid">
    @if(Session::has('message'))
    <div class="alert alert-success text-center" role="alert">
        <strong>Well done! &nbsp;</strong>{{Session::get('message')}}
    </div>
    @endif
    <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
            <h5>Edit Produk</h5>
        </div>
        <div class="widget-content nopadding">
            <form action="{{route('product.update',$edit_product->id)}}" method="post" class="form-horizontal"
                enctype="multipart/form-data">
                @csrf
                {{method_field("PUT")}}
                <div class="control-group">
                    <label class="control-label">Select Category</label>
                    <div class="controls">
                        <select name="categories_id" style="width: 415px;">
                            <option value="{{$edit_product->categories_id}}">{{$edit_category->name}}</option>
                            @foreach($categories as $category)
                            <option value="{{$category->id}}">{{$category->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label for="p_name" class="control-label">Nama Produk</label>
                    <div class="controls{{$errors->has('p_name')?' has-error':''}}">
                        <input type="text" name="p_name" id="p_name" class="form-control"
                            value="{{$edit_product->p_name}}" title="" style="width: 400px;">
                        <span class="text-danger">{{$errors->first('p_name')}}</span>
                    </div>
                </div>
                <div class="control-group">
                    <label for="description" class="control-label">Deskripsi</label>
                    <div class="controls{{$errors->has('description')?' has-error':''}}">
                        <textarea class="textarea_editor span12" name="description" id="description" rows="6"
                            placeholder="Deskripsi Produk"
                            style="width: 580px;">{{$edit_product->description}}</textarea>
                        <span class="text-danger">{{$errors->first('description')}}</span>
                    </div>
                </div>
                <div class="control-group">
                    <label for="price" class="control-label">Harga</label>
                    <div class="controls{{$errors->has('price')?' has-error':''}}">
                        <div class="input-prepend"> <span class="add-on">Rp</span>
                            <input type="number" name="price" id="price" class="" value="{{$edit_product->price}}"
                                title="">
                            <span class="text-danger">{{$errors->first('price')}}</span>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <label for="stock" class="control-label">Berat (Gram)</label>
                    <div class="controls{{$errors->has('weight')?' has-error':''}}">
                        <div class="input-prepend"> <input type="number" name="weight" id="weight" class=""
                                value="{{$edit_product->weight}}" title="">
                            <span class="text-danger">{{$errors->first('weight')}}</span>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <label for="stock" class="control-label">Stok</label>
                    <div class="controls{{$errors->has('stock')?' has-error':''}}">
                        <div class="input-prepend"> <input type="number" name="stock" id="stock" class=""
                                value="{{$edit_product->stock}}" title="">
                            <span class="text-danger">{{$errors->first('stock')}}</span>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Upload Gambar</label>
                    <div class="controls">
                        <input type="file" name="image" id="image" accept="image/jpeg" />
                        <span class="text-danger">{{$errors->first('image')}}</span>
                        @if($edit_product->image!='')
                        &nbsp;&nbsp;&nbsp;
                        <a href="javascript:" rel="{{$edit_product->id}}" rel1="delete-image"
                            class="btn btn-danger btn-mini deleteRecord">Delete Old Gambar</a>
                        <img src="{{url('products/small/',$edit_product->image)}}" width="35" alt="">
                        @endif
                    </div>
                </div>
                <div class="control-group">
                    <label for="" class="control-label"></label>
                    <div class="controls">
                        <a href="{{url('/admin/product')}}"><button type="button"
                                class="btn btn-info">Batal</button></a>
                        <button type="submit" class="btn btn-success">Edit</button>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script>
    $(".deleteRecord").click(function() {
        var id = $(this).attr('rel');
        var deleteFunction = $(this).attr('rel1');
        swal({
            title: 'Apakah kamu yakin akan menghapus produk?',
            text: "Tindakan tidak dapat dikembalikan",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#da4f49',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Oke',
            cancelButtonText: 'Batal',
            confirmButtonClass: 'btn btn-success',
            cancelButtonClass: 'btn btn-danger',
            buttonsStyling: false,
            reverseButtons: true
        }, function() {
            window.location.href = "/admin/" + deleteFunction + "/" + id;
        });
    });
    $('.textarea_editor').wysihtml5();
</script>
@endsection