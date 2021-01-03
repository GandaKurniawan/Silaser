@extends('admin.layouts.master')
@section('title','Daftar Kategori | SILASER - Sistem Informasi Penjualan dan Layanan Servis Laptop ')
@section('content')
<div id="breadcrumb"> <a href="{{url('/admin')}}" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>
        Home</a> <a href="{{route('category.index')}}" class="current">Daftar Kategori</a></div>
<div class="container-fluid">
    @if(Session::has('message'))
    <div class="alert alert-success text-center" role="alert">
        <strong>Well done!</strong> {{Session::get('message')}}
    </div>
    @endif
    <div class="widget-box">
        <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Daftar Kategori</h5>
        </div>
        <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>ID</th>
                        <th>Nama Kategori</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($categories as $category)
                    <tr class="gradeC">
                        <td style="text-align: center" ;>{{$loop->iteration}}</td>
                        <td style="text-align: center" ;>{{$category->id}}</td>
                        <td>{{$category->name}}</td>
                        <td style=" text-align: center;">
                            <a href="{{route('category.edit',$category->id)}}" class="btn btn-primary btn-mini">Edit
                                Data Kategori</a>
                            {{-- <a href="javascript:" rel="{{$category->id}}" rel1="delete-category" class="btn
                            btn-danger btn-mini deleteRecord">Delete</a> --}}
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
@section('jsblock')
<script src="{{asset('js/jquery.min.js')}}"></script>
<script src="{{asset('js/jquery.ui.custom.js')}}"></script>
<script src="{{asset('js/bootstrap.min.js')}}"></script>
<script src="{{asset('js/jquery.uniform.js')}}"></script>
<script src="{{asset('js/select2.min.js')}}"></script>
<script src="{{asset('js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('js/matrix.js')}}"></script>
<script src="{{asset('js/matrix.tables.js')}}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script>
    $(".deleteRecord").click(function() {
        var id = $(this).attr('rel');
        var deleteFunction = $(this).attr('rel1');
        swal({
            title: 'Apakah kamu yakin akan menghapus kategori?',
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
</script>
@endsection