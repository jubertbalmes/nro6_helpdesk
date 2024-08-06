<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Issue;
use App\MessageUser;

class Issue extends Model
{
    use HasFactory;
    public $table="issues";
    protected $connection = 'mysql';

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function resolver()
    {
        return $this->belongsTo(User::class, 'resolver_id');
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function reject()
    {
        return $this->belongsTo(User::class, 'rejected_id');
    }

    public function mstatus()
    {
        return $this->belongsTo(Status::class, 'status');
    }

    public function attachment()
    {
        return $this->hasMany(Attachment::class);
    }

    public function messages()
    {
        return $this->hasMany(Message::class);
    }

    public function prioritydesc()
    {
        if ($this->priority == 1) {
            return 'Low';
        } elseif ($this->priority == 2) {
            return 'Medium';
        } else {
            return 'High';
        }
    }

    public function hasMessage()
    {
      if(MessageUser::where('issue_id', $this->id)->where('user_id', auth()->user()->id)->first() != null) {
        return true;
      } else {
        return false;
      }
    }
}
