<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Staff;
use App\Traits\AddSystemLogs;

class StaffController extends Controller
{
    use AddSystemLogs;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Staff $model)
    {
        $this->authorize('manage-staffs', User::class);
        return view('staffs.index', ['staffs' => $model->get()]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->authorize('manage-staffs', User::class);
        return view('staffs.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->authorize('manage-staffs', User::class);
        $staff = new Staff;
        $staff->name = $request->name;
        $staff->abbreviation = $request->abbreviation;
        $staff->voip = $request->voip;
        $staff->group_id = 0;
        $staff->save();
        $this->addsystemlogs('Add new staff - "' . $staff->name . '"');
        // return back()->withStatus(__('Staff successfully created'));
        return redirect()->route('staff.index')->withStatus(__('Staff successfully updated.'));
        /* return Redirect::to('/issue')->withStatus(__('Issue successfully updated')); */
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Staff $staff)
    {
        $this->authorize('manage-staffs', User::class);
        return view('staffs.edit', compact('staff'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Staff $staff)
    {
        $this->authorize('manage-staffs', User::class);
        $staff->name = $request->name;
        $staff->abbreviation = $request->abbreviation;
        $staff->voip = $request->voip;
        $staff->group_id = 0;
        $staff->save();
        $this->addsystemlogs('Update staff - "' . $staff->name . '"');
        return redirect()->route('staff.index')->withStatus(__('Staff successfully Updated.'));
/*         return back()->withStatus(__('Staff successfully Updated'));
 */    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Staff $staff)
    {
        $this->authorize('manage-staffs', User::class);
        $this->addsystemlogs('Delete staff - "' . $staff->name . '"');
        $staff->delete();
        return redirect()->route('staff.index')->withStatus(__('Staff successfully deleted.'));
    }
}
