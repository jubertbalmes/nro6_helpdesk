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

use App\User;
use App\Category;
use App\MainCategory;
use App\Http\Requests\CategoryRequest;
use App\Traits\AddSystemLogs;

class CategoryController extends Controller
{
    use AddSystemLogs;
    public function __construct()
    {
        $this->authorizeResource(Category::class);
    }

    /**
     * Display a listing of the categories
     *
     * @param \App\Category  $model
     * @return \Illuminate\View\View
     */
    public function index(Category $model)
    {
        $this->authorize('manage-categories', User::class);

        return view('categories.index', ['categories' => $model->all()]);
    }

    /**
     * Show the form for creating a new category
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        $this->authorize('manage-categories', User::class);
        return view('categories.create', ['maincategories' => MainCategory::all()]);
    }

    /**
     * Store a newly created category in storage
     *
     * @param  \App\Http\Requests\CategoryRequest  $request
     * @param  \App\Category  $model
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(CategoryRequest $request, Category $model)
    {
        $this->authorize('manage-categories', User::class);
        $model->create($request->all());
        $this->addsystemlogs('Add new issue type - "' . $request->name . '"');
        return redirect()->route('category.index')->withStatus(__('Category successfully created.'));
    }

    /**
     * Show the form for editing the specified category
     *
     * @param  \App\Category  $category
     * @return \Illuminate\View\View
     */
    public function edit(Category $category)
    {
        $this->authorize('manage-categories', User::class);
        $maincategories = MainCategory::all();
        return view('categories.edit', compact('category', 'maincategories'));
    }

    /**
     * Update the specified category in storage
     *
     * @param  \App\Http\Requests\CategoryRequest  $request
     * @param  \App\Category  $category
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(CategoryRequest $request, Category $category)
    {
        $this->authorize('manage-categories', User::class);
        $category->update($request->all());
        $this->addsystemlogs('Update issue type - "' . $request->name . '"');
        return redirect()->route('category.index')->withStatus(__('Issue type successfully updated.'));
    }

    /**
     * Remove the specified category from storage
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Category $category)
    {
        $this->authorize('manage-categories', User::class);
        if (!$category->issues->isEmpty()) {
            return redirect()->route('category.index')->withErrors(['with_attached_item' => 'This issue type has items attached and can\'t be deleted.']);
        }
        $this->addsystemlogs('Delete issue type - "' . $category->name . '"');
        $category->delete();
        return redirect()->route('category.index')->withStatus(__('Category successfully deleted.'));
    }
}
