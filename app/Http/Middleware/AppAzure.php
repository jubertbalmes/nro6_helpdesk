<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

use RootInc\LaravelAzureMiddleware\Azure as Azure;
use Microsoft\Graph\Graph;
use Microsoft\Graph\Model;

use Auth;
use App\User;
use App\Position;
use App\Staff;
use Str;
use Illuminate\Support\Facades\Hash;

class AppAzure extends Azure
{
    protected function success(Request $request, $access_token, $refresh_token, $profile)
    {
        $graph = new Graph();
        $graph->setAccessToken($access_token);

        $graph_user = $graph->createRequest("GET", "/me")
                      ->setReturnType(Model\User::class)
                      ->execute();
        
        $email = strtolower($graph_user->getUserPrincipalName());
        $staff = Staff::where('name', $graph_user->getOfficeLocation())->first();
        if ($staff == null) {
            $staff_org_code = '104';
        } else {
            $staff_org_code = $staff->id;
        }
        $position = Position::where('name', $graph_user->getJobTitle())->first();
        if ($position == null) {
            $position = new Position;
            $position->name = $graph_user->getJobTitle();
            $position->save();
        }

        $user = User::firstOrCreate(['email' => $email], [
            'email' => $email,
            'employee_id' => null,
            'name' => $graph_user->getDisplayName(),
            'email_verified_at' => date("Y-m-d H:i:s"),
            'staff_id' => $staff_org_code,
            'position_id' => $position->id,
            'password' => Hash::make(Str::random(10)),
            'role_id' => 3,
            'status' => 1,
        ]);

        Auth::login($user, true);

        return parent::success($request, $access_token, $refresh_token, $profile);

    }
    
    protected function redirect(Request $request)
    {
        if (Auth::user() !== null)
        {
            return $this->azure($request);
        }
        else
        {
            return parent::redirect($request);
        }
    }
}
