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
    return view('welcome');
});

Route::get('/contact', function () {
    return view('contact');
});

Route::get('/template', function () {
    return view('template');
});

Route::get('/workshop2', function () {
    $name =  request('name');
    return view('workshop2', [
        'name' => $name,
    ]);
});

Route::get('/posts/{post}', function ($post) {
    $posts =  [
        'my-firts-post' => 'Hello, this is my first blog post!',
        'my-second-post' => 'Now i am getting the hang of this blogging thing.'
    ];
    if (!array_key_exists($post, $posts)) {
        abort(404, 'Sorry, that post was not found');
    }
    return view('post', [
        'post' => $posts[$post],
    ]);
});

Route::get('/postsdb/{post}', 'PostsController@show');


Route::get('/articles', 'ArticlesController@index');
Route::get('/articles/{article}', 'ArticlesController@show')->name('articles.show');
Route::get('/articles/{article}/edit', 'ArticlesController@edit');
Route::get('/articles/{article}', 'ArticlesController@update');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
