<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\User;
use App\Issue;
use App\Holiday;
use DateTime;
use App\ProjectLog;
use DB;
use App\Notifications\ForRatingNotification;
use App\Traits\ComputeWorkingDays;

class CloseTicket extends Command
{

    use ComputeWorkingDays;

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'close:ticket';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Artisan command that close all resolved tickets older than 3 days';

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
            $mydate = new DateTime;
            $issues = Issue::where('status', 4)->get();
            foreach($issues as $issue) {
                $last_updated = $issue->updated_at;
                $mDays = $this->number_of_working_days($issue->updated_at->format("Y-m-d"), $mydate->format("Y-m-d"));
                if ($mDays >= 3) {
                    $issue->status = 5;
                    $issue->rating = 5;
                    $issue->remarks_creator = '(Auto-rating)';
                    $issue->save();

                    $projectlog = new ProjectLog;
                    $projectlog->issue_id = $issue->id;
                    $projectlog->user_id = 0;
                    $projectlog->role_id = 0;
                    $projectlog->status = $issue->status;
                    $projectlog->remarks = '(Auto-close)';
                    $projectlog->save();

                    echo str_pad($issue->id, 6) . '|' . str_pad($issue->category->name, 50) . '|' . str_pad($issue->user->name, 50) . '|' . str_pad($issue->prioritydesc(), 6) . '|' . $last_updated->format('Y-m-d H:i:s') . '|' . $mydate->format('Y-m-d H:i:s') . PHP_EOL;
                } elseif ($mDays >= 2 || $mDays == 1) {
                    $issue->user->notify(new ForRatingNotification($issue));
                }
            }
        }
    }
}
