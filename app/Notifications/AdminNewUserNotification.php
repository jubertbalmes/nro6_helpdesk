<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use App\User;

class AdminNewUserNotification extends Notification implements ShouldQueue
{
    use Queueable;

    private $user;

    /**
     * Create a new notification instance.
     * @param User $user
     *
     * @return void
     */
    public function __construct(User $user)
    {
        $this->user = $user;
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
                    ->subject(config('app.name') . ' - New user has registered')
                    ->line('New user has registered and requires your approval.')
                    ->line('Name     : ' . $this->user->name)
                    ->line('Email    : ' . $this->user->email)
                    ->line('Staff    : ' . $this->user->mstaff->short_name)
                    ->line('Position : ' . $this->user->position->position_name)
                    ->action('Click here to approve', route('approve', encrypt($this->user->id)))
                    ->line('Thank you for using our application!')
                    ->line('This is a system generated message. Please do not reply.');

                    // ->action('Login to admin module to approve', route('user.index'))
                    // ->action('Click here to approve', route('approve', $this->user->id))
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
