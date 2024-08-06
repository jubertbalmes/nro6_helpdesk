<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\AddSystemLogs;
use App\Traits\CreateReffNo;
use Illuminate\Support\Facades\Redirect;
use App\Issue;
use App\User;
use App\Archive;
use Gate;
use App\Status;
use App\Category;
use Response;
use Pusher\Pusher;
use App\ProjectLog;
use DateTime;
use DB;

class ArchiveController extends Controller
{
  use AddSystemLogs, CreateReffNo;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      $archives = Archive::all();
      return view('archives.index', compact('archives'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Archive $archive)
    {
      if (Gate::denies('deletepermanently', $archive)) {
        return back()->withErrors(['error_message' => __('You are not allowed to delete this archive')]);
      }

      $this->addsystemlogs('Delete request - "' . $archive->reff_no . '"');
      $archive->delete();
      return back()->withStatus(__('Archive successfully deleted'));
    }

    
    public function restore(Archive $archive)
    {
      if (Gate::denies('restore', auth()->user())) {
        return back()->withErrors(['error_message' => __('You are not allowed to restore archive')]);
      }

      $this->addsystemlogs('Restore request - "' . $archive->reff_no . '"');

      $issue = new Issue;
      $issue->id = $archive->id;
      $issue->reff_no = $archive->reff_no;
      $issue->user_id = $archive->user_id;
      $issue->category_id = $archive->category_id;
      $issue->work_days = $archive->work_days;
      $issue->priority = $archive->priority;
      $issue->description = $archive->description;
      $issue->steps_to_replicate = $archive->steps_to_replicate;
      $issue->status = $archive->status;
      $issue->resolver_id = $archive->resolver_id;
      $issue->assigned_by_system = $archive->assigned_by_system;
      $issue->remarks = $archive->remarks;
      $issue->rejected_id = $archive->rejected_id;
      $issue->reason_for_rejection = $archive->reason_for_rejection;
      $issue->reason_for_reopen = $archive->reason_for_reopen;
      $issue->rating = $archive->rating;
      $issue->remarks_creator = $archive->remarks_creator;
      $issue->started_at = $archive->started_at;
      $issue->completed_at = $archive->completed_at;
      $issue->created_at = $archive->created_at;
      $issue->updated_at = $archive->updated_at;
      $issue->save();

      $archive->delete();
      return back()->withStatus(__('Archive successfully restored'));
    }
}
