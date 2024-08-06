<?php

namespace App\Console;

use App\Console\Commands\DeleteOldUsers;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // if (env('IS_DEMO')){
        //     $schedule->command('db:seed')->daily();
        // }

        // To determine by windows task scheduler if laravels scheduler is running by checking the modified date of scheduler.log
        // $schedule->command('update:schedulerfile')->everyMinute()->sendOutputTo('scheduler.log');


        $schedule->command('delete:unconfirmeduser')->everyMinute()->withoutOverlapping()->appendOutputTo('deletedUserRequest.log');
        $schedule->command('assign:ticket')->weekdays()->everyMinute()->between('7:00', '18:00')->withoutOverlapping()->appendOutputTo('assignedTicket.log');
        $schedule->command('close:ticket')->weekdays()->at('7:00')->withoutOverlapping()->appendOutputTo('closeTicket.log');
        $schedule->command('notify:newmessage')->everyMinute()->withoutOverlapping()->appendOutputTo('newMesageNotifiedUser.log');


        // $schedule->command('close:ticket')->everyMinute()->withoutOverlapping()->appendOutputTo('closeTicket.log');
    }

    public function scheduleTimezone()
    {
        return 'Asia/Manila';
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
