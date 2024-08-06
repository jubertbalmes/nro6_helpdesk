<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Issue;
use App\User;
use App\Status;
use Gate;
use App\Category;
use App\Attachment;
use App\Contact;
use App\NCSOIScontact;
use App\TechCounter;
use App\Holiday;
use Illuminate\Support\Facades\Storage;
use Response;
use App\Notifications\IssueAssignNotification;
use App\Notifications\IssueReAssignNotification;
use App\Notifications\StatusAcknowledgeNotification;
use App\Notifications\StatusResolvedNotification;
use App\Notifications\StatusCompletedNotification;
use App\Notifications\StatusRejectedNotification;
use App\Notifications\StatusAssignNotification;
use App\Notifications\StatusReOpenedNotification;
use App\Notifications\StatusSubmittedNotification;
use App\Notifications\StatusResubmittedNotification;
use App\Notifications\UnAvailableNotification;
use Pusher\Pusher;
use App\ProjectLog;
use App\MainCategory;
use DateTime;
use DB;
use App\Traits\AddSystemLogs;
use App\Traits\CreateReffNo;
use App\Message;
use App\MessageUser;
use App\Archive;

class IssueController extends Controller
{
    use AddSystemLogs, CreateReffNo;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Issue $issue)
    {
      // $issue = Issue::find(2);
      // dd($issue->hasMessage());
        $holidayDays = Holiday::select(DB::raw('(CASE WHEN holidays.repeat = 1 THEN CONCAT("*", RIGHT(holidays.date, 6)) ELSE holidays.date END) AS date'))->get()->pluck('date')->toArray();
        if (auth()->user()->isMember() && auth()->user()->resolvedTicket() > 0) {
            return view('issues.index', ['issues' => $issue->with('mstatus')->get(), 'type' => '0', 'holidayDays' => $holidayDays])->withErrors(['ticket_warning' => __('Some tickets need your feedback/rating')]);
        } else {
            return view('issues.index', ['issues' => $issue->with('mstatus')->get(), 'type' => '0', 'holidayDays' => $holidayDays]);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Category $category, User $user, Status $status)
    {
        $holidayDays = Holiday::select(DB::raw('(CASE WHEN holidays.repeat = 1 THEN CONCAT("*", RIGHT(holidays.date, 6)) ELSE holidays.date END) AS date'))->get()->pluck('date')->toArray();
        
        $preffuser = User::where('users.role_id', 2)
                            ->where('users.status', 1) 
                            ->leftJoin('issues', function($q)
                                {
                                    $q->on('users.id', '=', 'issues.resolver_id')
                                        ->whereIn('issues.status', [2, 3, 7]);
                                })
                            ->leftJoin('techcounter', 'users.id', '=', 'techcounter.user_id')
                            ->select('users.id', DB::raw("COUNT(issues.id) as mcount"))
                            ->groupBy('users.id')
                            ->orderBy('mcount')
                            ->orderBy('techcounter.counter')
                            ->first();

        if (Gate::denies('create_issue', auth()->user())) {
            return back()->withErrors(['error_message' => __('You are not allowed to create a ticket')]);
        }
        if (Gate::denies('update-reported_by', auth()->user())) {
            return view('issues.create', ['categories' => $category->all(), 'holidayDays' => $holidayDays, 'maincategories' => MainCategory::all()]);
        }
        return view('issues.create', ['categories' => $category->all(), 'users' => $user->get(), 'statuses' => $status->all(), 'preffuser' => $preffuser, 'holidayDays' => $holidayDays, 'maincategories' => MainCategory::all()]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // $timestamps = array();
        // array_push($timestamps, ['time' => DateTime::createFromFormat('U.u', microtime(true))->format('H:i:s.v'), 'type' => 1]);
        if (Gate::denies('create_issue', auth()->user())) {
            return back()->withErrors(['error_message' => __('You are not allowed to create a ticket')]);
        }

        if ($request->status == 6 || $request->status == 7) {
            return back()->withErrors(['error_message' => __('Invalid status')]);
        }

        $issue = new Issue;

        if (auth()->user()->isMember() || $request->status == 1) {
            $final_ref = 'TEMP-' . $this->getNextId();
        } else {
            $final_ref = $this->createreffno();
        }

        // array_push($timestamps, ['time' => DateTime::createFromFormat('U.u', microtime(true))->format('H:i:s.v'), 'type' => 2]);
        $this->getValidate();
        if (auth()->user()->isMember() == false) {
            $this->getValidatePriority();
            $issue->priority = $request->priority;
        } else {
            $issue->priority = 1;
        }

        if (Gate::denies('update-reported_by', auth()->user())) {
            $issue->user_id = auth()->user()->id;
        } else {
            $user = User::find($request->user_id);
            if ($user == null || $user->isMember() == false) {
                return back()->withErrors(['error_message' => __('Invalid ticket owner')]);
            }
            $issue->user_id = $request->user_id;
        }

        // array_push($timestamps, ['time' => DateTime::createFromFormat('U.u', microtime(true))->format('H:i:s.v'), 'type' => 3]);
        
        $issue->reff_no = $final_ref;

        $issue->category_id = $request->category_id;
        $issue->description = $request->description;
        $issue->steps_to_replicate = $request->steps_to_replicate;

        if  (auth()->user()->isAdmin() || auth()->user()->isHOD()) {

            if (Category::find($request->category_id)->man_day != $request->work_days) {
              $issue->work_days = $request->work_days;
            }

            $issue->status = $request->status;
            if ($request->status == 2) {
                $issue->assigned_by_system == null;
            }
            $resolver = User::find($request->resolver_id);
            if ($resolver == null || $resolver->isCreator() == false) {
              if ($request->status != 1) {
                return back()->withErrors(['error_message' => __('Invalid assignee')]);
              }
            }
            $issue->resolver_id = $request->resolver_id;
            $issue->remarks = $request->remarks;
            $issue->rating = $request->rating;
            $issue->remarks_creator = $request->remarks_creator;

            if ($request->status == 2 || $request->status == 3) {
                if ($request->resolver_id != null) {
                    $techcounter = TechCounter::where('user_id', $request->resolver_id)->first();
                    if ($techcounter != null) {
                        $techcounter->counter = $techcounter->counter + 1;
                    } else {
                        $techcounter = new TechCounter;
                        $techcounter->user_id = $request->resolver_id;
                        $techcounter->counter = 1;
                    }
                    $techcounter->save();
                }
            }
          // array_push($timestamps, ['time' => DateTime::createFromFormat('U.u', microtime(true))->format('H:i:s.v'), 'type' => 4]);
        } else {
            $issue->status = 1;
        }
        if ($issue->status != 1) {
            $now = new DateTime;
            $issue->started_at = $now->format('Y-m-d H:i:s');
        }

        $issue->save();
        $projectlog = new ProjectLog;
        $projectlog->issue_id = $issue->id;
        $projectlog->user_id = auth()->user()->id;
        $projectlog->role_id = auth()->user()->role_id;


        if (auth()->user()->isMember()) {
          $holidayDays = Holiday::select(DB::raw('(CASE WHEN holidays.repeat = 1 THEN CONCAT("*", RIGHT(holidays.date, 6)) ELSE holidays.date END) AS date'))->get()->pluck('date')->toArray();
          $now = new DateTime;
          $currentTime = strtotime(date('H:i'));
          if (in_array($now->format('Y-m-d'), $holidayDays) || in_array($now->format('*-m-d'), $holidayDays)) {
              $issue->user->notify(new UnAvailableNotification($issue));
          } else if ($currentTime < strtotime('07:00') || $currentTime > strtotime('19:00')) {
              $issue->user->notify(new UnAvailableNotification($issue));
          } else if (date('w') == 0 || date('w') == 6) {
              $issue->user->notify(new UnAvailableNotification($issue));
          }
          // array_push($timestamps, ['time' => DateTime::createFromFormat('U.u', microtime(true))->format('H:i:s.v'), 'type' => 5]);
        }



        if ($issue->status == 1) {
            $ids = array();

            // $hods = User::where('role_id', 4)->get();
            // foreach($hods as $hod) {
            //     $hod->notify(new StatusSubmittedNotification($issue));
            //     array_push($ids, ['id' => $hod->id, 'value' => $hod->pendingCount()]);
            // }

            // $admins = User::where('role_id', 1)->get();
            // foreach($admins as $admin) {
            //     array_push($ids, ['id' => $admin->id, 'value' => $admin->pendingCount()]);
            // }


            foreach(User::whereIn('role_id', [1, 4])->get() as $adminhod) {
              if ($adminhod->role_id == 4) {
                $adminhod->notify(new StatusSubmittedNotification($issue));
              }
              array_push($ids, ['id' => $adminhod->id, 'value' => $adminhod->pendingCount()]);
              // array_push($timestamps, ['time' => DateTime::createFromFormat('U.u', microtime(true))->format('H:i:s.v'), 'type' => 6]);
            }

            $this->pushNotif('issue_for_action', $ids);

            $projectlog->status = $issue->status;
            $projectlog->remarks = null;

        } else if ($issue->status == 2) {
            $issue->resolver->notify(new IssueAssignNotification($issue));
            $ids = array(['id' => $issue->resolver->id, 'value' => $issue->resolver->pendingCount()]);
            $this->pushNotif('issue_for_action', $ids);

            $projectlog->status = $issue->status;
            $projectlog->remarks = $issue->resolver->name;

        } else if ($issue->status == 4) {
            $issue->user->notify(new StatusResolvedNotification($issue));
            $ids = array(['id' => $issue->user->id, 'value' => $issue->user->pendingCount()]);
            $this->pushNotif('issue_for_action', $ids);

            $projectlog->status = $issue->status;
            $projectlog->remarks = $issue->remarks;

        } else if ($issue->status == 5) {
            $issue->resolver->notify(new StatusCompletedNotification($issue));
            $ids = array(['id' => $issue->resolver->id, 'value' => $issue->resolver->pendingCount()]);
            $this->pushNotif('issue_for_action', $ids);

            $projectlog->status = $issue->status;
            $projectlog->remarks = 'Rating: ' . $issue->rating . '; Comments: ' . $issue->remarks_creator;
        }
        $projectlog->save();
        // array_push($timestamps, ['time' => DateTime::createFromFormat('U.u', microtime(true))->format('H:i:s.v'), 'type' => 7]);

        if ($request->hasFile('attached_file')) {
            foreach($request->file('attached_file') as $file) {
                $attachment = new Attachment;
                $attachment->issue_id = $issue->id;
                $attachment->orig_file = $file->getClientOriginalName();
                $attachment->hash_file = $file->hashName();
                $attachment->save();
                $file->store('public\attachments');
                // array_push($timestamps, ['time' => DateTime::createFromFormat('U.u', microtime(true))->format('H:i:s.v'), 'type' => 8]);
            }
        }

        
        $this->addsystemlogs('Create new request - "' . $issue->reff_no . '"');
        
        // array_push($timestamps, ['time' => DateTime::createFromFormat('U.u', microtime(true))->format('H:i:s.v'), 'type' => 9]);

        // dd($timestamps);
        return Redirect::to('/issue')->withStatus(__('Issue successfully created'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id, $mtype = 0)
    {
        $holidayDays = Holiday::select(DB::raw('(CASE WHEN holidays.repeat = 1 THEN CONCAT("*", RIGHT(holidays.date, 6)) ELSE holidays.date END) AS date'))->get()->pluck('date')->toArray();
        $issue = Issue::find(decrypt($id));
        $statuses = Status::all(); 
        $categories = Category::all();
        $maincategories = MainCategory::all();
        $messages = $issue->messages;
        if (Gate::denies('edit', $issue)) {
            return back()->withErrors(['error_message' => __('You are not allowed to edit this record')]);
        }
        
        if (Gate::allows('edit_status', $issue)) {
            $users = User::all();
        } else {
            $users = null;
        }
        $attachments = $issue->attachment;
        $projectlogs = ProjectLog::where('issue_id', $issue->id)->get();
        // $preffuser = User::where('users.role_id', 2)->where('users.status', 1)->leftJoin('issues', function($q)
        //                                                                                 {
        //                                                                                     $q->on('users.id', '=', 'issues.resolver_id')
        //                                                                                         ->whereIn('issues.status', [2, 3, 7]);
        //                                                                                 })->select('users.id', DB::raw("COUNT(issues.id) as mcount"))->groupBy('users.id')->orderBy('mcount')->first();

        $preffuser = User::where('users.role_id', 2)
                            ->where('users.status', 1) 
                            ->leftJoin('issues', function($q)
                                {
                                    $q->on('users.id', '=', 'issues.resolver_id')
                                        ->whereIn('issues.status', [2, 3, 7]);
                                })
                            ->leftJoin('techcounter', 'users.id', '=', 'techcounter.user_id')
                            ->select('users.id', DB::raw("COUNT(issues.id) as mcount"))
                            ->groupBy('users.id')
                            ->orderBy('mcount')
                            ->orderBy('techcounter.counter')
                            ->first();
        if (MessageUser::where('issue_id', $issue->id)->where('user_id', auth()->user()->id)->first() == null) {
          $messageuser = 0;
        } else {
          $messageuser = 1;
        }
        // dd($preffuser);
        return view('issues.edit', compact('issue', 'categories', 'statuses', 'users', 'attachments', 'projectlogs', 'preffuser', 'holidayDays', 'maincategories', 'messages', 'messageuser', 'mtype'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Issue $issue)
    {
        // dd($request);
        if (Gate::denies('update', $issue)) {
            return back()->withErrors(['error_message' => __('You are not allowed to update this record')]);
        }

        $this->getValidate();
        if (auth()->user()->isMember() == false) {
            $this->getValidatePriority();
            $issue->priority = $request->priority;
        }
        
        $old_issue = Issue::find($issue->id);

        if (auth()->user()->isMember() || auth()->user()->isAdmin() || auth()->user()->isHOD()) {
            $issue->category_id = $request->category_id;
            // $issue->priority = $request->priority;
            $issue->description = $request->description;
            $issue->steps_to_replicate = $request->steps_to_replicate;

            if (auth()->user()->isAdmin() || auth()->user()->isHOD()) {
                if (Category::find($request->category_id)->man_day != $request->work_days) {
                  $issue->work_days = $request->work_days;
                }

                // if ($request->status > 2 && $old_issue->resolver_id != null && $old_issue->resolver_id != $request->resolver_id) {
                //     return back()->withErrors(['warning_message' => __('Changing the technician while the status is on ')]);
                // }
                if ($old_issue->status == 5 && auth()->user()->isHOD()) {
                    return back()->withErrors(['error_message' => __('You cannot update a completed ticket')]);
                }

                if ($old_issue->resolver_id != $request->resolver_id && $request->resolver_id != null) {
                    $now = new DateTime;
                    $issue->started_at = $now->format('Y-m-d H:i:s');

                    if ($request->status == 2 || $request->status == 3 || $request->status == 7) {
                        if ($request->resolver_id != null) {
                            $techcounter = TechCounter::where('user_id', $request->resolver_id)->first();
                            if ($techcounter != null) {
                                $techcounter->counter = $techcounter->counter + 1;
                            } else {
                                $techcounter = new TechCounter;
                                $techcounter->user_id = $request->resolver_id;
                                $techcounter->counter = 1;
                            }
                            $techcounter->save();
                        }
                    }
                }

                $resolver = User::find($request->resolver_id);
                if (($resolver == null || $resolver->isCreator() == false) && ($request->status != 6)) {
                    dd($request->status);
                    return back()->withErrors(['error_message' => __('Invalid assignee')]);
                }
                $issue->resolver_id = $request->resolver_id;

                $user = User::find($request->user_id);
                if ($user == null || $user->isMember() == false) {
                    return back()->withErrors(['error_message' => __('Invalid ticket owner')]);
                }

                $issue->user_id = $request->user_id;
                $issue->status = $request->status;
                if ($request->status == 1) {
                    $issue->resolver_id = null;
                }

                if ($request->status == 2) {
                    $issue->assigned_by_system == null;
                }

                if ($request->status == 4) {
                    $now = new DateTime;
                    $issue->completed_at = $now->format('Y-m-d H:i:s');
                    $issue->remarks = $request->remarks;
                }

                if ($request->status == 5) {
                    $issue->rating = $request->rating;
                    $issue->remarks_creator = $request->remarks_creator;
                } else {
                    $issue->rating = null;
                    $issue->remarks_creator = null;
                }

                if ($request->status == 6) {
                    if (auth()->user()->can('reject', $issue)) {
                        $issue->rejected_id = auth()->user()->id;
                        $issue->resolver_id = null;
                        $issue->reason_for_rejection = $request->reason_for_rejection;
                    } else {
                        return back()->withErrors(['error_message' => __('Ticket can no longer be rejected')]);
                    }
                }

                if ($request->status == 7) {
                    $issue->reason_for_reopen = $request->reason_for_reopen;
                }
            } elseif (auth()->user()->isMember()) {
                $this->addsystemlogs('Update request - "' . $issue->reff_no . '"');
            }
        } else {
            if ($issue->status == 5) {
                return back()->withErrors(['warning_message' => __('You are no longer allowed to update this record')]);
            }

            $issue->status = $request->status;

            if ($request->status == 4) {
                $now = new DateTime;
                $issue->completed_at = $now->format('Y-m-d H:i:s');
                $issue->remarks = $request->remarks;
            }

            if ($request->status == 6) {
                $issue->rejected_id = auth()->user()->id;
                $issue->reason_for_rejection = $request->reason_for_rejection;
            }

            if(!in_array($request->status, ["3", "4", "6"])) {
                return back()->withErrors(['warning_message' => __('Invalid/No changes in status')]);
            }
        }

        
        if((in_array($request->status, ["2", "3", "4", "5", "7"])) && ($issue->reff_no == null || substr($issue->reff_no, 0, 4) == 'TEMP')) {
            $issue->reff_no = $this->createreffno();
            $this->addsystemlogs('Created permanent reference number - "' . $issue->reff_no . '"');

            
            $projectlog = new ProjectLog;
            $projectlog->issue_id = $issue->id;
            $projectlog->user_id = auth()->user()->id;
            $projectlog->role_id = auth()->user()->role_id;
            $projectlog->status = $issue->status;
            $projectlog->remarks = 'Created permanent reference number';
            $projectlog->save();
        }
        $issue->save();

        if (auth()->user()->isMember() || auth()->user()->isAdmin()) {
            $array_ids = $request->att_id;
            $array_ids = array_map('intval', $array_ids);

            $attachements = Attachment::where('issue_id', $issue->id)->get();
            foreach($attachements as $attachment) {
                if(!in_array($attachment->id, $array_ids)) {
                    $attachment->delete();
                }
            }

            if ($request->hasFile('attached_file')) {
                foreach($request->file('attached_file') as $file) {
                    $attachment = new Attachment;
                    $attachment->issue_id = $issue->id;
                    $attachment->orig_file = $file->getClientOriginalName();
                    $attachment->hash_file = $file->hashName();
                    $attachment->save();
                    $file->store('public\attachments');
                }
            }
        }

        
        if (auth()->user()->isAdmin() || auth()->user()->isHOD() || auth()->user()->isCreator()) {

            // if (($old_issue->resolver_id != null && $request->resolver_id != null) && $old_issue->resolver_id != $request->resolver_id) {
                
                // dd($issue);
            // }

            // dd('Old: ' . $old_issue->resolver_id . '    |    New: ' . $request->resolver_id);
            $new_issue = Issue::find($issue->id);
            if ($old_issue->status != $new_issue->status) {

                if ($old_issue->resolver_id != null && $new_issue->resolver_id != null && $old_issue->resolver_id != $new_issue->resolver_id && $new_issue->status != 2) {
                    if ($new_issue->resolver_id != null) {
                        $projectlog = new ProjectLog;
                        $projectlog->issue_id = $new_issue->id;
                        $projectlog->user_id = auth()->user()->id;
                        $projectlog->role_id = auth()->user()->role_id;
                        $projectlog->status = 0;
                        $projectlog->remarks = $new_issue->resolver->name;
                        $projectlog->save();

                        $ids = array(['id' => $old_issue->resolver->id, 'value' => $old_issue->resolver->pendingCount()]);
                        $this->pushNotif('issue_for_action', $ids);
                    }
                }

                $projectlog = new ProjectLog;
                $projectlog->issue_id = $new_issue->id;
                $projectlog->user_id = auth()->user()->id;
                $projectlog->role_id = auth()->user()->role_id;

                if ($new_issue->status == 1) {
                    $new_issue->user->notify(new StatusResubmittedNotification($new_issue));

                    $ids = array();
                    $users = User::where(function ($query) {$query->where('role_id', 1)->orWhere('role_id', 4);})->get();
                    foreach($users as $user) {
                        array_push($ids, ['id' => $user->id, 'value' => $user->pendingCount()]);
                    }
                    $this->pushNotif('issue_for_action', $ids);

                    $projectlog->status = $new_issue->status;
                    $projectlog->remarks = null;
                    $this->addsystemlogs('Changed request status to submitted - "' . $new_issue->reff_no . '"');

                } elseif ($new_issue->status == 2) {
                    $new_issue->user->notify(new StatusAssignNotification($new_issue));
                    if ($old_issue->resolver_id != $new_issue->resolver_id && $new_issue->resolver_id != null) {
                        // dd('1');
                        $new_issue->resolver->notify(new IssueAssignNotification($new_issue));
                        $ids = array(['id' => $new_issue->resolver->id, 'value' => $new_issue->resolver->pendingCount()]);
                        if ($old_issue->resolver_id != null) {
                            array_push($ids, ['id' => $old_issue->resolver->id, 'value' => $old_issue->resolver->pendingCount()]);
                        }
                        $users = User::where(function ($query) {$query->where('role_id', 1)->orWhere('role_id', 4);})->get();
                        foreach($users as $my_user) {
                            array_push($ids, ['id' => $my_user->id, 'value' => $my_user->pendingCount()]);
                        }
                    
                        $this->pushNotif('issue_for_action', $ids);
                        // $projectlog->status = 0;
                        $projectlog->status = $new_issue->status;
                        $projectlog->remarks = $new_issue->resolver->name;
                        
                    } else {
                        $projectlog->status = $new_issue->status;
                        $projectlog->remarks = $new_issue->resolver->name;
                    }
                    $this->addsystemlogs('Changed request status to assigned - "' . $new_issue->reff_no . '"');

        
                } elseif ($new_issue->status == 3) {
                    $new_issue->user->notify(new StatusAcknowledgeNotification($new_issue));

                    $projectlog->status = $new_issue->status;
                    $projectlog->remarks = $new_issue->resolver->name;
                    $this->addsystemlogs('Changed request status to acknowledged - "' . $new_issue->reff_no . '"');

                } elseif ($new_issue->status == 4) {
                    $new_issue->user->notify(new StatusResolvedNotification($new_issue));
                    $ids = array(['id' => $new_issue->user->id, 'value' => $new_issue->user->pendingCount()]);
                    $this->pushNotif('issue_for_action', $ids);

                    $projectlog->status = $new_issue->status;
                    $projectlog->remarks = $new_issue->remarks;
                    $this->addsystemlogs('Changed request status to resolved - "' . $new_issue->reff_no . '"');

                } elseif ($new_issue->status == 5 && $new_issue->resolver_id != null) {
                    $new_issue->resolver->notify(new StatusCompletedNotification($new_issue));
                    // $ids = array($new_issue->resolver->id);
                    // $this->pushNotif('issue_for_action', $ids);

                    $projectlog->status = $new_issue->status;
                    $projectlog->remarks = 'Rating: ' . $new_issue->rating . '; Comments: ' . $new_issue->remarks_creator;
                    $this->addsystemlogs('Changed request status to completed - "' . $new_issue->reff_no . '"');

                } elseif ($new_issue->status == 6) {
                    $new_issue->user->notify(new StatusRejectedNotification($new_issue));
                    $ids = array(['id' => $new_issue->user->id, 'value' => $new_issue->user->pendingCount()]);

                    // dd($ids);
                    $this->pushNotif('issue_for_action', $ids);

                    $projectlog->status = $new_issue->status;
                    $projectlog->remarks = $new_issue->reason_for_rejection;
                    $this->addsystemlogs('Changed request status to rejected - "' . $new_issue->reff_no . '"');

                } elseif ($new_issue->status == 7 && $new_issue->resolver_id != null) {
                    $new_issue->resolver->notify(new StatusReOpenedNotification($new_issue));
                    $ids = array(['id' => $new_issue->resolver->id, 'value' => $new_issue->resolver->pendingCount()]);
                    $this->pushNotif('issue_for_action', $ids);

                    $projectlog->status = $new_issue->status;
                    $projectlog->remarks = $new_issue->reason_for_reopen;
                    $this->addsystemlogs('Changed request status to reopened - "' . $new_issue->reff_no . '"');
                }
                $projectlog->save();
            } elseif ($old_issue->resolver_id != $new_issue->resolver_id) {
                $new_issue->user->notify(new IssueReAssignNotification($new_issue));
                if ($new_issue->resolver_id != null) {
                    $new_issue->resolver->notify(new IssueAssignNotification($new_issue));
                    $ids = array(['id' => $new_issue->resolver->id, 'value' => $new_issue->resolver->pendingCount()]);
                    if ($old_issue->resolver_id != null) {
                        array_push($ids, ['id' => $old_issue->resolver->id, 'value' => $old_issue->resolver->pendingCount()]);
                    }
                    $this->pushNotif('issue_for_action', $ids);
                    
                    $projectlog = new ProjectLog;
                    $projectlog->issue_id = $new_issue->id;
                    $projectlog->user_id = auth()->user()->id;
                    $projectlog->role_id = auth()->user()->role_id;
                    $projectlog->status = $new_issue->status;
                    $projectlog->remarks = $new_issue->resolver->name;
                    $projectlog->save();
                    $this->addsystemlogs('Reassigned request - "' . $new_issue->reff_no . '"');
                }
            } else {    
              $projectlog = new ProjectLog;
              $projectlog->issue_id = $new_issue->id;
              $projectlog->user_id = auth()->user()->id;
              $projectlog->role_id = auth()->user()->role_id;
              $projectlog->status = $new_issue->status;
              $projectlog->remarks = 'Updated ticket details';
              $projectlog->save();
              $this->addsystemlogs('Updated ticket details - "' . $new_issue->reff_no . '"');
            }
        }
        return Redirect::to('/issue')->withStatus(__('Issue successfully updated'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Issue $issue)
    {
        if (Gate::denies('archive', $issue)) {
            return back()->withErrors(['error_message' => __('You are not allowed to archive this record')]);
        }
        $this->addsystemlogs('Archive request - "' . $issue->reff_no . '"');

        $archive = new Archive;
        $archive->id = $issue->id;
        $archive->reff_no = $issue->reff_no;
        $archive->user_id = $issue->user_id;
        $archive->category_id = $issue->category_id;
        $archive->work_days = $issue->work_days;
        $archive->priority = $issue->priority;
        $archive->description = $issue->description;
        $archive->steps_to_replicate = $issue->steps_to_replicate;
        $archive->status = $issue->status;
        $archive->resolver_id = $issue->resolver_id;
        $archive->assigned_by_system = $issue->assigned_by_system;
        $archive->remarks = $issue->remarks;
        $archive->rejected_id = $issue->rejected_id;
        $archive->reason_for_rejection = $issue->reason_for_rejection;
        $archive->reason_for_reopen = $issue->reason_for_reopen;
        $archive->rating = $issue->rating;
        $archive->remarks_creator = $issue->remarks_creator;
        $archive->started_at = $issue->started_at;
        $archive->completed_at = $issue->completed_at;
        $archive->created_at = $issue->created_at;
        $archive->updated_at = $issue->updated_at;
        $archive->save();

        $issue->delete();
        return back()->withStatus(__('Issue successfully archived'));
    }

    
    public function downloadtest($id)
    {
        $attachment = Attachment::find($id);
        $issue = $attachment->issue;
        if (Gate::denies('viewAttachment', $issue)) {
            return back()->withErrors(['error_message' => __('You are not allowed to download this attachment')]);
        }

        if ($attachment == null) {
            return back()->withErrors(['not_allow_profile' => __('File not found')]);
        } else {
            $file = public_path("storage\attachments\\" . $attachment->hash_file);
            if(file_exists($file)){
                $headers = array('Content-Type'=> 'application/octet-stream');
                return Response::download($file, $attachment->orig_file, $headers);
            } else {
                return back()->withErrors(['not_allow_profile' => __('File not found')]);
            }
        }
    }

    public function setToComplete(Request $request, $id)
    {
        $issue = Issue::find($id);
        if (Gate::denies('reOpenComplete', $issue)) {
            return back()->withErrors(['error_message' => __('You are not allowed to complete this record')]);
        }
        $issue->status = 5;        
        if ($request->rating < 1 && $request->rating > 6) {
            return back()->withErrors(['error_message' => __('Invalid rating')]);
        }
        $issue->rating = $request->rating;
        $issue->remarks_creator = $request->remarks_creator;
        $issue->save();

        if ($issue->resolver_id != null) {
            $issue->resolver->notify(new StatusCompletedNotification($issue));

            $projectlog = new ProjectLog;
            $projectlog->issue_id = $issue->id;
            $projectlog->user_id = auth()->user()->id;
            $projectlog->role_id = auth()->user()->role_id;
            $projectlog->status = $issue->status;
            $projectlog->remarks = 'Rating: ' . $issue->rating . '; Comments: ' . $issue->remarks_creator;
            $projectlog->save();
        }
        $this->addsystemlogs('Rate request - "' . $issue->reff_no . '"');
        return Redirect::to('/issue')->withStatus(__('Issue successfully updated'));
    }

    public function setToReopen(Request $request, $id)
    {
        $issue = Issue::find($id);
        if (Gate::denies('reOpenComplete', $issue)) {
            return back()->withErrors(['error_message' => __('You are not allowed to re-open this record')]);
        }
        $issue->status = 7;
        $issue->reason_for_reopen = $request->reason_for_reopen;

        $issue->rating = null;
        $issue->remarks_creator = null;

        $issue->save();

        if ($issue->resolver_id != null) {
            $issue->resolver->notify(new StatusReOpenedNotification($issue));

            $ids = array(['id' => $issue->resolver->id, 'value' => $issue->resolver->pendingCount()]);
            $this->pushNotif('issue_for_action', $ids);

            $projectlog = new ProjectLog;
            $projectlog->issue_id = $issue->id;
            $projectlog->user_id = auth()->user()->id;
            $projectlog->role_id = auth()->user()->role_id;
            $projectlog->status = $issue->status;
            $projectlog->remarks = $request->reason_for_reopen;
            $projectlog->save();
        }
        $this->addsystemlogs('Reopen request - "' . $issue->reff_no . '"');
        return Redirect::to('/issue')->withStatus(__('Issue successfully updated'));
    }

    public function getValidate(): void
    {
        request()->validate([
            'user_id' => ['required', 'exists:'.(new User)->getTable().',id'],
            'category_id' => ['required', 'exists:'.(new Category)->getTable().',id'],
            'description' => ['required'],
            'work_days' => ['nullable', 'numeric', 'digits_between:1,31'],
            'status' => ['required', 'exists:'.(new Status)->getTable().',id'],
            'resolver_id' => ['required_if:status,==,2,3,4', 'nullable', 'exists:'.(new User)->getTable().',id'],
            'remarks' => ['required_if:status,==,4'],
            'reason_for_rejection' => ['required_if:status,==,6'],
            'reason_for_reopen' => ['required_if:status,==,7'],
            'rating' => ['required_if:status,==,5', 'nullable', 'in:"1","2","3","4","5"'],
            'remarks_creator' => ['required_if:status,==,5']
        ], ['category_id.required' => 'Issue/Request field is required', 
            'description.required' => 'Description field is required', 
            'resolver_id.required_if' => 'Technicians name is required',
            'remarks.required_if' => 'Resolution field is required',
            'reason_for_rejection.required_if' => 'Reason field is required',
            'reason_for_reopen.required_if' => 'Reason field is required',
            'rating.required_if' => 'Rating is required',
            'remarks_creator.required_if' => 'Remarks is required',
        ]);
    }

    

    public function getValidatePriority(): void
    {
        request()->validate([
            'priority' => ['required', 'in:1,2,3'],
        ], ['priority.required' => 'Priority field is required', 
        ]);
    }

    public function pushNotif($myType, $myIDs) {
        $options = array(
            'cluster' => 'ap2',
            'useTLS' => true
        );
        $pusher = new Pusher(
            env('PUSHER_APP_KEY'),
            env('PUSHER_APP_SECRET'),
            env('PUSHER_APP_ID'),
            $options
        );

        $data = ['type' => $myType, 'ids' => $myIDs];
        $pusher->trigger('my-channel', 'my-event', $data);
    }

    public function pushMessage($mymessage, $myissueid, $myuserid, $myusername, $mytime, $myrole) {
        $options = array(
            'cluster' => 'ap2',
            'useTLS' => true
        );
        $pusher2 = new Pusher(
            env('PUSHER_APP_KEY2'),
            env('PUSHER_APP_SECRET2'),
            env('PUSHER_APP_ID2'),
            $options
        );

        $data = ['message' => $mymessage, 'issue_id' => $myissueid, 'user_id' => $myuserid, 'username' => $myusername, 'timestamp' => $mytime, 'role_id' => $myrole];
        $pusher2->trigger('my-channel', 'my-event', $data);
    }

    
    public function pendingIssues()
    { 
        $holidayDays = Holiday::select(DB::raw('(CASE WHEN holidays.repeat = 1 THEN CONCAT("*", RIGHT(holidays.date, 6)) ELSE holidays.date END) AS date'))->get()->pluck('date')->toArray();
        $issue =  auth()->user()->pendTickets();
        return view('issues.index', ['issues' => $issue, 'type' => '1', 'holidayDays' => $holidayDays]);
    }

    public function pastDueIssues()
    { 
        $holidayDays = Holiday::select(DB::raw('(CASE WHEN holidays.repeat = 1 THEN CONCAT("*", RIGHT(holidays.date, 6)) ELSE holidays.date END) AS date'))->get()->pluck('date')->toArray();
        $issue =  auth()->user()->delTickets();
        return view('issues.index', ['issues' => $issue, 'type' => '2', 'holidayDays' => $holidayDays]);
    }

    
    public function completedIssues()
    {
        $holidayDays = Holiday::select(DB::raw('(CASE WHEN holidays.repeat = 1 THEN CONCAT("*", RIGHT(holidays.date, 6)) ELSE holidays.date END) AS date'))->get()->pluck('date')->toArray();
        $issue =  auth()->user()->compTickets();
        return view('issues.index', ['issues' => $issue, 'type' => '3', 'holidayDays' => $holidayDays]);
    }

    
    public function issuesToday()
    { 
        $holidayDays = Holiday::select(DB::raw('(CASE WHEN holidays.repeat = 1 THEN CONCAT("*", RIGHT(holidays.date, 6)) ELSE holidays.date END) AS date'))->get()->pluck('date')->toArray();
        $issue =  auth()->user()->tdyTickets();
        return view('issues.index', ['issues' => $issue, 'type' => '4', 'holidayDays' => $holidayDays]);
    }

    
    public function issuesThisMonth()
    { 
        $holidayDays = Holiday::select(DB::raw('(CASE WHEN holidays.repeat = 1 THEN CONCAT("*", RIGHT(holidays.date, 6)) ELSE holidays.date END) AS date'))->get()->pluck('date')->toArray();
        $issue =  auth()->user()->thisMosTickets();
        return view('issues.index', ['issues' => $issue, 'type' => '5', 'holidayDays' => $holidayDays]);
    }

    
    public function issuesThisQuarter()
    { 
        $holidayDays = Holiday::select(DB::raw('(CASE WHEN holidays.repeat = 1 THEN CONCAT("*", RIGHT(holidays.date, 6)) ELSE holidays.date END) AS date'))->get()->pluck('date')->toArray();
        $issue =  auth()->user()->thisQtrTickets();
        return view('issues.index', ['issues' => $issue, 'type' => '6', 'holidayDays' => $holidayDays]);
    }

    
    public function issuesThisYear()
    { 
        $holidayDays = Holiday::select(DB::raw('(CASE WHEN holidays.repeat = 1 THEN CONCAT("*", RIGHT(holidays.date, 6)) ELSE holidays.date END) AS date'))->get()->pluck('date')->toArray();
        $issue =  auth()->user()->thisYrTickets();
        return view('issues.index', ['issues' => $issue, 'type' => '7', 'holidayDays' => $holidayDays]);
    }

    public function sendmessage(Request $request) {
      if($request->ajax()) {
        $issue = Issue::find($request->issue_id);
        if ($issue != null) {
          if (auth()->user()->can('sendMessage', $issue)) {
            $message = new Message;
            $message->message = json_decode($request->message, true);
            $message->issue_id = $issue->id;
            $message->user_id = auth()->user()->id;
            $message->save();

            $myMsgTime = $message->created_at->format('g:i:s A');

            foreach(User::where('role_id', 4)->get() as $user) {
              if (MessageUser::where('user_id', $user->id)->where('issue_id', $issue->id)->first() == null && $user->id != $message->user_id) {
                $messageuser = new MessageUser;
                $messageuser->issue_id = $message->issue_id;
                $messageuser->user_id = $user->id;
                $messageuser->save();
              }
            }

            if ($message->user_id != $issue->user->id) {
              if (MessageUser::where('user_id', $issue->user->id)->where('issue_id', $issue->id)->first() == null) {
                $messageuser = new MessageUser;
                $messageuser->issue_id = $message->issue_id;
                $messageuser->user_id = $issue->user->id;
                $messageuser->save();
              }
            }

            if ($issue->resolver_id != null) {
              if ($message->user_id != $issue->resolver->id) {
                if (MessageUser::where('user_id', $issue->resolver->id)->where('issue_id', $issue->id)->first() == null) {
                  $messageuser = new MessageUser;
                  $messageuser->issue_id = $message->issue_id;
                  $messageuser->user_id = $issue->resolver->id;
                  $messageuser->save();
                }
              }
            }


            $this->pushMessage($message->message, $issue->id, auth()->user()->id, auth()->user()->name, $myMsgTime, auth()->user()->role_id);

            // $compactVar = ['myMsgTime'];
            return response()->json(['status' => 'success', 'data' => compact('myMsgTime')]);
          } else {
            return response()->json(['status' => 'failed', 'data' => 'not allowed to send message']);
          }
        } else {
          return response()->json(['status' => 'failed', 'data' => 'invalid issue ID']);
        }
      } else {
        return response()->json(['status' => 'failed', 'data' => 'not in ajax form']);
      }
    }

    public function readmessage(Request $request) {
      if($request->ajax()) {
        $issue = Issue::find($request->issue_id);
        if ($issue != null) {
          if (auth()->user()->can('readMessage', $issue)) {
            $messageuser = MessageUser::where('issue_id', $issue->id)->where('user_id', auth()->user()->id)->get();
            if (count($messageuser) > 0) {
              foreach($messageuser as $msguser) {
                $msguser->delete();
              }
            }
            return response()->json(['status' => 'success', 'data' => 'success']);
          } else {
            return response()->json(['status' => 'failed', 'data' => 'not allowed to send message']);
          }
        } else {
          return response()->json(['status' => 'failed', 'data' => 'invalid issue ID']);
        }
      } else {
        return response()->json(['status' => 'failed', 'data' => 'not in ajax form']);
      }
    }
}
