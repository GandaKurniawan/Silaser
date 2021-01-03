@extends('pelanggan.layouts.master')
@section('title', 'Review Order Page')
@section('slider')
@endsection
@section('content')
    <div class="container">
        <div class="row">
            @foreach ($orders as $order)
                <div class="card" style="border-style: solid; border-width: thin; border-color: #FE980F; margin-bottom: 20px;">
                    <div style="margin-left: 10px;">
                        <h5 class="card-header">ID Pemesanan: #{{ $order->id }} ({{ $order->order_date }})</h5>
                        <div class="card-body">
                            <div class="row">
                                @foreach ($orderdetails as $orderdetail)
                                    @if ($orderdetail->orders_id == $order->id)
                                        <div class="col-sm-2">
                                            <div class="card" style="width: 18rem;">
                                                <img src="/products/small/{{ $orderdetail->image }}" style="width: 150px; height: 150px;">
                                                <div class="card-body">
                                                    <h5 class="card-title">{{ $orderdetail->p_name }}</h5>
                                                    <p class="card-text">Harga: Rp {{ @rupiah($orderdetail->price) }} <br>Jumlah: {{ $orderdetail->quantity }}</p>
                                                </div>
                                            </div>
                                        </div>
                                    @endif
                                @endforeach
                            </div>
                        </div>
                    </div>
                    <a href="#modalDetailOrder{{ $order->id }}" class="btn btn-primary" data-toggle="modal">Detail Pemesanan</a>
                </div>

                {{-- Modal Detail Order --}}
                <div class="modal fade" id="modalDetailOrder{{ $order->id }}" tabindex="-1" aria-labelledby="modalDetailOrderLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="modalStrukLabel">Detail Pemesanan #{{ $order->id }}</h4>
                            </div>
                            <div class="modal-body">
                                <h5><i class="fa fa-map-marker"></i> Alamat Pengiriman</h5>
                                <p style="text-align: justify">{{ $order->name }}<br>{{ $order->mobile }}<br>{{ $order->address }}<br>{{ $order->kelurahan }}, {{ $order->kecamatan }} {{ $order->postcode }}</p>
                                <br>
                                <h5><i class="fa fa-truck"></i> Jasa Ekspedisi</h5>
                                <p>{{ $order->expedition_name }}<br>{{ $order->type }} {{ $order->estimation }}</p>
                                <br>
                                <h5><i class="fa fa-money"></i> Informasi Pembayaran</h5>
                                <table class="table table-borderless">
                                    <tbody>
                                        <tr>
                                            <td>Sub Total:</td>
                                            <td>Rp {{ @rupiah($order->grand_total - $order->id + $order->coupon_amount - $order->shipping_charge) }}</td>
                                        </tr>
                                        <tr>
                                            <td>Ongkir:</td>
                                            <td>Rp {{ @rupiah($order->shipping_charge) }}</td>
                                        </tr>
                                        @if ($order->coupon_id != 0)
                                            <td>Kupon:</td>
                                            <td>- Rp {{ @rupiah($order->coupon_amount) }}</td>
                                        @endif
                                        <tr>
                                            <td>Kode Unik:</td>
                                            <td>Rp {{ @rupiah($order->id) }}</td>
                                        </tr>
                                        <tr>
                                            <td><b>Total:</b></td>
                                            <td><b>Rp {{ @rupiah($order->grand_total) }}</b></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                {{-- Enf Modal Detail order --}}
            @endforeach
        </div>
    </div>
@endsection
