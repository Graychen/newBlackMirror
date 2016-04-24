<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('welcome');
});
/*Route::group(['namespace' => 'Home'], function(){
   Route::get('home/test','TestController@index');
   Route::get('home/service','ServiceController@index');
   Route::get('home/facade','TestFacadeController@index');

});
Route::get('testViewHello',function(){
	return view('hello');
});

Route::get('testViewHome',function(){
	return view('home');
});

Route::group(['middleware'=>'test'],function(){
	Route::get('/write/user',function(){

	});
	Route::get('/update/user',function(){

	});

});

Route::get('/age/refuse',['as'=>'refuse',function(){
	echo '未成年人精致入内';
}]);*/

Route::group(['prefix'=>'Home','namespace' => 'Home','middleware'=>'test'],function(){
	Route::get('test','TestController@index');
});

Route::group(['prefix'=>'Admin','namespace' => 'Admin'],function(){
	Route::get('test','TestController@index');
});
// 认证路由...
Route::get('auth/login', 'Auth\AuthController@getLogin');
Route::post('auth/login', 'Auth\AuthController@postLogin');
Route::get('auth/logout', 'Auth\AuthController@getLogout');
// 注册路由...
Route::get('auth/register', 'Auth\AuthController@getRegister');
Route::post('auth/register', 'Auth\AuthController@postRegister');
Route::get('/home', 'HomeController@index');
