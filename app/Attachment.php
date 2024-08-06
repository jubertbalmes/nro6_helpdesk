<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Attachment extends Model
{
    use HasFactory;
    public $table="attachments";

    public function issue()
    {
        return $this->belongsTo(Issue::class, 'issue_id');
    }
}
