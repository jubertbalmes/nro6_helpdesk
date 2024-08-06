<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use App\Issue;

class StatusReOpenedNotification extends Notification implements ShouldQueue
{
    use Queueable;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(Issue $issue)
    {
        $this->issue = $issue;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->subject(config('app.name') . ' - Issue ' . $this->issue->reff_no . ' has been reopened')
                    ->line('Owner       : ' . $this->issue->user->name)
                    ->line('Issue       : ' . $this->issue->category->name)
                    ->line('Priority    : ' . $this->issue->prioritydesc())
                    ->line('Description : ' . $this->issue->description)
                    ->line('Reason      : ' . $this->issue->reason_for_reopen)
                    ->action('Click here to view more details', route('issue.edit', encrypt($this->issue->id)))
                    ->line('Thank you for using our application!')
                    ->line('This is a system generated message. Please do not reply.');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
