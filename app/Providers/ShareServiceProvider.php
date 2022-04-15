<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class ShareServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        if (session()->get('stock') == ''){
            $stock_id = isset(auth()->user()->stock_id) ? auth()->user()->stock_id:0;
            session()->put('stock', $stock_id);
        }else{
            session()->put('stock', session()->get('stock'));
        }
        if (session()->get('stock') == 0){ return redirect('dashboard'); }

        view()->composer('*', function ($view)
        {
            $view->with(['stock_id'=>session()->get('stock')]);
        });
    }
}
