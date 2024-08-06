<?php

use Illuminate\Http\Request;
use App\Http\Controllers\PostController;
use App\Post;
use App\Holiday;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

//For Public Routes


//For Potected Routes
// Route::group(['middleware' => ['auth:sanctum', 'auth']], function () {
//     Route::get('posts', [PostController::class, 'index']);

//     Route::get('posts/search/{title}', [PostController::class, 'search']);
//     Route::post('posts', [PostController::class, 'store']);
//     Route::put('posts/{post}', [PostController::class, 'update']);
//     Route::delete('posts/{post}', [PostController::class, 'destroy']);

//     Route::get('holidays', function() {
//         return Holiday::all();
//     });
// });


































// Route::resource('posts', 'PostController');


// Route::get('/posts', function() {
//     return Post::all();
// });

// Route::post('/posts', function(Request $request) {
//     return Post::create([
//         "title" => $request->title,
//         "content" => $request->content,
//     ]);
// });