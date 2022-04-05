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
        view()->composer('*', function ($view)
        {
            $stock_id = isset(auth()->user()->stock_id) ? auth()->user()->stock_id:0;
            $view->with(['stock_id'=>$stock_id]);
        });
    }
}
