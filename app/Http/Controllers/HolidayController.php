<?php

namespace App\Http\Controllers;

use App\Holiday;
use App\Http\Requests\HolidayRequest;
use App\Traits\AddSystemLogs;

class HolidayController extends Controller
{
    use AddSystemLogs;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->authorize('manage-holidays', User::class);
        $holidays = Holiday::all();
        return view('holidays.index', compact('holidays'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('holidays.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\HolidayRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(HolidayRequest $request, Holiday $holiday)
    {
        $holiday->create($request->all());
        $this->addsystemlogs('Add new holiday - "' . $request->name . '"');
        return redirect()->route('holiday.index')->withStatus(__('Holiday successfully added.'));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Holiday  $holiday
     * @return \Illuminate\Http\Response
     */
    public function show(Holiday $holiday)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Holiday  $holiday
     * @return \Illuminate\Http\Response
     */
    public function edit(Holiday $holiday)
    {
        return view('holidays.edit', compact('holiday'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\HolidayRequest  $request
     * @param  \App\Holiday  $holiday
     * @return \Illuminate\Http\Response
     */
    public function update(HolidayRequest $request, Holiday $holiday)
    {
        $this->authorize('manage-holidays', User::class);
        $holiday->update($request->all());
        $this->addsystemlogs('Update holiday - "' . $request->name . '"');
        return redirect()->route('holiday.index')->withStatus(__('Holiday successfully updated.'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Holiday  $holiday
     * @return \Illuminate\Http\Response
     */
    public function destroy(Holiday $holiday)
    {
        $this->authorize('delete', $holiday);
        $this->addsystemlogs('Delete holiday - "' . $holiday->name . '"');
        $holiday->delete();
        return redirect()->route('holiday.index')->withStatus(__('Holiday successfully deleted.'));
    }
}
