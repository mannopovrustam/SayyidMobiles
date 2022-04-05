<?php

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

Route::resource('/currencies', 'CurrencyController');
Route::resource('/converts', 'ConvertController');

Route::get('/currency_differences', function (){
    return view('currency::currency-difference');
})->middleware('auth');
