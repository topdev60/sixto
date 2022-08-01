<?php

use App\Http\Controllers\Backend\AdminDashboardController;
use App\Http\Controllers\Frontend\ProjectController;
use App\Http\Controllers\Frontend\UserDashboardController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use Monolog\Handler\RotatingFileHandler;

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

Route::get('/', 'Auth\LoginController@showLoginForm');

Auth::routes();

Route::group(['as' => 'admin.', 'prefix' => 'admin' ,'middleware' => ['auth', 'isAdmin']], function(){
    Route::get('project/index', 'ProjectController@index')->name('project.index');
    Route::resource('project', 'ProjectController');
    Route::get('project/select/{id}', 'ProjectController@selectproject')->name('project.select');
    Route::post('project/destroy', 'ProjectController@destroy')->name('project.destroy');
    Route::post('project/update', 'ProjectController@update')->name('project.update');
    Route::resource('survey', 'SurveyController');
    Route::post('survey/destroy', 'SurveyController@destroy')->name('survey.destroy');
    Route::resource('formation', 'FormationController');
    Route::resource('formation', 'FormationController');
    Route::resource('fgpressure', 'FgpressureController');
    Route::resource('porepressure', 'PorepressureController');
    Route::resource('temperature', 'TemperatureController');
    Route::resource('lithology', 'LithologyController');
    Route::post('porepressure/destroy', 'PorepressureController@destroy')->name('porepressure.destroy');
    Route::post('fgpressure/destroy', 'FgpressureController@destroy')->name('fgpressure.destroy');
    Route::post('temperature/destroy', 'TemperatureController@destroy')->name('temperature.destroy');
    Route::post('lithology/destroy', 'LithologyController@destroy')->name('lithology.destroy');
});

Route::group(['as' => 'user.', 'prefix' => 'user', 'middleware' => ['auth']], function(){
    Route::get('project/index', 'ProjectController@index')->name('project.index');
    Route::resource('project', 'ProjectController');
    Route::get('project/select/{id}', 'ProjectController@selectproject')->name('project.select');
    Route::post('project/destroy', 'ProjectController@destroy')->name('project.destroy');
    Route::post('project/update', 'ProjectController@update')->name('project.update');
    Route::resource('survey', 'SurveyController');
    Route::post('survey/destroy', 'SurveyController@destroy')->name('survey.destroy');
    Route::resource('formation', 'FormationController');
    Route::resource('fgpressure', 'FgpressureController');
    Route::resource('porepressure', 'PorepressureController');
    Route::resource('temperature', 'TemperatureController');
    Route::resource('lithology', 'LithologyController');
    Route::post('porepressure/destroy', 'PorepressureController@destroy')->name('porepressure.destroy');
    Route::post('fgpressure/destroy', 'FgpressureController@destroy')->name('fgpressure.destroy');
    Route::post('temperature/destroy', 'TemperatureController@destroy')->name('temperature.destroy');
    Route::post('lithology/destroy', 'LithologyController@destroy')->name('lithology.destroy');
});
Route::post('getChartsData', 'ProjectController@getChartsData')->name('project.getChartsData');


