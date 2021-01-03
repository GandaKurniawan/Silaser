@extends('admin.layouts.master')
@section('title','List Coupons')
@section('content')
<div id="breadcrumb"> <a href="{{url('/admin')}}" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>
        Home</a> <a href="{{route('coupon.index')}}" class="current">Kupon</a></div>
<div class="container-fluid">
    @if(Session::has('message'))
    <div class="alert alert-success text-center" role="alert">
        <strong>Well done!</strong> {{Session::get('message')}}
    </div>
    @endif
    <div class="widget-box">
        <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Daftar Kupon</h5>
        </div>
        <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>ID</th>
                        <th>Kode Kupon</th>
                        <th>jumlah</th>
                        <th>Tipe Kupon</th>
                        <th>Tanggal Kadaluarsa</th>
                        <th>Status</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($coupons as $coupon)
                    <tr class="gradeC">
                        <td style="text-align: center; vertical-align: middle;">{{$loop->iteration}}</td>
                        <td style="text-align: center; vertical-align: middle;">{{$coupon->id}}</td>
                        <td style="vertical-align: middle;">{{$coupon->coupon_code}}</td>
                        <td style="text-align: center; vertical-align: middle;">{{$coupon->amount}}</td>
                        <td style="text-align: center; vertical-align: middle;">{{$coupon->amount_type}}</td>
                        <td style="text-align: center; vertical-align: middle;">{{$coupon->expiry_date}}</td>
                        <td style="text-align: center; vertical-align: middle;">
                            {{$coupon->status==1?'Aktif':'Tidak Aktif'}}
                        </td>
                        <td style="text-align: center; vertical-align: middle;">
                            <a href="{{route('coupon.edit',$coupon->id)}}" class="btn btn-primary btn-mini">Edit Data
                                Kupon</a>
                            {{-- <a href="javascript:" rel="{{$coupon->id}}" rel1="delete-coupon" class="btn btn-danger
                            btn-mini deleteRecord">Delete</a> --}}
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
<script src="{{asset('js/matrix.popover.js')}}"></script>
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