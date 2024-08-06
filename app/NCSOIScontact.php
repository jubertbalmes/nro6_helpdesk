<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NCSOIScontact extends Model
{
    use HasFactory;
    protected $connection = 'mysql2';
    public $table = 'hr_emp_contacts';
}
