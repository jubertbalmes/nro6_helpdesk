<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\User;
use App\Issue;
use App\MessageUser;
use DateTime;
use App\Notifications\NewMessageNotification;

class NewMessage extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'notify:newmessage';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Artisan command that send notification for un-read messages';

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
      foreach(MessageUser::where('created_at', '<=', $date_minus_60min->format('Y-m-d H:i:s'))->whereNull('notif')->get() as $message) {
        $message->user->notify(new NewMessageNotification($message->issue));
        echo str_pad($message->user_id, 11) . '|' . str_pad($message->issue_id, 11) . '|' . $message->created_at . '|' . $date_today->format('Y-m-d H:i:s') . PHP_EOL;

        $message->notif = 1;
        $message->save();
      }
    }
}
