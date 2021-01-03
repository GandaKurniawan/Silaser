<!--sidebar-menu-->
<div id="sidebar"><a href="{{url('/admin')}}" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
    <ul>
        <li{{$menu_active==1? ' class=active':''}}><a href="{{url('/admin')}}"><i class="icon icon-home"></i>
                <span>Dashboard</span></a> </li>
            <li class="submenu {{$menu_active==2? ' active':''}}"> <a href="#"><i class="icon icon-th-list"></i>
                    <span>Kategori</span></a>
                <ul>
                    <li><a href="{{url('/admin/category/create')}}">Tambah Kategori</a></li>
                    <li><a href="{{route('category.index')}}">Daftar Kategori</a></li>
                </ul>
            </li>
            <li class="submenu {{$menu_active==3? ' active':''}}"> <a href="#"><i class="icon icon-th-list"></i>
                    <span>Produk</span></a>
                <ul>
                    <li><a href="{{url('/admin/product/create')}}">Tambah Produk</a></li>
                    <li><a href="{{route('product.index')}}">Daftar Produk</a></li>
                </ul>
            </li>
            <li class="submenu {{$menu_active==4? ' active':''}}"> <a href="#"><i class="icon icon-th-list"></i>
                    <span>Detail Pemesanan</span></a>
                <ul>
                    <li><a href="{{url('admin/orders/belum-dibayar')}}">Belum Dibayar</a></li>
                    <li><a href="{{url('admin/orders/sedang-proses')}}">Sedang Proses</a></li>
                    <li><a href="{{url('admin/orders/sudah-selesai')}}">Sudah Selesai</a></li>
                </ul>
            </li>
            <li class="submenu {{$menu_active==5? ' active':''}}"> <a href="#"><i class="icon icon-th-list"></i>
                    <span>Kupon</span></a>
                <ul>
                    <li><a href="{{url('/admin/coupon/create')}}">Tambah Kupon</a></li>
                    <li><a href="{{route('coupon.index')}}">Daftar Kupon</a></li>
                </ul>
            </li>
            <li class="submenu {{$menu_active==6? ' active':''}}"> <a href="#"><i class="icon icon-th-list"></i>
                    <span>Konsultan</span></a>
                <ul>
                    <li><a href="{{url('/admin/konsultan/create')}}">Tambah Konsultan</a></li>
                    <li><a href="{{url('/admin/konsultan')}}">Daftar Konsultan</a></li>
                </ul>
            </li>
    </ul>
</div>
<!--sidebar-menu-->