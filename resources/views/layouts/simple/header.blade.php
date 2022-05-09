<header id="page-topbar">
    <div class="navbar-header">
        <div class="header-src">
            <!-- LOGO -->
            <div class="navbar-brand-box">
                <a href="/" class="logo logo-dark">
                    {{--<x-jet-application-mark class="block h-9 w-auto" />--}}
                </a>

                <a href="/" class="logo logo-light">
                    {{--<x-jet-application-mark class="block h-9 w-auto" />--}}
                </a>
            </div>

            <button type="button" class="btn btn-sm px-3 font-size-16 header-item waves-effect vertical-menu-btn">
                <i class="fa fa-fw fa-bars"></i>
            </button>

            <!-- App Search-->
            <div class="app-search d-none d-lg-block">
                <div class="position-relative">
                    <h5>Ombor::
                        <d style="cursor: pointer"
                           class="text-primary" data-bs-toggle="modal"
                           data-bs-target="#add_client">{{ \Modules\Stock\Entities\Stock::find(session()->get('stock'))->name }}</d>
                    </h5>
                    {{--<input type="text" id="search" class="form-control form-control-sm" placeholder="Поиск..." autocomplete="off">--}}
                    {{--<span class="uil-search"></span>--}}
                </div>
                <div class="position-absolute" id="poisk" style="display: none">
                    <div class="card">
                        <div class="card-body">
                            <p id="search1"></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="d-flex align-items-center">

            {{--<div class="dropdown d-inline-block d-lg-none ms-2">--}}
            {{--<button type="button" class="btn header-item noti-icon waves-effect" id="page-header-search-dropdown"--}}
            {{--data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--}}
            {{--<i class="uil-search"></i>--}}
            {{--</button>--}}
            {{--<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"--}}
            {{--aria-labelledby="page-header-search-dropdown">--}}

            {{--<form class="p-3">--}}
            {{--<div class="m-0">--}}
            {{--<div class="input-group">--}}
            {{--<input type="text" class="form-control form-control-sm" placeholder="Поиск ..."--}}
            {{--aria-label="Recipient's username">--}}
            {{--<div class="input-group-append">--}}
            {{--<button class="btn btn-primary" type="submit"><i class="mdi mdi-magnify"></i>--}}
            {{--</button>--}}
            {{--</div>--}}
            {{--</div>--}}
            {{--</div>--}}
            {{--</form>--}}
            {{--</div>--}}
            {{--</div>--}}

            <div class="dropdown d-none d-lg-inline-block ms-1" style="margin-right: 5px;">
                <span>Sana</span>
                <p style="margin-bottom: 0;">{{ \Carbon\Carbon::now()->format('d.m.Y') }}
                </p>
            </div>
            {{--<div class="dropdown d-none d-lg-inline-block ms-1">--}}
            {{--<select class="form-select form-select-sm" style="margin-bottom: 0;">--}}
            {{--<option value="1">Рубль</option>--}}
            {{--</select>--}}
            {{--</div>--}}
            <div class="text-primary" style="margin-left: 15px;">
                @foreach(\Modules\Currency\Entities\Currency::all() as $item)
                    <div class="dropdown d-none d-lg-inline-block ms-1 p-1">
                        <span>{{ $item->currency }}</span>
                        <p style="margin-bottom: 0;">{{ $item->rate }}</p>
                    </div>
                @endforeach
            </div>

            <div class="dropdown d-none d-lg-inline-block ms-1">
                <button type="button" class="btn header-item noti-icon waves-effect" data-bs-toggle="fullscreen">
                    <i class="uil-minus-path"></i>
                </button>
            </div>


            <div class="dropdown d-inline-block">
                <button type="button" class="btn header-item noti-icon waves-effect"
                        id="page-header-notifications-dropdown"
                        data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="uil-bell"></i>
                </button>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
                     aria-labelledby="page-header-notifications-dropdown">
                    <div class="p-3">
                        <div class="row align-items-center">
                            <div class="col">
                                <h5 class="m-0 font-size-16"> Xabarlar </h5>
                            </div>
                        </div>
                    </div>
                    <div data-simplebar style="max-height: 230px;">
                    </div>
                    <div class="p-2 border-top">
                        <div class="d-grid">
                            <a class="btn btn-sm btn-link font-size-14 text-center" href="/account">
                                <i class="uil-arrow-circle-right me-1"></i> Ko'rish
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="dropdown d-inline-block mr-5 ml-5">

                <div class="sun">
                    <input type="checkbox" class="form-check-input theme-choice" id="light-mode-switch" checked
                           style="display: none"/>
                    <label class="form-check-label btn header-item noti-icon waves-effect" for="light-mode-switch"><i
                                class="uil-sun" style="top: 20%; position: relative;"></i></label>
                </div>

                <div class="moon" style="display: none">
                    <input type="checkbox" class="form-check-input theme-choice" id="dark-mode-switch"
                           style="display: none"/>
                    <label class="form-check-label btn header-item noti-icon waves-effect" for="dark-mode-switch"><i
                                class="uil-moon" style="top: 20%; position: relative;"></i></label>
                </div>
                {{--<button type="button" class="btn header-item noti-icon right-bar-toggle waves-effect">--}}
                {{--<i class="uil-moon"></i>--}}
                {{--</button>--}}
            </div>

            @php($user = auth()->user())
            <div class="dropdown d-inline-block">
                <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown"
                        data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                    <span class="d-none d-xl-inline-block ms-1 fw-medium font-size-15">{{ $user->name }}</span>
                    <i class="uil-angle-down d-none d-xl-inline-block font-size-15"></i>
                </button>

                <div class="dropdown-menu dropdown-menu-end">
                    <!-- item-->
                    <a class="dropdown-item" href="{{ route('profile.show') }}"><i
                                class="uil uil-user-circle font-size-18 align-middle text-muted me-1"></i> <span
                                class="align-middle">Профиль</span></a>
                    <a class="dropdown-item" href="/lockscreen"><i
                                class="uil uil-lock-alt font-size-18 align-middle me-1 text-muted"></i> <span
                                class="align-middle">Блокировки</span></a>
                    <a class="dropdown-item" href="{{ route('logout') }}"
                       onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                        <i class="uil uil-sign-out-alt font-size-18 align-middle me-1 text-muted"></i> <span
                                class="align-middle">Выход</span></a>

                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        {{ csrf_field() }}
                    </form>
                </div>
            </div>


        </div>
    </div>
</header>

<div class="modal fade bs-example-modal-xl" tabindex="-1" role="dialog"
     aria-labelledby="add_client" id="add_client"
     aria-hidden="false">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myExtraLargeModalLabel">Omborlar</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-sm table-hover table-bordered table-striped table-nowrap align-middle">
                                <tbody>
                                <?php
                                $all_stocks = \Modules\Stock\Entities\Stock::all();
                                $all_stocks_count = count($all_stocks) / 5;
                                ?>
                                @foreach($all_stocks as $key=>$stock)
                                    <tr data-id="{{ $key+1 }}">
                                        <td data-field="name">
                                                <span>{{ $key+1 }}.</span>
                                                @if(session()->get('stock') == $stock->id)
                                                    <a class="btn btn-primary btn-sm" title="Tanlangan">
                                                        {{ $stock->name }}
                                                    </a>
                                                @else
                                                    <a href="/switching/{{  $stock->id  }}"
                                                       class="btn btn-outline-secondary btn-sm"
                                                       title="Almashtirish">
                                                        {{ $stock->name }}
                                                    </a>
                                                @endif
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>