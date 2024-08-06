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

use App\Role;
use App\User;
use App\Staff;
use App\Position;
use App\Contact;
use App\Http\Requests\UserRequest;
use Illuminate\Support\Facades\Hash;
use Gate;
use App\Traits\AddSystemLogs;

class UserController extends Controller
{
    use AddSystemLogs;
    public function __construct()
    {
        $this->authorizeResource(User::class);
    }

    /**
     * Display a listing of the users
     *
     * @param  \App\User  $model
     * @return \Illuminate\View\View
     */
    public function index(User $model)
    {
        $this->authorize('manage-users', User::class);
        return view('users.index', ['users' => $model->with('role')->get(), 'roles' => Role::all() ]);
    }

    /**
     * Show the form for creating a new user
     *
     * @param  \App\Role  $model
     * @return \Illuminate\View\View
     */
    public function create(Role $model)
    {
        return view('users.create', ['roles' => $model->get(['id', 'name']), 'staffs' => Staff::all(), 'positions' => Position::all() ]);
    }

    /**
     * Store a newly created user in storage
     *
     * @param  \App\Http\Requests\UserRequest  $request
     * @param  \App\User  $model
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(UserRequest $request, User $model)
    {
        $user = $model->create($request->merge([
            'picture' => $request->photo ? $request->photo->store('profile', 'public') : null,
            'password' => Hash::make($request->get('password')),
            'employee_id' => null,
            'status' => 1,
            'email_verified_at' => date("Y-m-d H:i:s")
        ])->all());

        // Contact::where('user_id', $user->id)->delete();
            
        // $contact = new Contact;
        // $contact->user_id = $user->id;
        // $contact->type = 1;
        // $contact->value = $request->cell_number;
        // $contact->save();

        // $contact = new Contact;
        // $contact->user_id = $user->id;
        // $contact->type = 2;
        // $contact->value = $request->tel_number;
        // $contact->save();

        // $contact = new Contact;
        // $contact->user_id = $user->id;
        // $contact->type = 4;
        // $contact->value = $request->alt_email;
        // $contact->save();
        $this->addsystemlogs('Add new user - "' . $user->name . '"');

        return redirect()->route('user.index')->withStatus(__('User successfully created.'));
    }

    /**
     * Show the form for editing the specified user
     *
     * @param  \App\User  $user
     * @param  \App\Role  $model
     * @return \Illuminate\View\View
     */
    public function edit(User $user, Role $model, Staff $staff)
    {
        // dd($user->cpno());
        return view('users.edit', ['user' => $user->load('role'), 'roles' => $model->get(['id', 'name']), 'staffs' => $staff->get(['id', 'name', 'abbreviation']), 'positions' => Position::get(['id', 'name'])]);
    }

    /**
     * Update the specified user in storage
     *
     * @param  \App\Http\Requests\UserRequest  $request
     * @param  \App\User  $user
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(UserRequest $request, User $user)
    {
        $hasPassword = $request->get('password');

        if ($user->role_id == 2 || $user->role_id == 3) {
            if ($user->role_id != $request->role_id) {
                if (!$user->issues->isEmpty()) {
                    return redirect()->route('user.index')->withErrors(['with_attached_item' => 'This user has issues attached and can\'t be updated.']);
                }
            }
        }

        $user->update(
            $request->merge([
                'picture' => $request->photo ? $request->photo->store('profile', 'public') : $user->picture,
                'password' => Hash::make($request->get('password'))
            ])->except([$hasPassword ? '' : 'password'])
        );
        $this->addsystemlogs('Update user - "' . $user->name . '"');

        // Contact::where('user_id', $user->id)->delete();
            
        // $contact = new Contact;
        // $contact->user_id = $user->id;
        // $contact->type = 1;
        // $contact->value = $request->cell_number;
        // $contact->save();

        // $contact = new Contact;
        // $contact->user_id = $user->id;
        // $contact->type = 2;
        // $contact->value = $request->tel_number;
        // $contact->save();

        // $contact = new Contact;
        // $contact->user_id = $user->id;
        // $contact->type = 4;
        // $contact->value = $request->alt_email;
        // $contact->save();

        return redirect()->route('user.index')->withStatus(__('User successfully updated.'));
    }

    /**
     * Remove the specified user from storage
     *
     * @param  \App\User  $user
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(User $user)
    {
        $this->addsystemlogs('Delete user - "' . $user->name . '"');
        if (!$user->issues->isEmpty()) {
            return redirect()->route('user.index')->withErrors(['with_attached_item' => 'This user has issues attached and can\'t be deleted.']);
        }
        $user->delete();

        return redirect()->route('user.index')->withStatus(__('User successfully deleted.'));
    }

    
    public function approve($id)
    {

        $user = User::find(decrypt($id));
        if (Gate::denies('approve', $user)) {
            return back()->withErrors(['error_message' => __('You are not allowed to approve this user')]);
        }
        if ($user->status == 0) {
            $user->status = 1;
        }
        $user->save();
        $this->addsystemlogs('Approve user - "' . $user->name . '"');
        return back()->withStatus(__('User successfully approved'));
    }

    
    public function reject($id)
    {

        $user = User::find(decrypt($id));
        if (Gate::denies('approve', $user)) {
            return back()->withErrors(['error_message' => __('You are not allowed to reject this user')]);
        }
        if ($user->status == 0) {
            $user->status = 3;
        }
        $user->save();
        $this->addsystemlogs('Rejected user - "' . $user->name . '"');
        // dd('Dumaan');
        return back()->withStatus(__('User has been rejected'));
    }

    
    public function active_inactive($id)
    {
        $user = User::find($id);
        if (Gate::denies('activate', $user)) {
            return back()->withErrors(['error_message' => __('You are not allowed to activate/deactivate this user')]);
        }
        if ($user->status == 1) {
            $user->status = 2;
            $msg_str = 'deactivated';
            $this->addsystemlogs('Set user inactive - "' . $user->name . '"');
        } else {
            $user->status = 1;
            $msg_str = 'activated';
            $this->addsystemlogs('Set user active - "' . $user->name . '"');
        }
        $user->save();
        return back()->withStatus(__('User successfully ' . $msg_str));
    }
}
