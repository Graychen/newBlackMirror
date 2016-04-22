<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Service\TestService;
use App\Facades\Test;
class TestFacades extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton('test',function(){
            return new Test;
        });

        $this->app->bind('App\Contracts\TestContract',function(){
            return new TestService();
        });
    }
}
