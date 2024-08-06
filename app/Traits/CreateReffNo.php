<?php
namespace App\Traits;

use App\Issue;
use App\Archive;
use DateTime;
use DB;

trait CreateReffNo
{
  public function createreffno() {
    $date = date('Y-m-');
    $last_ref = Issue::where('reff_no', 'LIKE', "{$date}%")->latest('reff_no')->first();
    $last_ref2 = Archive::where('reff_no', 'LIKE', "{$date}%")->latest('reff_no')->first();
    if ($last_ref == null && $last_ref2 == null) {
      $new_ref = 1;
    } else if ($last_ref == null && $last_ref2 != null) {
      $new_ref = intval(substr($last_ref2->reff_no, -4)) + 1;
    } else if ($last_ref != null && $last_ref2 == null) {
      $new_ref = intval(substr($last_ref->reff_no, -4)) + 1;
    } else {
      if ($last_ref->reff_no > $last_ref2->reff_no) {
        $new_ref = intval(substr($last_ref->reff_no, -4)) + 1;
      } else {
        $new_ref = intval(substr($last_ref2->reff_no, -4)) + 1;
      }
    }


    // if ($last_ref == null) {
    //   $new_ref = 1;
    // } else {
    //   $new_ref = intval(substr($last_ref->reff_no, -4)) + 1;
    // }
    return $date . str_pad($new_ref, 4, '0', STR_PAD_LEFT);
  }

  public function getNextId() 
  {
    $statement = DB::select("show table status like 'issues'");
    return str_pad($statement[0]->Auto_increment, 10, '0', STR_PAD_LEFT);
  }
}
