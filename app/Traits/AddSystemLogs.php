<?php
namespace App\Traits;

use App\SystemLog;
use DateTime;
use DB;

trait AddSystemLogs
{
    public function addsystemlogs($activity) {
        $syslog = new SystemLog;
        $syslog->user_id = auth()->user()->id;
        $syslog->role_id = auth()->user()->role_id;
        $syslog->remarks = $activity;
        $syslog->save();
    }

    public function addsystemlogsnonauth($activity) {
        $syslog = new SystemLog;
        $syslog->user_id = null;
        $syslog->role_id = null;
        $syslog->remarks = $activity;
        $syslog->save();
    }
}
