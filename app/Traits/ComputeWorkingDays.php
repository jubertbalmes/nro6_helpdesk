<?php
namespace App\Traits;

use App\Holiday;
use DateTime;
use DB;
use DatePeriod;
use DateInterval;

trait ComputeWorkingDays
{
    public function number_of_working_days($from, $to) {
        $workingDays = [1, 2, 3, 4, 5]; # date format = N (1 = Monday, ...)
        // $holidayDays = ['*-12-25', '*-01-01', '2013-12-23']; # variable and fixed holidays
        $holidayDays = Holiday::select(DB::raw('(CASE WHEN holidays.repeat = 1 THEN CONCAT("*", RIGHT(holidays.date, 6)) ELSE holidays.date END) AS date'))->get()->pluck('date')->toArray();
    
        $from = new DateTime($from);
        $to = new DateTime($to);
        $to->modify('+1 day');
        $interval = new DateInterval('P1D');
        $periods = new DatePeriod($from, $interval, $to);
    
        $days = 0;
        foreach ($periods as $period) {
            if (!in_array($period->format('N'), $workingDays)) continue;
            if (in_array($period->format('Y-m-d'), $holidayDays)) continue;
            if (in_array($period->format('*-m-d'), $holidayDays)) continue;
            $days++;
        }
        return $days - 1;
    }
}
