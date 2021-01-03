@extends('konsultan.layouts.master')
@section('title','Dashboard')
@section('content')
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <div class="widget-box">
                @if(Session::has('message'))
                <h5 class="text-danger" style="color: #0e90d2;">{{Session::get('message')}}</h5>
                @endif
                <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
                    <h5>My Profile</h5>
                </div>
                <div class="widget-content nopadding">
                    <form class="form-horizontal" name=" password_validate" id="password_validate"
                        novalidate="novalidate">
                        <div class="control-group">
                            <label class="control-label">Email</label>
                            <div class="controls">
                                <input type="text" value="{{ $user->email }}" disabled />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Nama</label>
                            <div class="controls">
                                <input type="text" value="{{ $user->name }}" disabled />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Password</label>
                            <div class="controls">
                                <input type="text" value="******" disabled />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Alamat</label>
                            <div class="controls">
                                <input type="text" value="{{ $user->address }}" disabled />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Kelurahan</label>
                            <div class="controls">
                                <input type="text" value="{{ $user->kelurahan }}" disabled />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Kecamatan</label>
                            <div class="controls">
                                <input type="text" value="{{ $user->kecamatan }}" disabled />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Kota</label>
                            <div class="controls">
                                <input type="text" value="Jember" disabled />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Kode Pos</label>
                            <div class="controls">
                                <input type="text" value="{{ $user->postcode }}" disabled />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">No Handphone</label>
                            <div class="controls">
                                <input type="text" value="{{ $user->mobile }}" disabled />
                            </div>
                        </div>
                        <div class="form-actions">
                            <a href="{{ url('konsultan/edit-profile') }}"><input type="buttin" value="Edit Profile"
                                    class="btn btn-success"></a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('jsblock')
<script src="{{ asset('js/jquery.min.js') }}"></script>
<script src="{{ asset('js/jquery.ui.custom.js') }}"></script>
<script src="{{ asset('js/bootstrap.min.js') }}"></script>
<script src="{{ asset('js/jquery.uniform.js') }}"></script>
<script src="{{ asset('js/select2.min.js') }}"></script>
<script src="{{ asset('js/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('js/jquery.validate.js') }}"></script>
<script src="{{ asset('js/matrix.js') }}"></script>
<script src="{{ asset('js/matrix.form_validation.js') }}"></script>
<script src="{{ asset('js/matrix.tables.js') }}"></script>
<script src="{{ asset('js/matrix.popover.js') }}"></script>
@endsection