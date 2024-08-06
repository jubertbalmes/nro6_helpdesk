<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MessageUser extends Model
{
    use HasFactory;
    
    // public $timestamps = false;
    public $timestamps = ["created_at"];
    const UPDATED_AT = null;
    
    public $table = 'message_user';

    public function user()
    {
      return $this->belongsTo(User::class, 'user_id');
    }

    public function issue()
    {
      return $this->belongsTo(Issue::class, 'issue_id');
    }
}
