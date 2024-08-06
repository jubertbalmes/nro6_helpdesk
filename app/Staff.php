<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Staff extends Model
{
    // use HasFactory;
    protected $connection = 'mysql';
    public $table = 'staffs';
}
