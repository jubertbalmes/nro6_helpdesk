<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use App\Issue;

class StatusAcknowledgeNotification extends Notification implements ShouldQueue
{
    use Queueable;

    private $issue;

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
        if ($this->issue->resolver_id == null) {
            $res_name = '';
        } else {
            $res_name = $this->issue->resolver->name;
        }
        return (new MailMessage)
                    ->subject(config('app.name') . ' - Issue ' . $this->issue->reff_no . ' [Status: Acknowledge/Ongoing]')
                    ->line('Issue       : ' . $this->issue->category->name)
                    ->line('Assigned to : ' . $res_name)
                    ->line('Priority    : ' . $this->issue->prioritydesc())
                    ->line('Description : ' . $this->issue->description)
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
