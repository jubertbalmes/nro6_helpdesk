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
namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Notifications\CustomEmailValidation;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;
use DateTime;
use DB;
use App\Traits\ComputeWorkingDays;
use Carbon\Carbon;
use App\Archive;

class User extends Authenticatable implements MustVerifyEmail
{
    use Notifiable, HasApiTokens;
    protected $connection = 'mysql';
    public $table = 'users';

    use ComputeWorkingDays;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'email_verified_at', 'staff_id', 'position_id', 'status', 'password', 'picture' ,'role_id', 'voip'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * Get the role of the user
     *
     * @return \App\Role
     */
    public function role()
    {
        return $this->belongsTo(Role::class);
    }

    public function issues()
    {
        if($this->role_id == 2) {
            return $this->hasMany(Issue::class, 'resolver_id', 'id');
        } else {
            return $this->hasMany(Issue::class, 'user_id', 'id');
        }
    }

    /**
     * Get the path to the profile picture
     *
     * @return string
     */
    public function profilePicture()
    {
        if ($this->picture) {
            return "/storage/{$this->picture}";
        }
        return "";
        // return 'http://i.pravatar.cc/200';
    }

    /**
     * Check if the user has admin role
     *
     * @return boolean
     */
    public function isAdmin()
    {
        return $this->role_id == 1;
    }

    /**
     * Check if the user has creator role
     *
     * @return boolean
     */
    public function isCreator()
    {
        return $this->role_id == 2;
    }

    /**
     * Check if the user has user role
     *
     * @return boolean
     */
    public function isMember()
    {
        return $this->role_id == 3;
    }

    public function isHOD()
    {
        return $this->role_id == 4;
    }

    public function status_desc()
    {
        if ($this->status == 0) {
            return 'Pending';
        } elseif ($this->status == 1) {
            return 'Active';
        } else {
            return 'Inactive';
        }
    }

    /**
     * Send the email verification notification.
     *
     * @return void
     */
    public function sendEmailVerificationNotification()
    {
        $this->notify(new CustomEmailValidation);
    }

    public function pending_approval_count()
    {
        if ($this->isAdmin()) {
            return User::where('status', 0)->count();
        } else {
            return '0';
        }
    }

    public function pendingCount()
    {
        // $issues = Issue::all();
        if ($this->isMember()) {
            return Issue::where('user_id', $this->id)->where(function ($query) {
                $query->where('status', 4)
                      ->orWhere('status', 6);
            })->count();
        } elseif ($this->isCreator()) {
            // return 2;
            return Issue::where(function ($query) {
                            $query->where('user_id', $this->id)->where(function ($query2) {$query2->where('status', 4)->orWhere('status', 6);});
                        })->orWhere(function ($query) {
                            $query->where('resolver_id', $this->id)->where(function ($query2) {$query2->where('status', 2)->orWhere('status', 7);});
                        })->count();
        } else {
            // return 2;
            return Issue::where(function ($query) {
                                $query->where('user_id', $this->id)->where(function ($query2) {$query2->where('status', 4)->orWhere('status', 6);});
                            })->orWhere(function ($query) {
                                $query->where('status', 1);
                                    // ->orWhere('status', 7);
                            })->count();
        }
    }

    public function mstaff()
    {
        return $this->belongsTo(Staff::class, 'staff_id', 'id');
    }

    public function position()
    {
        return $this->belongsTo(Position::class, 'position_id', 'id');
    }

    public function cpno()
    {
        if ($this->employee_id == null) {
            $tmp_val = $this->hasOne(Contact::class, 'user_id', 'id')->where('type', 1)->first();
            if ($tmp_val != null) {
                return $tmp_val->value;
            }
        } else {
            $tmp_val = $this->hasOne(NCSOIScontact::class, 'employee_id', 'employee_id')->where('contact_type_id', 1)->first();
            if ($tmp_val != null) {
                return $tmp_val->contact_value;
            }
        }
        return null;
    }

    public function alt_email()
    {
        if ($this->employee_id == null) {
            $tmp_val = $this->hasOne(Contact::class, 'user_id', 'id')->where('type', 4)->first();
            if ($tmp_val != null) {
                return $tmp_val->value;
            }
        } else {
            $tmp_val = $this->hasOne(NCSOIScontact::class, 'employee_id', 'employee_id')->where('contact_type_id', 4)->first();
            if ($tmp_val != null) {
                return $tmp_val->contact_value;
            }
        }
        return null;
    }

    public function telno()
    {
        if ($this->employee_id == null) {
            $tmp_val = $this->hasOne(Contact::class, 'user_id', 'id')->where('type', 2)->first();
            if ($tmp_val != null) {
                return $tmp_val->value;
            }
        } else {
            $tmp_val = $this->hasOne(NCSOIScontact::class, 'employee_id', 'employee_id')->where('contact_type_id', 2)->first();
            if ($tmp_val != null) {
                return $tmp_val->contact_value;
            }
        }
        return null;
    }

    public function submittedTicket()
    {
        if ($this->isAdmin() || $this->isHOD()) {
            return Issue::where('status', 1)->count();
        } else if ($this->isCreator()) {
            return Issue::where('resolver_id', $this->id)->where('status', 1)->count();
        } else if ($this->isMember()) {
            return Issue::where('user_id', $this->id)->where('status', 1)->count();
        }
        return 0;
    }

    public function assignedTicket()
    {
        if ($this->isAdmin() || $this->isHOD()) {
            return Issue::where('status', 2)->count();
        } else if ($this->isCreator()) {
            return Issue::where('resolver_id', $this->id)->where('status', 2)->count();
        } else if ($this->isMember()) {
            return Issue::where('user_id', $this->id)->where('status', 2)->count();
        }
        return 0;
    }

    public function ongoingTicket()
    {
        if ($this->isAdmin() || $this->isHOD()) {
            return Issue::where('status', 3)->count();
        } else if ($this->isCreator()) {
            return Issue::where('resolver_id', $this->id)->where('status', 3)->count();
        } else if ($this->isMember()) {
            return Issue::where('user_id', $this->id)->where('status', 3)->count();
        }
        return 0;
    }

    public function resolvedTicket()
    {
        if ($this->isAdmin() || $this->isHOD()) {
            return Issue::where('status', 4)->count();
        } else if ($this->isCreator()) {
            return Issue::where('resolver_id', $this->id)->where('status', 4)->count();
        } else if ($this->isMember()) {
            return Issue::where('user_id', $this->id)->where('status', 4)->count();
        }
        return 0;
    }

    public function completedTicket()
    {
        $myissues = $this->compTickets();

        // dd($myissues);

        $count = 0;
        foreach($myissues as $issue) {
            $count++;
        }
        return $count;
    }

    public function completedArchivedTickets()
    {
        if ($this->isAdmin() || $this->isHOD()) {
          return Archive::where('status', 5)->count();
        } else if ($this->isCreator()) {
          return Archive::where('resolver_id', $this->id)->where('status', 5)->count();
        } else if ($this->isMember()) {
          return Archive::where('user_id', $this->id)->where('status', 5)->count();
        }
        return 0;
    }

    public function rejectedTicket()
    {
        if ($this->isAdmin() || $this->isHOD()) {
            // return Issue::where('status', 6)->count();
            $issues = Issue::where('status', 6)->count();
            $archives = Archive::where('status', 6)->count();
            return $issues + $archives;
        } else if ($this->isCreator()) {
            // return Issue::where('resolver_id', $this->id)->where('status', 6)->count();
            $issues = Issue::where('resolver_id', $this->id)->where('status', 6)->count();
            $archives = Archive::where('resolver_id', $this->id)->where('status', 6)->count();
            return $issues + $archives;
        } else if ($this->isMember()) {
            // return Issue::where('user_id', $this->id)->where('status', 6)->count();
            $issues = Issue::where('user_id', $this->id)->where('status', 6)->count();
            $archives = Archive::where('user_id', $this->id)->where('status', 6)->count();
            return $issues + $archives;
        }
        return 0;
    }

    public function reopenedTicket()
    {
        if ($this->isAdmin() || $this->isHOD()) {
            return Issue::where('status', 7)->count();
        } else if ($this->isCreator()) {
            return Issue::where('resolver_id', $this->id)->where('status', 7)->count();
        } else if ($this->isMember()) {
            return Issue::where('user_id', $this->id)->where('status', 7)->count();
        }
        return 0;
    }

    public function totalTicket()
    {
        if ($this->isAdmin() || $this->isHOD()) {
            // return Issue::count();
            $issues = Issue::count();
            $archive = Archive::count();
            return $issues + $archive;
        } else if ($this->isCreator()) {
            // return Issue::where('resolver_id', $this->id)->count();
            $issues = Issue::where('resolver_id', $this->id)->count();
            $archive = Archive::where('resolver_id', $this->id)->count();
            return $issues + $archive;
        } else if ($this->isMember()) {
            // return Issue::where('user_id', $this->id)->count();
            $issues = Issue::where('user_id', $this->id)->count();
            $archive = Archive::where('user_id', $this->id)->count();
            return $issues + $archive;
        }
        return 0;
    }

    public function totalArchivedTicket()
    {
        if ($this->isAdmin() || $this->isHOD()) {
          return Archive::count();
        } else if ($this->isCreator()) {
          return Archive::where('resolver_id', $this->id)->count();
        } else if ($this->isMember()) {
          return Archive::where('user_id', $this->id)->count();
        }
        return 0;
    }

    public function pendingTicket()
    {
        $myissues = $this->pendTickets();
        $count = 0;
        foreach($myissues as $issue) {
            $count++;
        }
        return $count;
    }

    public function delayedTicket()
    {
        $myissues = $this->delTickets();
        $count = 0;
        foreach($myissues as $issue) {
            $count++;
        }
        return $count;
    }

    public function delTickets()
    {
        $issues = null;
        $mydate = new DateTime;
        if ($this->isAdmin() || $this->isHOD()) {
            $issues = Issue::whereIn('issues.status', [1, 2, 3, 7])
                            ->leftJoin('categories', 'categories.id', 'issues.category_id')

                            ->where(function ($query) use ($mydate) {
                                $query->whereRaw(DB::raw('DATEDIFF(issues.created_at, "' . $mydate->format("Y-m-d") . '")', '>=', 'categories.man_day'))
                                      ->orWhereRaw(DB::raw('DATEDIFF(issues.created_at, "' . $mydate->format("Y-m-d") . '")', '>=', 'issues.work_days'));
                              })

                            // ->whereRaw(DB::raw('DATEDIFF(issues.created_at, "' . $mydate->format("Y-m-d") . '")', '>=', 'categories.man_day'))

                            ->select('issues.*', 'categories.man_day')
                            ->get();
        } else if ($this->isCreator()) {
            $issues = Issue::where('resolver_id', $this->id)->whereIn('status', [2, 3, 7])
                            ->leftJoin('categories', 'categories.id', 'issues.category_id')

                            ->where(function ($query) use ($mydate) {
                                $query->whereRaw(DB::raw('DATEDIFF(issues.created_at, "' . $mydate->format("Y-m-d") . '")', '>=', 'categories.man_day'))
                                      ->orWhereRaw(DB::raw('DATEDIFF(issues.created_at, "' . $mydate->format("Y-m-d") . '")', '>=', 'issues.work_days'));
                              })

                            // ->whereRaw(DB::raw('DATEDIFF(issues.created_at, "' . $mydate->format("Y-m-d") . '")', '>=', 'categories.man_day'))

                            ->select('issues.*', 'categories.man_day')
                            ->get();
        } else if ($this->isMember()) {
            $issues = Issue::where('user_id', $this->id)->whereIn('status', [1, 2, 3, 7])
                            ->leftJoin('categories', 'categories.id', 'issues.category_id')

                            ->where(function ($query) use ($mydate) {
                                $query->whereRaw(DB::raw('DATEDIFF(issues.created_at, "' . $mydate->format("Y-m-d") . '")', '>=', 'categories.man_day'))
                                      ->orWhereRaw(DB::raw('DATEDIFF(issues.created_at, "' . $mydate->format("Y-m-d") . '")', '>=', 'issues.work_days'));
                              })

                            // ->whereRaw(DB::raw('DATEDIFF(issues.created_at, "' . $mydate->format("Y-m-d") . '")', '>=', 'categories.man_day'))

                            ->select('issues.*', 'categories.man_day')
                            ->get();
        }

        foreach($issues as $key => $issue) {
          if ($issue->work_days == null) {
            $mandays = $issue->man_day;
          } else {
            $mandays = $issue->work_days;
          }

          if ($this->number_of_working_days($issue->created_at->format("Y-m-d"), $mydate->format("Y-m-d")) > $mandays) {
              // Do nothing
          } else {
              $issues->forget($key);
          }
        }
        return $issues;
    }

    public function compTickets()
    {
        if ($this->isAdmin() || $this->isHOD()) {
            // return Issue::where('status', 5)->get();
            $issues = Issue::where('status', 5)->get();
            $archive = Archive::where('status', 5)->get();
            return $issues->merge($archive)->all();
        } else if ($this->isCreator()) {
            // return Issue::where('resolver_id', $this->id)->where('status', 5)->get();
            $issues = Issue::where('resolver_id', $this->id)->where('status', 5)->get();
            $archive = Archive::where('resolver_id', $this->id)->where('status', 5)->get();
            return $issues->merge($archive)->all();
        } else if ($this->isMember()) {
            // return Issue::where('user_id', $this->id)->where('status', 5)->get();
            $issues = Issue::where('user_id', $this->id)->where('status', 5)->get();
            $archive = Archive::where('user_id', $this->id)->where('status', 5)->get();
            return $issues->merge($archive)->all();
        }
        return null;
    }

    public function pendTickets()
    {
        if ($this->isAdmin() || $this->isHOD()) {
            return Issue::whereIn('status', [1, 2, 3, 7])->get();
        } else if ($this->isCreator()) {
            return Issue::where('resolver_id', $this->id)->whereIn('status', [2, 3, 7])->get();
        } else if ($this->isMember()) {
            return Issue::where('user_id', $this->id)->whereIn('status', [1, 2, 3, 7])->get();
        }
        return null;
    }

    public function voip_no() 
    {
        if ($this->voip == null) {
            return $this->mstaff->voip;
        } else {
            return $this->voip;
        }
    }

    public function tdyTickets()
    {
        $issues = null;
        if ($this->isAdmin() || $this->isHOD()) {
            $issues = Issue::whereDate('created_at', Carbon::today())->get();
            $archives = Archive::whereDate('created_at', Carbon::today())->get();
        } else if ($this->isCreator()) {
            $issues = Issue::where('resolver_id', $this->id)->whereDate('created_at', Carbon::today())->get();
            $archives = Archive::where('resolver_id', $this->id)->whereDate('created_at', Carbon::today())->get();
        } else if ($this->isMember()) {
            $issues = Issue::where('user_id', $this->id)->whereDate('created_at', Carbon::today())->get();
            $archives = Archive::where('user_id', $this->id)->whereDate('created_at', Carbon::today())->get();
        }
        // return $issues;
        return $issues->merge($archives)->all();
    }

    public function thisMosTickets()
    {
        $issues = null;
        if ($this->isAdmin() || $this->isHOD()) {
            $issues = Issue::whereMonth('created_at', date('m'))->whereYear('created_at', date('Y'))->get();
            $archives = Archive::whereMonth('created_at', date('m'))->whereYear('created_at', date('Y'))->get();
        } else if ($this->isCreator()) {
            $issues = Issue::where('resolver_id', $this->id)->whereMonth('created_at', date('m'))->whereYear('created_at', date('Y'))->get();
            $archives = Archive::where('resolver_id', $this->id)->whereMonth('created_at', date('m'))->whereYear('created_at', date('Y'))->get();
        } else if ($this->isMember()) {
            $issues = Issue::where('user_id', $this->id)->whereMonth('created_at', date('m'))->whereYear('created_at', date('Y'))->get();
            $archives = Archive::where('user_id', $this->id)->whereMonth('created_at', date('m'))->whereYear('created_at', date('Y'))->get();
        }
        // return $issues;
        return $issues->merge($archives)->all();
    }

    public function thisQtrTickets()
    {
        $issues = null;
        $myQtr = ceil(date('n', time()) / 3);
        $myYear = date('Y');
        if ($this->isAdmin() || $this->isHOD()) {
            $issues = Issue::where(DB::raw('QUARTER(created_at)'), $myQtr)->where(DB::raw('YEAR(created_at)'), $myYear)->get();
            $archives = Archive::where(DB::raw('QUARTER(created_at)'), $myQtr)->where(DB::raw('YEAR(created_at)'), $myYear)->get();
        } else if ($this->isCreator()) {
            $issues = Issue::where('resolver_id', $this->id)->where(DB::raw('QUARTER(created_at)'), $myQtr)->where(DB::raw('YEAR(created_at)'), $myYear)->get();
            $archives = Archive::where('resolver_id', $this->id)->where(DB::raw('QUARTER(created_at)'), $myQtr)->where(DB::raw('YEAR(created_at)'), $myYear)->get();
        } else if ($this->isMember()) {
            $issues = Issue::where('user_id', $this->id)->where(DB::raw('QUARTER(created_at)'), $myQtr)->where(DB::raw('YEAR(created_at)'), $myYear)->get();
            $archives = Archive::where('user_id', $this->id)->where(DB::raw('QUARTER(created_at)'), $myQtr)->where(DB::raw('YEAR(created_at)'), $myYear)->get();
        }
        // return $issues;
        return $issues->merge($archives)->all();
    }

    public function thisYrTickets()
    {
        $issues = null;
        if ($this->isAdmin() || $this->isHOD()) {
            $issues = Issue::whereYear('created_at', date('Y'))->get();
            $archives = Archive::whereYear('created_at', date('Y'))->get();
        } else if ($this->isCreator()) {
            $issues = Issue::where('resolver_id', $this->id)->whereYear('created_at', date('Y'))->get();
            $archives = Archive::where('resolver_id', $this->id)->whereYear('created_at', date('Y'))->get();
        } else if ($this->isMember()) {
            $issues = Issue::where('user_id', $this->id)->whereYear('created_at', date('Y'))->get();
            $archives = Archive::where('user_id', $this->id)->whereYear('created_at', date('Y'))->get();
        }
        // return $issues;
        return $issues->merge($archives)->all();
    }

    public function todayTickets()
    {
        $myissues = $this->tdyTickets();
        $count = 0;
        foreach($myissues as $issue) {
            $count++;
        }
        return $count;
    }

    public function todayArchivedTickets()
    {
      if ($this->isAdmin() || $this->isHOD()) {
        return Archive::whereDate('created_at', Carbon::today())->count();
      } else if ($this->isCreator()) {
        return Archive::where('resolver_id', $this->id)->whereDate('created_at', Carbon::today())->count();
      } else if ($this->isMember()) {
        return Archive::where('user_id', $this->id)->whereDate('created_at', Carbon::today())->count();
      }
      return 0;
    }

    public function thisMonthTickets()
    {
        $myissues = $this->thisMosTickets();
        $count = 0;
        foreach($myissues as $issue) {
            $count++;
        }
        return $count;
    }

    public function thisMonthArchivedTickets()
    {
      if ($this->isAdmin() || $this->isHOD()) {
        return Archive::whereMonth('created_at', date('m'))->whereYear('created_at', date('Y'))->count();
      } else if ($this->isCreator()) {
        return Archive::where('resolver_id', $this->id)->whereMonth('created_at', date('m'))->whereYear('created_at', date('Y'))->count();
      } else if ($this->isMember()) {
        return Archive::where('user_id', $this->id)->whereMonth('created_at', date('m'))->whereYear('created_at', date('Y'))->count();
      }
      return 0;
    }

    public function thisQuarterTickets()
    {
        $myissues = $this->thisQtrTickets();
        $count = 0;
        foreach($myissues as $issue) {
            $count++;
        }
        return $count;
    }

    public function thisQuarterArchivedTickets()
    {
      $myQtr = ceil(date('n', time()) / 3);
      $myYear = date('Y');
      if ($this->isAdmin() || $this->isHOD()) {
        return Archive::where(DB::raw('QUARTER(created_at)'), $myQtr)->where(DB::raw('YEAR(created_at)'), $myYear)->count();
      } else if ($this->isCreator()) {
        return Archive::where('resolver_id', $this->id)->where(DB::raw('QUARTER(created_at)'), $myQtr)->where(DB::raw('YEAR(created_at)'), $myYear)->count();
      } else if ($this->isMember()) {
        return Archive::where('user_id', $this->id)->where(DB::raw('QUARTER(created_at)'), $myQtr)->where(DB::raw('YEAR(created_at)'), $myYear)->count();
      }
      return 0;
    }

    public function thisYearTickets()
    {
        $myissues = $this->thisYrTickets();
        $count = 0;
        foreach($myissues as $issue) {
            $count++;
        }
        return $count;
    }

    public function thisYearArchivedTickets()
    {
      $issues = null;
      if ($this->isAdmin() || $this->isHOD()) {
        return Archive::whereYear('created_at', date('Y'))->count();
      } else if ($this->isCreator()) {
        return Archive::where('resolver_id', $this->id)->whereYear('created_at', date('Y'))->count();
      } else if ($this->isMember()) {
        return Archive::where('user_id', $this->id)->whereYear('created_at', date('Y'))->count();
      }
      return 0;
    }
}
