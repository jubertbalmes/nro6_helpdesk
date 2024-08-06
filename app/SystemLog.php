<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SystemLog extends Model
{
    use HasFactory;
    public $table = 'systemlogs';
    public $timestamps = ["created_at"];
    const UPDATED_AT = null;

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
