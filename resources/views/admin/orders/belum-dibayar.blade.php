@extends('admin.layouts.master')
@section('title','Data Produk | Sistem Informasi Penjualan dan Layanan Servis Laptop ')
@section('content')
<div id="breadcrumb"> <a href="{{url('/admin')}}" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>
        Home</a> <a href="#">Detail Pemesanan</a> <a href="{{url('admin/orders/belum-dibayar')}}" class="current">Belum
        Dibayar</a> </div>
<div class="container-fluid">
    @if(Session::has('message'))
    <div class="alert alert-success text-center" role="alert">
        <strong>Well done!</strong> {{Session::get('message')}}
    </div>
    @endif
    <div class="widget-box">
        <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Belum Dibayar</h5>
        </div>
        <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>ID</th>
                        <th>Pelanggan</th>
                        <th>ID Ekspedisi</th>
                        <th>Ongkir</th>
                        <th>ID Kupon</th>
                        <th>Nilai Kupon</th>
                        <th>Total</th>
                        <th>Tanggal Pemesanan</th>
                        <th>Status Pembayaran</th>
                        <th>Bukti Pembayaran</th>
                        <th>Pembayaran</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($orders as $order)
                    <tr class="gradeC">
                        <td style="vertical-align: middle;text-align: center;">{{$loop->iteration}}</td>
                        <td style="text-align: center; vertical-align: middle;">
                            <a href="#modalDetail{{$order->id}}" data-toggle="modal"
                                class="btn btn-default btn-mini">{{$order->id}}</a>
                        </td>
                        <td style="vertical-align: middle;">{{$order->name}}</td>
                        <td style="vertical-align: middle;text-align: center;">{{$order->expedition}}</td>
                        <td style="vertical-align: middle;">Rp {{@rupiah($order->shipping_charge)}}</td>
                        <td style="vertical-align: middle;text-align: center;">{{$order->coupon_id}}</td>
                        <td style="vertical-align: middle;text-align: center;">Rp {{@rupiah($order->coupon_amount)}}
                        </td>
                        <td style="vertical-align: middle;text-align: center;">Rp {{@rupiah($order->grand_total)}}</td>
                        <td style="vertical-align: middle;text-align: center;">{{$order->order_date}}</td>
                        <td style="vertical-align: middle;text-align: center;">{{$order->checkout_status}}</td>
                        <td style="text-align: center; vertical-align: middle;">
                            <a href="#modalStruk{{$order->id}}" data-toggle="modal"
                                class="btn btn-info btn-mini">View</a>
                        </td>
                        <td style="text-align: center; vertical-align: middle;">
                            <a href="{{route('pembayaran',$order->id)}}" class="btn btn-warning btn-mini">Konfirmasi
                                Pembayaran</a>
                        </td>
                    </tr>
                    {{--Pop Up Model for View Struk--}}
                    <div id="modalStruk{{$order->id}}" class="modal hide">
                        <div class="modal-header">
                            <button data-dismiss="modal" class="close" type="button">×</button>
                        </div>
                        <div class="modal-body">
                            <div class="text-center"><img src="{{url('/checkout',$order->struk)}}"
                                    alt="Belum ada bukti pembayaran"></div>
                        </div>
                    </div>
                    {{--Pop Up Model for View Struk--}}

                    {{--Pop Up Model for Order Detail--}}
                    <div id="modalDetail{{$order->id}}" class="modal hide">
                        <div class="modal-header">
                            <button data-dismiss="modal" class="close" type="button">×</button>
                        </div>
                        <div class="modal-body">
                            <div class="text-center">
                                <h5>Order Details: Order #{{$order->id}}</h5>
                                ===================================================================
                                <h6 class="text-left">Produk yang dipesan</h6>
                                <ol>
                                    @foreach($orderdetails as $orderdetail)
                                    @if($orderdetail->orders_id == $order->id)
                                    <li class="text-left">{{$orderdetail->p_name}}: {{$orderdetail->quantity}}</li>
                                    @endif
                                    @endforeach
                                </ol>
                                <br>
                                <h6 class="text-left">Detail Pelanggan</h6>
                                <ul>
                                    <li class="text-left">Nama Pelanggan: {{$order->name}}</li>
                                    <li class="text-left">Alamat: {{$order->address}}</li>
                                    <li class="text-left">Kelurahan: {{$order->kelurahan}}</li>
                                    <li class="text-left">Kecamatan: {{$order->kecamatan}}</li>
                                    <li class="text-left">Kode Pos: {{$order->postcode}}</li>
                                    <li class="text-left">Handphone: {{$order->mobile}}</li>
                                </ul>
                                <br>
                                <h6 class="text-left">Jasa Ekspedisi</h6>
                                <ul>
                                    <li class="text-left">Nama Ekspedisi: {{$order->expedition_name}}</li>
                                    <li class="text-left">Tipe: {{$order->type}}</li>
                                    <li class="text-left">Estimasi: {{$order->estimation}}</li>
                                </ul>
                                <br>
                                @if($order->coupon_id != 0)
                                <h6 class="text-left">Kupon</h6>
                                @foreach($coupons as $coupon)
                                @if($order->coupon_id == $coupon->id)
                                <p class="text-left">Kode Kupon: {{$coupon->coupon_code}}</p>
                                @break
                                @endif
                                @endforeach
                                @else
                                <h6 class="text-left">Kupon</h6>
                                <p class="text-left">Tidak ada Kupon</p>
                                @endif
                            </div>
                        </div>
                    </div>
                    {{--Pop Up Model for Order Detail--}}
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
@endsection