<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProjectLog extends Model
{
    use HasFactory;
    public $table = 'projectlogs';
    protected $connection = 'mysql';

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function mstatus()
    {
        return $this->belongsTo(Status::class, 'status');
    }
}
