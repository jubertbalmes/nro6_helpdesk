<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\SystemLog;

class SystemLogsController extends Controller
{
    public function systemlogs() {
        $this->authorize('view-logs', User::class);
        $systemlogs = SystemLog::all();
        return view('systemlogs.index', compact('systemlogs'));
    }
}
