@extends('layouts.chat')

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4">
            <div class="user-wrapper">
                <ul class="users">
                    @foreach($users as $user)
                    <li class="user" id="{{ $user->id }}">
                        {{--will show unread count notification--}}
                        @if($user->unread)
                        <span class="pending">{{ $user->unread }}</span>
                        @endif

                        <div class="media">
                            <div class="media-left">
                                {{-- <img src="https://loremflickr.com/150/150" alt="user" class="media-object"> --}}
                            </div>

                            <div class="media-body">
                                <p class="name">{{ $user->name }}</p>
                                <p class="email">{{ $user->email }}</p>
                                {{-- <a href="#konsultanModal" data-toggle="modal" data-target="#konsultanModal">Lihat Data
                                    Konsultan</a> --}}
                            </div>
                        </div>
                    </li>

                    {{-- Konsultan Modal --}}
                    <div class="modal fade" id="konsultanModal" tabindex="-1" aria-labelledby="konsultanModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="konsultanModalLabel">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    ...
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    @endforeach
                </ul>
            </div>
        </div>

        <div class="col-md-8" id="messages">

        </div>
    </div>
</div>
@endsection