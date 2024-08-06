<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class DeletePendingNonNEDAUser extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'delete:PendingNonNEDAUser';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Artisan command to delete all Pending user(non NEDAn email)';

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
        // SELECT TRIM(RIGHT(`t1`.`email`, LENGTH(`t1`.`email`)-INSTR(`t1`.`email`, '@'))) AS `domain` FROM `users` AS `t1` where `t1`.`domain` != 'neda.gov.ph' 
        $date_today = new DateTime;
        foreach(User::whereDate('updated_at', '<=', now()->subDays(7))->where('status', 0)->where('email', '!=', '@neda.gov.ph')->get() as $user) {
            echo '2|' . str_pad($user->name, 50) . '|' . str_pad($user->email, 50) . '|' . $user->created_at . '|' . $date_today->format('Y-m-d H:i:s') . PHP_EOL;
            $user->delete();    
        }
    }
}
