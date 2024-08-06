<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
  return redirect('login');
});


Auth::routes(['verify' => true]);
// Route::get('/dashboard', function () {
//     return view('dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');


// Route::get('home', 'HomeController@index')->name('home');
// Route::get('dashboard', 'HomeController@index')->name('home');
Route::get('pricing', 'ExamplePagesController@pricing')->name('page.pricing');
Route::get('lock', 'ExamplePagesController@lock')->name('page.lock');
Route::get('error', ['as' => 'page.error', 'uses' => 'ExamplePagesController@error']);

Route::group(['middleware' => 'guest'], function () {
  Route::get('/login', '\app\Http\Controllers\Auth\LoginController@showLoginForm')->name('login');
  // Route::get('/login/ms365', '\app\Http\Controllers\Auth\LoginController@loginms365')->name('loginms365');
  // Route::get('/login/ms365/redirect', '\app\Http\Controllers\Auth\LoginController@loginms365redirect')->name('loginms365redirect');

  Route::get('/login/azure', '\App\Http\Middleware\AppAzure@azure')
    ->name('azure.login');
Route::get('/login/azurecallback', '\App\Http\Middleware\AppAzure@azurecallback')
    ->name('azure.callback');
Route::get('/logout/azure', '\App\Http\Middleware\AppAzure@azurelogout')
    ->name('azure.logout');
});

Route::group(['middleware' => 'auth'], function () {
    Route::get('home', 'HomeController@index')->name('home');
    Route::get('dashboard', 'HomeController@index')->name('dashboard');
    Route::get('user/pending', 'PendingController@showpending')->name('pending.notify');
    Route::resource('maincategory', 'MainCategoryController', ['except' => ['show']]);
    Route::resource('category', 'CategoryController', ['except' => ['show']]);
    Route::resource('tag', 'TagController', ['except' => ['show']]);
    Route::resource('item', 'ItemController', ['except' => ['show']]);
    Route::resource('role', 'RoleController', ['except' => ['show', 'destroy']]);
    Route::resource('user', 'UserController', ['except' => ['show']]);
    Route::resource('holiday', 'HolidayController', ['except' => ['show']]);
    Route::resource('staff', 'StaffController', ['except' => ['show']]);
    Route::resource('issue', 'IssueController', ['except' => ['show']]);
    Route::resource('archive', 'ArchiveController', ['except' => ['show']]);
    
    Route::post('archive/{archive}/restore', ['as' => 'archive.restore', 'uses' => 'ArchiveController@restore']);

    Route::get('issue/{id}/{mtype}', 'IssueController@edit')->name('view.message');

    Route::get('systemlogs', 'SystemLogsController@systemlogs')->name('view.logs');
    
    Route::get('/overAllIssues', 'IssueController@overAllIssues')->name('overAllIssues');
    Route::get('/pastDueIssues', 'IssueController@pastDueIssues')->name('pastDueIssues');
    Route::get('/pendingIssues', 'IssueController@pendingIssues')->name('pendingIssues');
    Route::get('/completedIssues', 'IssueController@completedIssues')->name('completedIssues');
    // Route::resource('position', 'PositionController', ['except' => ['show']]);
    // Route::resource('organization', 'OrganizationController', ['except' => ['show']]);
    
    Route::get('/issuesToday', 'IssueController@issuesToday')->name('issuesToday');
    Route::get('/issuesThisMonth', 'IssueController@issuesThisMonth')->name('issuesThisMonth');
    Route::get('/issuesThisQuarter', 'IssueController@issuesThisQuarter')->name('issuesThisQuarter');
    Route::get('/issuesThisYear', 'IssueController@issuesThisYear')->name('issuesThisYear');

    Route::get('user/approve/{id}', 'UserController@approve')->name('approve');
    Route::get('user/reject/{id}', 'UserController@reject')->name('reject');
    Route::get('user/active_inactive/{id}', 'UserController@active_inactive')->name('active_inactive');

    Route::get('issue/download_attachment/{id}', 'IssueController@downloadtest')->name('downloadtest');
    Route::post('issue/complete/{id}', 'IssueController@setToComplete')->name('setToComplete');
    Route::post('issue/reopen/{id}', 'IssueController@setToReopen')->name('setToReopen');
    Route::post('issue/sendmessage', 'IssueController@sendmessage')->name('sendmessage');
    Route::post('issue/readmessage', 'IssueController@readmessage')->name('readmessage');
	  
    Route::put('profile_photo', ['as' => 'profile.update_photo', 'uses' => 'ProfileController@update_photo']);

    Route::get('profile', ['as' => 'profile.edit', 'uses' => 'ProfileController@edit']);
    Route::put('profile', ['as' => 'profile.update', 'uses' => 'ProfileController@update']);
    Route::put('profile/password', ['as' => 'profile.password', 'uses' => 'ProfileController@password']);
    
    Route::post('/generatereport/monthly', ['as' => 'generatereport.monthly', 'uses' => 'ReportController@generatereport_monthly']);
    Route::post('/generatereport/quarterly', ['as' => 'generatereport.quarterly', 'uses' => 'ReportController@generatereport_quarterly']);
    Route::post('/generatereport/annual', ['as' => 'generatereport.annual', 'uses' => 'ReportController@generatereport_yearly']);
    
    Route::get('rtl-support', ['as' => 'page.rtl-support', 'uses' => 'ExamplePagesController@rtlSupport']);
    Route::get('timeline', ['as' => 'page.timeline', 'uses' => 'ExamplePagesController@timeline']);
    Route::get('widgets', ['as' => 'page.widgets', 'uses' => 'ExamplePagesController@widgets']);
    Route::get('charts', ['as' => 'page.charts', 'uses' => 'ExamplePagesController@charts']);
    Route::get('calendar', ['as' => 'page.calendar', 'uses' => 'ExamplePagesController@calendar']);

    Route::get('buttons', ['as' => 'page.buttons', 'uses' => 'ComponentPagesController@buttons']);
    Route::get('grid-system', ['as' => 'page.grid', 'uses' => 'ComponentPagesController@grid']);
    Route::get('panels', ['as' => 'page.panels', 'uses' => 'ComponentPagesController@panels']);
    Route::get('sweet-alert', ['as' => 'page.sweet-alert', 'uses' => 'ComponentPagesController@sweetAlert']);
    Route::get('notifications', ['as' => 'page.notifications', 'uses' => 'ComponentPagesController@notifications']);
    Route::get('icons', ['as' => 'page.icons', 'uses' => 'ComponentPagesController@icons']);
    Route::get('typography', ['as' => 'page.typography', 'uses' => 'ComponentPagesController@typography']);
    
    Route::get('regular-tables', ['as' => 'page.regular_tables', 'uses' => 'TablePagesController@regularTables']);
    Route::get('extended-tables', ['as' => 'page.extended_tables', 'uses' => 'TablePagesController@extendedTables']);
    Route::get('datatable-tables', ['as' => 'page.datatable_tables', 'uses' => 'TablePagesController@datatableTables']);

    Route::get('regular-form', ['as' => 'page.regular_forms', 'uses' => 'FormPagesController@regularForms']);
    Route::get('extended-form', ['as' => 'page.extended_forms', 'uses' => 'FormPagesController@extendedForms']);
    Route::get('validation-form', ['as' => 'page.validation_forms', 'uses' => 'FormPagesController@validationForms']);
    Route::get('wizard-form', ['as' => 'page.wizard_forms', 'uses' => 'FormPagesController@wizardForms']);

    Route::get('google-maps', ['as' => 'page.google_maps', 'uses' => 'MapPagesController@googleMaps']);
    Route::get('fullscreen-maps', ['as' => 'page.fullscreen_maps', 'uses' => 'MapPagesController@fullscreenMaps']);
    Route::get('vector-maps', ['as' => 'page.vector_maps', 'uses' => 'MapPagesController@vectorMaps']);
  });


