<!--sidebar-menu-->
<div id="sidebar"><a href="{{url('/konsultan')}}" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
    <ul>
        <li{{$menu_active==1? ' class=active':''}}><a href="{{url('/konsultan')}}"><i class="icon icon-home"></i>
                <span>Dashboard</span></a> </li>
            <li> <a href="{{url('/konsultan/chat')}}"><i class="icon icon-th-list"></i>
                    <span>Konsultasi</span></a>
            </li>
    </ul>
</div>
<!--sidebar-menu-->