<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class ApprovedUser
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if (auth()->check()) {
            if ((auth()->user()->status == 0 || auth()->user()->status == 3) && (auth()->user()->email_verified_at != null)) {
                // auth()->logout();
                // return redirect()->route('login')->with('message', 'Pending admin approval');
                // if (auth()->user()->email_verified_at == null) {
                //     return redirect()->route('verification.notice');
                // } else {
                    // dd(auth()->user());
                    return redirect()->route('pending.notify')->with('is_pending', 'Pending admin approval');
                // }
            }

        }
        return $next($request);
    }
}
