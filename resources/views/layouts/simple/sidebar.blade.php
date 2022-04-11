<div class="vertical-menu">

    <!-- LOGO -->
    <div class="navbar-brand-box">
        <a href="/" class="logo logo-dark">
            <x-jet-application-mark class="w-25 mt-3" />
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

                <li>
                    <a href="/dashboard">
                        <i class="uil-home-alt"></i>
                        <span>Asosiy</span>
                    </a>
                </li>
                <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="uil-shop"></i>
                        <span>Ombor</span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="/stocks">Omborlar</a>
                        </li>
                        <li>
                            <a href="/stock_payments">To'lov</a>
                        </li>
                        <li>
                            <a href="/converts">Valyuta ayirboshlash</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="/price_types/create" >
                        <i class="uil-minus-path"></i>
                        <span>Narx turi</span>
                    </a>
                </li>
                <li>
                    <a href="/products" >
                        <i class="uil-mobile-android"></i>
                        <span>Mahsulotlar</span>
                    </a>
                </li>
                <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="uil-apple-alt"></i>
                        <span>Model</span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="/brands">Tur / Brend</a>
                        </li>
                        <li>
                            <a href="/marks">Model</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="/clients">
                        <i class="uil-users-alt"></i>
                        <span>Mijozlar</span>
                    </a>
                </li>
                <li>
                    <a href="{{ auth()->user()->role == 'admin' ? '/stores/create':'javascript: void(0);' }}" class="has-arrow waves-effect">
                        <i class="uil-tag-alt"></i>
                        <span>Savdo</span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="/trade/cash">Naqd savdo</a>
                        </li>
                        <li>
                            <a href="/trade/loan">Nasiya</a>
                        </li>
                        <li>
                            <a href="/trade/installment">Muddatli to'lov</a>
                        </li>
                        <li>
                            <a href="/trade/income">Kirim</a>
                        </li>
                        <li>
                            <a href="/trade/return">Mahsulot qaytishi</a>
                        </li>
                        <li>
                            <a href="/trade/transfer">O'tkazma</a>
                        </li>
                    </ul>
                </li>
                
                <li>
                    <a href="/currency_differences" >
                        <i class="uil-euro"></i>
                        <span>Valyuta farqi</span>
                    </a>
                </li>

                <li>
                    <a href="/permissions" >
                        <i class="uil-lock-access"></i>
                        <span>Ruxsatlar</span>
                    </a>
                </li>
            </ul>

        </div>
        <!-- Sidebar -->
    </div>
</div>
