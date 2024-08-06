<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\User;
use DateTime;

class RemoveUnconfirmedUser extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'delete:unconfirmeduser';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Artisan command to remove unconfirmed user';

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
        $date_minus_60min = new DateTime;
        $date_today = $date_minus_60min;
        $date_minus_60min->modify('-60 minutes');
        foreach(User::where('updated_at', '<=', $date_minus_60min->format('Y-m-d H:i:s'))->whereNull('email_verified_at')->get() as $user) {
            echo str_pad($user->name, 50) . '|' . str_pad($user->email, 50) . '|' . $user->created_at . '|' . $date_today->format('Y-m-d H:i:s') . PHP_EOL;
            $user->delete();
        }
    }
}
