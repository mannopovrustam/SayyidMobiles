<ul class="nav nav-tabs">
    <li class="nav-item">
        <a href="/trade/cash" class="nav-link @if(\Request::segment(2) == 'cash') active @endif">
            Naqd savdo
        </a>
    </li>
    <li class="nav-item">
        <a href="/trade/loan" class="nav-link @if(\Request::segment(2) == 'loan') active @endif">
            Nasiya
        </a>
    </li>
    <li class="nav-item">
        <a href="/trade/installment" class="nav-link @if(\Request::segment(2) == 'installment') active @endif">
            Muddatli to’lov
        </a>
    </li>
    <li class="nav-item">
        <a href="/trade/income" class="nav-link @if(\Request::segment(2) == 'income') active @endif">
            Kirim
        </a>
    </li>
    <li class="nav-item">
        <a href="/trade/returns" class="nav-link @if(\Request::segment(2) == 'returns') active @endif">
            Mahsulot qaytishi
        </a>
    </li>
    <li class="nav-item">
        <a href="/trade/transfer" class="nav-link @if(\Request::segment(2) == 'transfer') active @endif">
            O'tkazma
        </a>
    </li>
    <li class="nav-item">
        <a href="/acceptances" class="nav-link @if(\Request::segment(2) == 'acceptance') active @endif">
            Qabul <span style="background: #5b73e8; padding: 1px 4px; border-radius: 5px; color: #fff; font-size: smaller">
                {{ count(\Modules\Trade\Entities\Transfer::where([['status', 0], ['stock_to', session()->get('stock')]])->get()) }}
            </span>
        </a>
    </li>
</ul>
