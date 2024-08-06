<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

use App\Organization;
use App\User;


class OrganizationController extends Controller
{
    // public function __construct()
    // {
    //     $this->authorizeResource(Organization::class);
    // }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Organization $model)
    {
        // $this->authorize('manage-staffs', User::class);
        return view('organizations.index', ['organizations' => $model->get()]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('organizations.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $organization = new Organization;
        $organization->org_code = $request->org_code;
        $organization->short_name = $request->short_name;
        $organization->name = $request->name;
        $organization->save();
    return back()->withStatus(__('Organization successfully created'));
/*         return Redirect::to('/position')->withStatus(__('Organization successfully updated')); 
 */    }

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
    public function edit(Organization $organization)
    {
        return view('organizations.edit', compact('organization'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,  Organization $organization)
    {
        /*  $staff = new Staff; */
        $organization->org_code = $request->org_code;
        $organization->short_name = $request->short_name;
        $organization->name = $request->name;
         $organization->save();
         return back()->withStatus(__('Organization successfully Updated'));
     }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Organization $organization)
    {
        $organization->delete();

        return redirect()->route('organization.index')->withStatus(__('Organization successfully deleted.'));
    }
}
