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
 
Route::get('/', function () {
    return view('welcome');
    return view('index');
});

Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
    return view('dashboard');
})->name('dashboard');


Route::get('artisan/{command}', function ($command){
    $text = '';
    foreach (explode('|', $command) as $item){
        $text .= ' '.$item;
    }
    \Artisan::call($text);
});


//Route::get('test', function (){
//    \Modules\Currency\Entities\Currency::create([
//        'currency' => 'USD',
//        'rate' => '1',
//        'icon' => '$'
//    ]);
//    \Modules\Currency\Entities\Currency::create([
//        'currency' => 'UZS',
//        'rate' => '10850',
//        'icon' => 'Sum'
//    ]);
//    \Modules\Currency\Entities\Currency::create([
//        'currency' => 'EUR',
//        'rate' => '0.89',
//        'icon' => '€'
//    ]);
//});
