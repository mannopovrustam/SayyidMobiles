<div class="vertical-menu">

    <!-- LOGO -->
    <div class="navbar-brand-box">
        <a href="/" class="logo logo-dark">
            <x-jet-application-mark class="w-25 mt-3"/>
        </a>

        {{--<a href="/" class="logo logo-light flex">--}}
        {{--<x-jet-application-mark class="block h-9 w-auto" />--}}
        {{--</a>--}}
    </div>

    <button type="button" class="btn btn-sm px-3 font-size-16 header-item waves-effect vertical-menu-btn">
        <i class="fa fa-fw fa-bars"></i>
    </button>

    <div data-simplebar class="sidebar-menu-scroll">

        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">
                <li class="menu-title">Menu</li>

                @can('dashboard')
                    <li>
                        <a href="/dashboard">
                            <i class="uil-home-alt"></i>
                            <span>Asosiy</span>
                        </a>
                    </li>
                @endcan

                @can('stock')
                    <li>
                        <a href="javascript: void(0);" class="has-arrow waves-effect">
                            <i class="uil-shop"></i>
                            <span>Ombor</span>
                        </a>
                        <ul class="sub-menu">
                            @can('stocks')
                                <li>
                                    <a href="/stocks">Omborlar</a>
                                </li>
                            @endcan
                            @can('stock_payments')
                                <li>
                                    <a href="/stock_payments">To'lov</a>
                                </li>
                            @endcan
                            @can('converts')
                                <li>
                                    <a href="/converts">Valyuta ayirboshlash</a>
                                </li>
                            @endcan
                        </ul>
                    </li>
                @endcan
                @can('price_types')
                    <li>
                        <a href="/price_types/create">
                            <i class="uil-minus-path"></i>
                            <span>Narx turi</span>
                        </a>
                    </li>
                @endcan

                @can('products')
                    <li>
                        <a href="/products">
                            <i class="uil-mobile-android"></i>
                            <span>Mahsulotlar</span>
                        </a>
                    </li>
                @endcan

                @can('model')
                    <li>
                        <a href="javascript: void(0);" class="has-arrow waves-effect">
                            <i class="uil-apple-alt"></i>
                            <span>Model</span>
                        </a>
                        <ul class="sub-menu">
                            @can('brands')
                                <li>
                                    <a href="/brands">Tur / Brend</a>
                                </li>
                            @endcan
                            <li>
                                <a href="/marks">Model</a>
                            </li>
                        </ul>
                    </li>
                @endcan

                @can('clients')
                    <li>
                        <a href="/clients">
                            <i class="uil-users-alt"></i>
                            <span>Mijozlar</span>
                        </a>
                    </li>
                @endcan
                @can('trade')
                    <li>
                        <a href="{{ auth()->user()->role == 'admin' ? '/stores/create':'javascript: void(0);' }}"
                           class="has-arrow waves-effect">
                            <i class="uil-tag-alt"></i>
                            <span>Savdo</span>
                        </a>
                        <ul class="sub-menu">
                            @can('trade_cash')
                                <li><a href="/trade/cash">Naqd savdo</a></li>
                            @endcan
                            @can('trade_loan')
                                <li><a href="/trade/loan">Nasiya</a></li>
                            @endcan
                            @can('trade_installment')
                                <li><a href="/trade/installment">Muddatli to'lov</a></li>
                            @endcan
                            @can('trade_income')
                                <li><a href="/trade/income">Kirim</a></li>
                            @endcan
                            @can('trade_return')
                                <li><a href="/trade/return">Mahsulot qaytishi</a></li>
                            @endcan
                            @can('trade_transfer')
                                <li><a href="/trade/transfer">O'tkazma</a></li>
                            @endcan
                        </ul>
                    </li>
                @endcan

                @can('currency_differences')
                <li>
                    <a href="/currency_differences">
                        <i class="uil-euro"></i>
                        <span>Valyuta farqi</span>
                    </a>
                </li>
                @endcan

                @can('user-list')
                    <li>
                        <a href="/users">
                            <i class="uil-user"></i>
                            <span>Xodimlar</span>
                        </a>
                    </li>
                @endcan
            </ul>

        </div>
        <!-- Sidebar -->
    </div>
</div>
