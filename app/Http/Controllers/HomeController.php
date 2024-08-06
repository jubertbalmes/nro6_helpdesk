<?php
/*

=========================================================
* Argon Dashboard PRO - v1.0.0
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-dashboard-pro-laravel
* Copyright 2018 Creative Tim (https://www.creative-tim.com) & UPDIVISION (https://www.updivision.com)

* Coded by www.creative-tim.com & www.updivision.com

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

*/
namespace App\Http\Controllers;
use App\Issue;
use App\User;
use DateTime;

use App\HelpdeskUser;
use App\Staff;
use App\Position;
use App\Contact;
use App\Category;
use App\MainCategory;
use App\Archive;
use Illuminate\Support\Facades\Hash;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware(['auth', 'verified', 'approved'])->except('pending.notify');;
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        // $user = auth()->user();
        // $token = $user->createToken('neda_helpdesk')->plainTextToken;
        // $token = $user->createToken('neda_helpdesk', ['get:data'])->plainTextToken;
        // dd($token);

        $submitted7days = array();

        $techsubmitted = array();
        $techassigned = array();
        $techongoing = array();
        $techresolved = array();
        $techcompleted = array();
        $techrejected = array();
        $techreopened = array();
        $techontrack = array();
        $techdelayed = array();
        $techInit = array();
        // $tmpy = array();
        $q1RData = array();
        $q2RData = array();
        $q3RData = array();
        $q4RData = array();
        if (auth()->user()->isAdmin() || auth()->user()->isHOD()) {
            for ($x=8;$x>=0;$x--) {
                $now = new DateTime;
                $now->modify('-' . $x . 'day');
                $myCount = Issue::whereDate('created_at', $now->format('Y-m-d'))->count();
                $myCount2 = Archive::whereDate('created_at', $now->format('Y-m-d'))->count();
                $myCount = $myCount + $myCount2;
                array_push($submitted7days, $myCount);
            }
            $techuser = User::where('role_id', 2)->get();
            foreach($techuser as $user) {
                array_push($techsubmitted, $user->submittedTicket());
                array_push($techassigned, $user->assignedTicket());
                array_push($techongoing, $user->ongoingTicket());
                array_push($techresolved, $user->resolvedTicket());
                array_push($techcompleted, $user->completedTicket());
                array_push($techrejected, $user->rejectedTicket());
                array_push($techreopened, $user->reopenedTicket());

                $tmp_pending = $user->pendingTicket();
                $tmp_delayed = $user->delayedTicket();
                $tmp_ontrack = $tmp_pending - $tmp_delayed;
                
                array_push($techontrack, $tmp_ontrack);
                array_push($techdelayed, $tmp_delayed);

                array_push($techInit, strtoupper(substr($user->email, 0, 3)));
            }

            // for ($y=1;$y<=5;$y++) {
            //   $tmpx = array();
            //   for ($x=1;$x<=date('m');$x++) {
            //     $date = date('Y') . '-' . str_pad($x, 2, '0', STR_PAD_LEFT) . '-';
            //     $counts = Issue::where('rating', $y)->where('created_at', 'LIKE', "{$date}%")->count();
            //     $counts2 = Archive::where('rating', $y)->where('created_at', 'LIKE', "{$date}%")->count();
            //     array_push($tmpx, $counts + $counts2);
            //   }
            //   array_push($tmpy, $tmpx);
            // }

            for ($y=1;$y<=5;$y++) {
              $tmpx1 = array();
              $tmpx2 = array();
              $tmpx3 = array();
              $tmpx4 = array();
              for ($x=1;$x<=12;$x++) {
                $date = date('Y') . '-' . str_pad($x, 2, '0', STR_PAD_LEFT) . '-';
                $counts = Issue::where('rating', $y)->where('created_at', 'LIKE', "{$date}%")->count();
                $counts2 = Archive::where('rating', $y)->where('created_at', 'LIKE', "{$date}%")->count();


                if ($x >= 1 && $x <= 3) {
                  array_push($tmpx1, $counts + $counts2);
                } else if ($x >= 4 && $x <= 6) {
                  array_push($tmpx2, $counts + $counts2);
                } else if ($x >= 7 && $x <= 9) {
                  array_push($tmpx3, $counts + $counts2);
                } else {
                  array_push($tmpx4, $counts + $counts2);
                }
              }
              array_push($q1RData, $tmpx1);
              array_push($q2RData, $tmpx2);
              array_push($q3RData, $tmpx3);
              array_push($q4RData, $tmpx4);
            }

            // dd($q3RData);

        } else if (auth()->user()->isCreator()) {
            for ($x=8;$x>=0;$x--) {
                $now = new DateTime;
                $now->modify('-' . $x . 'day');
                $myCount = Issue::where('resolver_id', auth()->user()->id)->whereDate('created_at', $now->format('Y-m-d'))->count();
                $myCount2 = Archive::where('resolver_id', auth()->user()->id)->whereDate('created_at', $now->format('Y-m-d'))->count();
                $myCount = $myCount + $myCount2;
                array_push($submitted7days, $myCount);
            }
        } else {
            for ($x=8;$x>=0;$x--) {
                $now = new DateTime;
                $now->modify('-' . $x . 'day');
                $myCount = Issue::where('user_id', auth()->user()->id)->whereDate('created_at', $now->format('Y-m-d'))->count();
                $myCount2 = Archive::where('user_id', auth()->user()->id)->whereDate('created_at', $now->format('Y-m-d'))->count();
                $myCount = $myCount + $myCount2;
                array_push($submitted7days, $myCount);
            }
        }

        $byStatus = array();
        array_push($byStatus, auth()->user()->submittedTicket());
        array_push($byStatus, auth()->user()->assignedTicket());
        array_push($byStatus, auth()->user()->ongoingTicket());
        array_push($byStatus, auth()->user()->resolvedTicket());
        array_push($byStatus, auth()->user()->completedTicket());
        array_push($byStatus, auth()->user()->rejectedTicket());
        array_push($byStatus, auth()->user()->reopenedTicket());

        return view('pages.dashboard', compact('submitted7days', 'byStatus', 'techInit', 'techsubmitted',
                                                'techassigned', 'techongoing', 'techresolved', 'techcompleted', 'techrejected', 'techreopened', 
                                                'techontrack', 'techdelayed', 'q1RData', 'q2RData', 'q3RData', 'q4RData'));
    }
}
