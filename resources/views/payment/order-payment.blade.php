@extends('payment.payment')
@section('title','Order Payment')
@section('slider')
@endsection
@section('order user')
<h3 class="text-center">PESANAN ANDA TELAH KAMI TERIMA</h3>
<p class="text-center">Terimakasih telah memesan produk di toko kami. Silahkan lakukan pembayaran agar pesanan anda dapat segera kami proses.</p>
<div style="margin-bottom: 20px;"></div>

<div class="card" style="margin-right: 100px; margin-left: 100px;">
    <ul class="list-group list-group-flush">
        <li class="list-group-item">ID Order: <b>#{{$user_order->id}}</b></li>
        <li class="list-group-item">Nama Pelanggan: <b>{{$user->name}}</b></li>
        <li class="list-group-item">Produk dipesan: @foreach($order_detail as $detail)
            @if($detail->orders_id == $user_order->id)
            <b> {{$detail->p_name}} ({{$detail->quantity}}) </b>;
            @endif
            @endforeach</li>
        <li class="list-group-item">Total: <b>Rp {{@rupiah($user_order->grand_total)}}</b></li>
    </ul>
</div>
@endsection