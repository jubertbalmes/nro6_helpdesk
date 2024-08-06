<?php

namespace App\Http\Controllers;

use App\MainCategory;
use Illuminate\Http\Request;
use App\Http\Requests\MainCategoryRequest;
use App\Traits\AddSystemLogs;

class MainCategoryController extends Controller
{
    use AddSystemLogs;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      $this->authorize('manage-maincategory', User::class);

      return view('maincategories.index', ['maincategories' => MainCategory::all()]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
      $this->authorize('manage-maincategory', User::class);
      return view('maincategories.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(MainCategoryRequest $request, MainCategory $maincategory)
    {
      $this->authorize('manage-maincategory', User::class);
      $maincategory->create($request->all());
      $this->addsystemlogs('Add new category - "' . $request->name . '"');
      return redirect()->route('maincategory.index')->withStatus(__('Category successfully created.'));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\MainCategory  $mainCategory
     * @return \Illuminate\Http\Response
     */
    public function show(MainCategory $maincategory)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\MainCategory  $mainCategory
     * @return \Illuminate\Http\Response
     */
    public function edit(MainCategory $maincategory)
    {
      $this->authorize('manage-maincategory', User::class);
      return view('maincategories.edit', compact('maincategory'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\MainCategory  $mainCategory
     * @return \Illuminate\Http\Response
     */
    public function update(MainCategoryRequest $request, MainCategory $maincategory)
    {
      $this->authorize('manage-maincategory', User::class);
      $maincategory->update($request->all());
      $this->addsystemlogs('Update category - "' . $request->name . '"');
      return redirect()->route('maincategory.index')->withStatus(__('Category successfully updated.'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\MainCategory  $mainCategory
     * @return \Illuminate\Http\Response
     */
    public function destroy(MainCategory $maincategory)
    {
      $this->authorize('manage-maincategory', User::class);
      if (!$maincategory->categories->isEmpty()) {
        return redirect()->route('maincategory.index')->withErrors(['with_attached_item' => 'This category has items attached and can\'t be deleted.']);
      }
      $this->addsystemlogs('Delete category - "' . $maincategory->name . '"');
      $maincategory->delete();
      return redirect()->route('maincategory.index')->withStatus(__('Category successfully deleted.'));
    }
}
