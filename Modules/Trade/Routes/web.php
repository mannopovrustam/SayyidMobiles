<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::resource('trade', \Modules\Trade\Http\Controllers\TradeController::class)->middleware('auth');
Route::resource('transfers', \Modules\Trade\Http\Controllers\TransferController::class)->middleware('auth');

Route::get('/acceptances', function (){
    $data = \Modules\Trade\Entities\Transfer::orderBy('created_at', 'desc')->where('stock_to', auth()->user()->stock_id)->get();
    return view('trade::transfer.acceptance', ['data' => $data]);
});

Route::prefix('/')->group(function() {
    Route::get('cash', function (){ return view('trade::trade.cash'); })->middleware('auth');
    Route::get('loan', function (){ return view('trade::trade.loan'); })->middleware('auth');
    Route::get('income', function (){ return view('trade::trade.income'); })->middleware('auth');
    Route::get('installment', function (){ return view('trade::trade.installment'); })->middleware('auth');
    Route::get('return', \Modules\Trade\Http\Livewire\Trade\Returns::class)->middleware('auth');
    Route::get('transfer', function (){ return view('trade::trade.transfer'); })->middleware('auth');
    Route::get('acceptance/{id}', function ($id){ return view('trade::trade.acceptance', compact('id')); })->middleware('auth');
});

Route::resource('trade_excel', \Modules\Trade\Http\Controllers\ExcelController::class);
