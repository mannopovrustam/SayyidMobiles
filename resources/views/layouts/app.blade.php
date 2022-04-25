<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>{{ config('app.name', 'Laravel') }}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Учись умнее, а не усерднее. Sayyid Mobiles - это революционная платформа медицинского обучения, призванная помочь будущим врачам успешно сдать экзамены USMLE." name="description" />
    <meta content="Sayyid Mobiles" name="author" />
    <link rel="shortcut icon" href="{{ asset('/assets/images/favicon.ico') }}">
    @include('layouts.simple.css')
    @yield('style')
    @trixassets
    @livewireStyles
    @stack('styles')
</head>
<body>
<div id="preloader">
    <div id="status">
        <div class="spinner">
            <i class="uil-shutter-alt spin-icon"></i>
        </div>
    </div>
</div>

<div id="layout-wrapper">
    @include('layouts.simple.header')
    @include('layouts.simple.sidebar')
    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">
                @if(session()->get('error'))
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        {{ session()->get('error') }}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
                        </button>
                    </div>
                @endif
                {{--<div class="row">--}}
                    {{--<div class="col-12">--}}
                        {{--<div class="page-title-box d-flex align-items-center justify-content-between">--}}
                            {{--<div class="container-fluid">--}}
                                {{--<div class="row">--}}
                                    {{--<div class="col-lg-12">--}}
                                        {{--@yield('breadcrumb-title')--}}
                                    {{--</div>--}}
                                {{--</div>--}}
                            {{--</div>--}}
                            {{--<div class="page-title-right">--}}
                                {{--<ol class="breadcrumb m-0">--}}
                                    {{--<div class="container-fluid">--}}
                                        {{--<div class="row">--}}
                                            {{--<div class="col-lg-12">--}}
                                                {{--@yield('breadcrumb-items')--}}
                                            {{--</div>--}}
                                        {{--</div>--}}
                                    {{--</div>--}}
                                {{--</ol>--}}
                            {{--</div>--}}
                        {{--</div>--}}
                    {{--</div>--}}
                {{--</div>--}}
                <div class="row">
                    <div class="col-12">
                        @if(session()->get('stock') == 0)
                        <div id="free_trial" class="modal fade show" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-modal="true"
                             style="display: block; background: #000000aa">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="myModalLabel"><strong>Bildirishnoma</strong></h5>
                                        <button class="btn btn-sm btn-soft-default" style="position: absolute; left: 75%"
                                           onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                            <i class="uil uil-sign-out-alt font-size-18 align-middle me-1 text-muted"></i> <span
                                                    class="align-middle">Chiqish</span></button>

                                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                            {{ csrf_field() }}
                                        </form>

                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-xl-12">
                                                Siz bironta omborga biriktirilmagansiz!
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endif

                        {{ isset($slot) ? $slot : ''}}
                        @yield('content')
                    </div>
                </div>
            </div>
        </div>
        @include('layouts.simple.footer')
    </div>
</div>
<div class="right-bar">
    <div data-simplebar class="h-100">
        <div class="rightbar-title d-flex align-items-center px-3 py-4">
            <h5 class="m-0 me-2">Выберите тему</h5>
            <a href="javascript:void(0);" class="right-bar-toggle ms-auto">
                <i class="mdi mdi-close noti-icon"></i>
            </a>
        </div>
        <hr class="mt-0" />
        <div class="p-4">
            <div class="mb-2">
                <img src="{{ asset('assets/images/layouts/layout-1.jpg') }}" class="img-thumbnail" alt="layout images">
            </div>
            <div class="form-check form-switch mb-3">
                <input type="checkbox" class="form-check-input theme-choice" id="light-mode-switch" checked />
                <label class="form-check-label" for="light-mode-switch">Дневной</label>
            </div>
            <div class="mb-2">
                <img src="{{ asset('assets/images/layouts/layout-2.jpg') }}" class="img-thumbnail" alt="layout images">
            </div>
            <div class="form-check form-switch mb-3">
                <input type="checkbox" class="form-check-input theme-choice" id="dark-mode-switch" />
                <label class="form-check-label" for="dark-mode-switch">Ночной</label>
            </div>
        </div>
    </div>
</div>
<div class="rightbar-overlay"></div>
@include('layouts.simple.script')
@yield('scripts')
@livewireScripts

@stack('scripts')
</body>
</html>
