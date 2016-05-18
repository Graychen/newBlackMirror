<?php

namespace App\Http\Middleware;

use Closure;

class PasswordMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        //$request=hash('md5',$request->password);
        return $next($request);
    }
}
