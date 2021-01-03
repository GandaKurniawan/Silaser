@extends('admin.layouts.master')
@section('title','Data Produk | Sistem Informasi Penjualan dan Layanan Servis Laptop ')
@section('content')
<div id="breadcrumb"> <a href="{{url('/admin')}}" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>
        Home</a> <a href="#">Detail Pemesanan</a> <a href="{{url('admin/orders/sedang-proses')}}" class="current">Sedang
        Proses</a> </div>
<div class="container-fluid">
    @if(Session::has('message'))
    <div class="alert alert-success text-center" role="alert">
        <strong>Well done!</strong> {{Session::get('message')}}
    </div>
    @endif
    <div class="widget-box">
        <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Sedang Proses</h5>
        </div>
        <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>ID</th>
                        <th>Pelanggan</th>
                        <th>Tanggal Pemesanan</th>
                        <th>Bukti Pembayaran</th>
                        <th>No. Resi</th>
                        <th>Status Pengiriman</th>
                        <th>Tanggal Pengiriman</th>
                        <th>Status Penerimaan</th>
                        <th>Pengiriman</th>
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
                        <td style="vertical-align: middle;text-align: center;">{{$order->order_date}}</td>
                        <td style="text-align: center; vertical-align: middle;">
                            <a href="#modalStruk{{$order->id}}" data-toggle="modal"
                                class="btn btn-info btn-mini">View</a>
                        </td>
                        <td style="text-align: center; vertical-align: middle;">
                            <a href="#modalResi{{$order->id}}" data-toggle="modal"
                                class="btn btn-info btn-mini">View</a>
                        </td>
                        <td style="vertical-align: middle;text-align: center;">{{$order->shipping_status}}</td>
                        <td style="vertical-align: middle;text-align: center;">{{$order->shipping_date}}</td>
                        <td style="vertical-align: middle;text-align: center;">{{$order->receipt_status}}</td>
                        @if ($order->shipping_status!="sudah dikirim")
                        <td style="text-align: center; vertical-align: middle;">
                            <a href="{{url('admin/orders/create-pengiriman/'.$order->id)}}"
                                class="btn btn-warning btn-mini">Konfirmasi Pengiriman</a>
                        </td>
                        @else
                        <td style="text-align: center; vertical-align: middle;">
                        </td>
                        @endif

                    </tr>
                    {{--Pop Up Model for View Struk--}}
                    <div id="modalStruk{{$order->id}}" class="modal hide">
                        <div class="modal-header">
                            <button data-dismiss="modal" class="close" type="button">×</button>
                        </div>
                        <div class="modal-body">
                            <div class="text-center"><img src="{{url('/checkout/'.$order->struk)}}"
                                    alt="Belum ada bukti pembayaran"></div>
                        </div>
                    </div>
                    {{--Pop Up Model for View Struk--}}

                    {{--Pop Up Model for View Resi--}}
                    <div id="modalResi{{$order->id}}" class="modal hide">
                        <div class="modal-header">
                            <button data-dismiss="modal" class="close" type="button">×</button>
                        </div>
                        <div class="modal-body">
                            <div class="text-center">
                                <p><b>No Resi: </b>{{$order->resi}}</p>
                            </div>
                        </div>
                    </div>
                    {{--Pop Up Model for View Resi--}}

                    <!-- {{--Pop Up Model for View Pengiriman--}}
                    <div id="modalPengiriman{{$order->id}}" class="modal hide">
                        <div class="modal-header">
                            <button data-dismiss="modal" class="close" type="button">×</button>
                        </div>
                        <div class="modal-body">
                            <div class="text-center">
                                <h5>Order Details: Order #{{$order->id}}</h5>
                                ===================================================================
                                <form action="{{route('pengiriman',$order->id)}}" method="POST">
                                    @csrf
                                    <input type="hidden" name="shipping_status" value="sudah dikirim">
                                    <div class="control-group">
                                        <label for="expiry_date" class="control-label">Tanggal Kadaluarsa</label>
                                        <div class="controls{{$errors->has('expiry_date')?' has-error':''}}">
                                            <div class="input-prepend">
                                                <div data-date="12-02-2012" class="input-append date datepicker">
                                                    <input type="text" name="expiry_date" id="expiry_date" value="{{old('expiry_date')}}" data-date-format="yyyy-mm-dd" class="span11" style="width: 375px;" placeholder="yyyy-mm-dd">
                                                    <span class="add-on"><i class="icon-th"></i></span>
                                                </div>
                                            </div>
                                            <span class="text-danger">{{$errors->first('expiry_date')}}</span>
                                        </div>
                                    </div>


                                    <label class="control-label">No Resi:
                                        <input type="text" name="resi" placeholder="No Resi" required>
                                        <span class="text-danger" style="color: red;">{{$errors->first('resi')}}</span>
                                    </label>
                                    <button type="submit" class="btn btn-warning">Konfirmasi Pengiriman</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    {{--Pop Up Model for View Pengiriman--}} -->

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
<script src="{{asset('js/bootstrap-datepicker.js')}}"></script>
<script src="{{asset('js/jquery.uniform.js')}}"></script>
<script src="{{asset('js/select2.min.js')}}"></script>
<script src="{{asset('js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('js/matrix.js')}}"></script>
<script src="{{asset('js/matrix.tables.js')}}"></script>
<script src="{{asset('js/matrix.popover.js')}}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
@endsection