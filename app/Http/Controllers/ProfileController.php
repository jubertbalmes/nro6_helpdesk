<?php
/*

=========================================================
* Argon Dashboard PRO - v1.0.0
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-dashboard-pro-laravel
* Copyright 2018 Creative Tim (https://www.creative-tim.com) & UPDIVISION (https://www.updivision.com)

* Coded by www.creative-tim.com & www.updivision.com

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

*/
namespace App\Http\Controllers;

use Gate;
use App\User;
use App\Position;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\ProfileRequest;
use App\Http\Requests\PasswordRequest;
use DateTime;
use App\Staff;
use App\Contact;
use Illuminate\Http\Request;
use App\Traits\AddSystemLogs;

class ProfileController extends Controller
{
    use AddSystemLogs;
    /**
     * Show the form for editing the profile.
     *
     * @return \Illuminate\View\View
     */
    public function edit()
    {
        $staffs = Staff::select('id', 'name', 'abbreviation')->get();
        $positions = Position::get(['id', 'name']);
        return view('profile.edit', compact('staffs', 'positions'));
    }

    /**
     * Update the profile
     *
     * @param  \App\Http\Requests\ProfileRequest  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(ProfileRequest $request)
    {
        if (Gate::denies('update-profile', auth()->user())) {
            return back()->withErrors(['not_allow_profile' => __('You are not allowed to change data for a default user.')]);
        }

        if (Gate::denies('update-email', auth()->user()) && $request->email != auth()->user()->email) {
            return back()->withErrors(['not_allow_profile' => __('You are not allowed to change email for a non admin user.')]);
        }

        // if ((auth()->user()->cpno() != $request->cell_number) || (auth()->user()->telno() != $request->tel_number) || (auth()->user()->alt_email() != $request->alt_email)) {
        //     Contact::where('user_id', auth()->user()->id)->delete();
            
        //     $contact = new Contact;
        //     $contact->user_id =  auth()->user()->id;
        //     $contact->type = 1;
        //     $contact->value = $request->cell_number;
        //     $contact->save();

        //     $contact = new Contact;
        //     $contact->user_id =  auth()->user()->id;
        //     $contact->type = 2;
        //     $contact->value = $request->tel_number;
        //     $contact->save();

        //     $contact = new Contact;
        //     $contact->user_id =  auth()->user()->id;
        //     $contact->type = 4;
        //     $contact->value = $request->alt_email;
        //     $contact->save();

        //     auth()->user()->employee_id = null;
        // }

        $tmpStr = '';
        if (auth()->user()->isAdmin()) {
            auth()->user()->role_id = auth()->user()->role_id;
        }
        if ($request->hasFile('photo')) {
            auth()->user()->picture = $request->photo ? $request->photo->store('profile', 'public') : null;
            $tmpStr .= "Photo, ";
        }

        if (auth()->user()->name != $request->name) {
            $tmpStr .= "Name, ";
        }
        if ( auth()->user()->staff_id != $request->staff_id) {
            $tmpStr .= "Staff, ";
        }
        if ( auth()->user()->position_id != $request->position_id) {
            $tmpStr .= "Position, ";
        }
        if ( auth()->user()->email != $request->email) {
            $tmpStr .= "Email, ";
        }
        if ( auth()->user()->voip != $request->voip) {
            $tmpStr .= "VoIP, ";
        }

        if ($tmpStr != '') {
            $this->addsystemlogs('Update profile (' . substr($tmpStr, 0, -2) . ')');
        } 

        auth()->user()->name = $request->name;
        auth()->user()->staff_id = $request->staff_id;
        auth()->user()->position_id = $request->position_id;
        auth()->user()->email = $request->email;
        auth()->user()->voip = $request->voip;
        auth()->user()->update();

        // auth()->user()->update(
        //     $request->merge(['picture' => $request->photo ? $request->photo->store('profile', 'public') : null])
        //             ->except([$request->hasFile('photo') ? '' : 'picture'])
        // );



        return back()->withStatus(__('Profile successfully updated.'));
    }

    /**
     * Change the password
     *
     * @param  \App\Http\Requests\PasswordRequest  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function password(PasswordRequest $request)
    {
        if (Gate::denies('update-password', auth()->user())) {
            return back()->withErrors(['not_allow_profile' => __('You are not allowed to change the password for a default user.')]);
        }

        // if (auth()->user()->status == 3) {
        //     auth()->user()->update(['password' => Hash::make($request->get('password')), 'status' => 1]);
        // } else {
        //     auth()->user()->update(['password' => Hash::make($request->get('password'))]);
        // }
        auth()->user()->update(['password' => Hash::make($request->get('password'))]);
        $this->addsystemlogs('Update profile password');

        return back()->withStatus(__('Password successfully updated.'));
    }

    
    public function update_photo(Request $request)
    {
        // dd($request->photoModalX);
        if (Gate::denies('update-profile', auth()->user())) {
            return back()->withErrors(['not_allow_profile' => __('You are not allowed to change data for a default user.')]);
        }

        request()->validate([
            'photoModalX' => ['nullable', 'image'],
        ]);

        
        if ($request->hasFile('photoModalX')) {
            auth()->user()->picture = $request->photoModalX ? $request->photoModalX->store('profile', 'public') : null;
            $this->addsystemlogs('Update profile photo');
        }
        auth()->user()->update();

        return back()->withStatus(__('Profile photo successfully updated.'));
    }
}
