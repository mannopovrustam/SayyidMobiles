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
Route::resource('stocks', 'StockController');
Route::resource('stock_marks', 'StockMarkController');
Route::resource('stock_payments', 'StockPaymentController');
Route::resource('price_types', 'PriceTypeController');

