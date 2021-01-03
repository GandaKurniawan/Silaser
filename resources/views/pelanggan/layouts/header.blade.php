<header id="header">
    <!--header-->
    <div class="header_top">
        <!--header_top-->
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a>SILASER - Sistem Informasi Penjualan dan Layanan Konsultasi Laptop Jember</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="social-icons pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="https://github.com/DandySW/silaser-trplb2020"><i class="fa fa-github"></i></a>
                            </li>
                            <li><a href="https://trello.com/b/ksICDmw2/ppl-d-kelas-a"><i class="fa fa-trello"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/header_top-->

    <div class="header-middle">
        <!--header-middle-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo pull-left">
                        <a href="{{ url('/') }}"><img src="{{ asset('pelanggan/images/home/logo.png') }}" alt="" /></a>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="shop-menu pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="{{ url('/viewcart') }}"><i class="fa fa-shopping-cart"></i> Keranjang</a></li>
                            @if (Auth::check())
                            <li><a href="{{ url('/myaccount') }}"><i class="fa fa-user"></i> Edit Profil</a></li>
                            <li><a href="{{ url('/logout') }}"><i class="fa fa-lock"></i> Logout </a>
                            </li>
                            @else
                            <li><a href="{{ url('/login') }}"><i class="fa fa-lock"></i> Login/Register</a></li>
                            @endif
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/header-middle-->

    <div class="header-bottom">
        <!--header-bottom-->
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><a href="{{ url('/') }}" class="active">Home</a></li>
                            <li class="dropdown"><a href="#">Detail Pemesanan<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="{{ url('/orders/belum-dibayar') }}">Belum Dibayar</a></li>
                                    <li><a href="{{ url('/orders/sedang-proses') }}">Sedang Proses</a></li>
                                    <li><a href="{{ url('/orders/sudah-selesai') }}">Sudah Selesai</a></li>
                                </ul>
                            </li>
                            <li><a href="{{ url('/payment') }}">Cara Pembayaran</a></li>
                            <li><a href="{{ url('/chat-consultant') }}">Jasa Konsultasi</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/header-bottom-->
</header>
<!--/header-->