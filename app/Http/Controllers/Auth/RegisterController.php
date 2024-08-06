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
namespace App\Http\Controllers\Auth;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use App\Providers\RouteServiceProvider;
use Illuminate\Support\Str;
use Mail;
use App\Notifications\AdminNewUserNotification;
use App\Staff;
use App\Position;
use App\Contact;
use Pusher\Pusher;
use App\SystemLog;
use Illuminate\Http\Request;
use Illuminate\Auth\Events\Registered;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/dashboard';
    // protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    // public function __construct()
    // {
    //     $this->middleware('guest');
    // }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'staff_id' => ['required', 'exists:' . (new Staff)->getConnectionName() . '.' . (new Staff)->getTable() . ',id'],
            'position_id' => ['required', 'exists:' . (new Position)->getConnectionName() . '.' . (new Position)->getTable() . ',id'],
            // 'contact_number' => ['required', 'string', 'max:255'],
            'password' => ['required', 'string', 'min:6', 'confirmed'],
        ]);

        // return Validator::make($data, [
        //     'name' => ['required', 'string', 'max:255'],
        //     'email' => ['required', 'string', 'email', 'max:255', 'unique:users', 'ends_with:@neda.gov.ph'],
        //     'staff' => ['required', 'max:11'],
        //     'contact_number' => ['required', 'string', 'max:255'],
        //     'password' => ['required', 'string', 'min:6', 'confirmed'],
        // ], ['email.ends_with' => 'Use NEDA email only']);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        // dd('Stop');
        // $tmp_password = Str::random(8);

    
        // $email_content = array('name' => $data['name'], 'email' => $data['email'], 'password' => $tmp_password);
        // Mail::send(['html' => 'mail.send_temp_password'], $email_content, function($message) use ($data) {
        //     $message->to($data['email'], $data['name'])->subject
        //         ('[Important] ICTS Issue Tracker - Temporary Password');
        //     $message->from('sdscentralizeddatabase@gmail.com', 'ICTS Helpdesk Admin');
        //     });

        if (substr(strtoupper(trim($data['email'])), -12) == '@NEDA.GOV.PH') {
            $status = 1;
        } else {
            $status = 0;
        }

        $user = User::create([
            'user_id' => null,
            'name' => $data['name'],
            'email' => $data['email'],
            'staff_id' => $data['staff_id'],
            'position_id' => $data['position_id'],
            'role_id' => 3,
            'status' => $status,
            'password' => Hash::make($data['password']),
        ]);

        // $contact = new Contact;
        // $contact->user_id = $user->id;
        // $contact->type = 1;
        // $contact->value = $data['contact_number'];
        // $contact->save();

        $ids = array();
        if ($status == 0) {
            $administrators = User::where('role_id', 1)->get();
            foreach($administrators as $administrator) {
                $administrator->notify(new AdminNewUserNotification($user));
                array_push($ids, ['id' => $administrator->id, 'value' => $administrator->pending_approval_count()]);
            }
        }

        // $contact = new Contact;
        $options = array(
            'cluster' => 'ap2',
            'useTLS' => true
        );

        $pusher = new Pusher(
            env('PUSHER_APP_KEY'),
            env('PUSHER_APP_SECRET'),
            env('PUSHER_APP_ID'),
            $options
        );

        $data = ['type' => 'new_registered_user', 'ids' => $ids];
        $pusher->trigger('my-channel', 'my-event', $data);
        return $user;
    }

    public function showRegistrationForm()
    {
        $staffs = Staff::select('id', 'name', 'abbreviation')->get();
        $positions = Position::all();
        return view('auth.register', compact('staffs', 'positions'));
    }

    /**
     * Handle a registration request for the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\JsonResponse
     */
    public function register(Request $request)
    {
        $this->validator($request->all())->validate();

        event(new Registered($user = $this->create($request->all())));

        $this->guard()->login($user);

        if ($response = $this->registered($request, $user)) {
            return $response;
        }

        $syslog = new SystemLog;
        $syslog->user_id = $user->id;
        $syslog->role_id = $user->role_id;
        $syslog->remarks = 'Registered as new user - "IP: ' . $request->ip() . ', Email: ' . $request->email . '"';
        $syslog->save();

        return $request->wantsJson()
                    ? new JsonResponse([], 201)
                    : redirect($this->redirectPath());
    }
}
