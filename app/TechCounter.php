<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TechCounter extends Model
{
    use HasFactory;
    protected $connection = 'mysql';
    public $table = 'techcounter';
    public $timestamps = false;
}
