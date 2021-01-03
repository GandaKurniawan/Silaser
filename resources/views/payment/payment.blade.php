@extends('pelanggan.layouts.master')
@section('title','Review Order Page')
@section('slider')
@endsection
@section('content')
<div class="container">

    @yield('order user')

    <div class="row" style="margin-left: 60px;">
        <div class="col-md-4" style="margin-bottom: 20px;">
            <div class="card">
                <img src="/pelanggan/images/payment/gopay.png" class="card-img-top" alt="gopay"
                    style="margin-bottom: 5px;">
                <div class="card-body" style="width: 286px; text-align: justify;">
                    <table class="table table-borderless">
                        <thead>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">E-Wallet:</th>
                                <td>Gopay</td>
                            </tr>
                            <tr>
                                <th scope="row">Nomor:</th>
                                <td>0824 1010 1001</td>
                            </tr>
                            <tr>
                                <th scope="row">Atas Nama:</th>
                                <td>Endah Safitri</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-4" style="margin-bottom: 20px;">
            <div class="card">
                <img src="/pelanggan/images/payment/ovo.png" class="card-img-top" alt="ovo" style="margin-bottom: 5px;">
                <div class="card-body" style="width: 286px; text-align: justify;">
                    <table class="table table-borderless">
                        <thead>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">E-Wallet:</th>
                                <td>Ovo</td>
                            </tr>
                            <tr>
                                <th scope="row">Nomor:</th>
                                <td>0824 1010 1001</td>
                            </tr>
                            <tr>
                                <th scope="row">Atas Nama:</th>
                                <td>Endah Safitri</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-4" style="margin-bottom: 20px;">
            <div class="card">
                <img src="/pelanggan/images/payment/dana.png" class="card-img-top" alt="dana"
                    style="margin-bottom: 5px;">
                <div class="card-body" style="width: 286px; text-align: justify;">
                    <table class="table table-borderless">
                        <thead>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">E-Wallet:</th>
                                <td>Dana</td>
                            </tr>
                            <tr>
                                <th scope="row">Nomor:</th>
                                <td>0811 0302 9452</td>
                            </tr>
                            <tr>
                                <th scope="row">Atas Nama:</th>
                                <td>Nadia Tsalis</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-4" style="margin-bottom: 10px;">
            <div class="card">
                <img src="/pelanggan/images/payment/bni.png" class="card-img-top" alt="bni" style="margin-bottom: 5px;">
                <div class="card-body" style="width: 286px; text-align: justify;">
                    <table class="table table-borderless">
                        <thead>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">Bank:</th>
                                <td>BNI</td>
                            </tr>
                            <tr>
                                <th scope="row">Nomor:</th>
                                <td>079 630 4321</td>
                            </tr>
                            <tr>
                                <th scope="row">Atas Nama:</th>
                                <td>Endah Safitri</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-4" style="margin-bottom: 10px;">
            <div class="card">
                <img src="/pelanggan/images/payment/bri.png" class="card-img-top" alt="bri" style="margin-bottom: 5px;">
                <div class="card-body" style="width: 286px; text-align: justify;">
                    <table class="table table-borderless">
                        <thead>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">Bank:</th>
                                <td>BRI</td>
                            </tr>
                            <tr>
                                <th scope="row">Nomor:</th>
                                <td>6785 0102 8883 537</td>
                            </tr>
                            <tr>
                                <th scope="row">Atas Nama:</th>
                                <td>Nadia Tsalis</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-4" style="margin-bottom: 10px;">
            <div class="card">
                <img src="/pelanggan/images/payment/mandiri.png" class="card-img-top" alt="mandiri"
                    style="margin-bottom: 5px;">
                <div class="card-body" style="width: 286px; text-align: justify;">
                    <table class="table table-borderless">
                        <thead>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">Bank:</th>
                                <td>Mandiri</td>
                            </tr>
                            <tr>
                                <th scope="row">Nomor:</th>
                                <td>1800 0042 93561</td>
                            </tr>
                            <tr>
                                <th scope="row">Atas Nama:</th>
                                <td>Nadia Tsalis</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection