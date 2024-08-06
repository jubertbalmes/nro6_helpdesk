<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\User;
use App\Issue;
use App\ProjectLog;
use App\TechCounter;
use App\Holiday;
use DateTime;
use DB;
use Pusher\Pusher;
use App\Notifications\StatusAssignNotification;
use App\Notifications\IssueAssignNotification;
use App\Traits\CreateReffNo;
use App\Traits\AddSystemLogs;

class AssignTicket extends Command
{
    use AddSystemLogs, CreateReffNo;
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'assign:ticket';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Artisan command that assign ticket with submitted status';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $holidayDays = Holiday::select(DB::raw('(CASE WHEN holidays.repeat = 1 THEN CONCAT("*", RIGHT(holidays.date, 6)) ELSE holidays.date END) AS date'))->get()->pluck('date')->toArray();
        if (in_array(date('Y-m-d'), $holidayDays) || in_array(date('*-m-d'), $holidayDays)) {
            // Do nothing
        } else {
            $date_minus_60min = new DateTime;
            $date_today = $date_minus_60min;
            $date_minus_60min->modify('-60 minutes');

            foreach(Issue::where('created_at', '<=', $date_minus_60min->format('Y-m-d H:i:s'))->where('status', 1)->whereNull('resolver_id')->get() as $issue) {
                // $user = User::where('users.role_id', 2)->where('users.status', 1)->leftJoin('issues', function($q)
                // {
                //     $q->on('users.id', '=', 'issues.resolver_id')
                //         ->whereIn('issues.status', [2, 3, 7]);
                // })->select('users.id', DB::raw("COUNT(issues.id) as mcount"))->groupBy('users.id')->orderBy('mcount')->first();
                $user = User::where('users.role_id', 2)
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

                if ($user != null) {


                    $techcounter = TechCounter::where('user_id', $user->id)->first();
                    if ($techcounter != null) {
                        $techcounter->counter = $techcounter->counter + 1;
                    } else {
                        $techcounter = new TechCounter;
                        $techcounter->user_id = $user->id;
                        $techcounter->counter = 1;
                    }
                    $techcounter->save();

                    if($issue->reff_no == null || substr($issue->reff_no, 0, 4) == 'TEMP') {
                        $issue->reff_no = $this->createreffno();
                        $this->addsystemlogsnonauth('Create permanent refference number - "' . $issue->reff_no . '"');
                    }

                    $issue->status = 2;
                    $issue->resolver_id = $user->id;
                    $issue->assigned_by_system = 1;
                    $now = new DateTime;
                    $issue->started_at = $now->format('Y-m-d H:i:s');
                    $issue->save();
                    $issue->user->notify(new StatusAssignNotification($issue));
                    $issue->resolver->notify(new IssueAssignNotification($issue));
                    $ids = array(['id' => $issue->resolver->id, 'value' => $issue->resolver->pendingCount()]);
                    $users = User::where(function ($query) {$query->where('role_id', 1)->orWhere('role_id', 4);})->get();
                    foreach($users as $my_user) {
                        array_push($ids, ['id' => $my_user->id, 'value' => $my_user->pendingCount()]);
                    }
                    $this->pushNotif('issue_for_action', $ids);

                    $projectlog = new ProjectLog;
                    $projectlog->issue_id = $issue->id;
                    $projectlog->user_id = 0;
                    $projectlog->role_id = 0;
                    $projectlog->status = $issue->status;
                    $projectlog->remarks = $issue->resolver->name;
                    $projectlog->save();

                    echo str_pad($issue->id, 6) . '|' . str_pad($issue->category->name, 50) . '|' . str_pad($issue->user->name, 50) . '|' . str_pad($issue->prioritydesc(), 6) . '|' . $date_today->format('Y-m-d H:i:s') . PHP_EOL;
                }
            }
        }
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
}
