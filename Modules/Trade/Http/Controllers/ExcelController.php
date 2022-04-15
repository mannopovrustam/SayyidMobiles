<?php

namespace Modules\Trade\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Modules\Invoice\Entities\Invoice;
use Modules\Stock\Entities\Stock;
use Modules\Trade\Exports\CashExport;
use Modules\Trade\Exports\IncomeExport;
use Modules\Trade\Exports\InstallmentExport;
use Modules\Trade\Exports\LoanExport;

class ExcelController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        return view('trade::index');
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        return view('trade::create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function show($id)
    {
        switch (Invoice::find($id)->type){
            case 1: $type = new CashExport($id); break;
            case 2: $type = new LoanExport($id); break;
            case 3: $type = new InstallmentExport($id); break;
            case 4: $type = new IncomeExport($id); break;
        }

        session()->put('excel_invoice_id', $id);
        return Excel::download($type, 'Naqd Savdo ' .
            Stock::find(Invoice::find($id)->stock_id)->name .' '.Invoice::find($id)->name .
            '.xlsx');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        return view('trade::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy($id)
    {
        //
    }
}
