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

Route::group(['as' => 'admin.', 'prefix' => 'admin' ,'middleware' => ['auth','isAdmin']], function(){
    Route::resource('usermanagement', 'UserController');
    Route::post('/usermanagement/update', 'UserController@update')->name('usermanagement.update');
    Route::get('project/index', 'ProjectController@index')->name('project.index');
    Route::resource('project', 'ProjectController');
    Route::get('project/select/{id}', 'ProjectController@selectproject')->name('project.select');
    Route::post('project/destroy', 'ProjectController@destroy')->name('project.destroy');
    Route::post('project/update', 'ProjectController@update')->name('project.update');
    Route::resource('survey', 'SurveyController');
    Route::post('survey/storePasteData', 'SurveyController@storePasteData')->name('survey.storePasteData');
    Route::post('survey/destroy', 'SurveyController@destroy')->name('survey.destroy');
    Route::get('survey/deleteAllRows/{id}', 'SurveyController@deleteAllRows')->name('survey.deleteAllRows');

    Route::resource('formation', 'FormationController');
    Route::resource('fgpressure', 'FgpressureController');
    Route::resource('porepressure', 'PorepressureController');
    Route::resource('temperature', 'TemperatureController');
    Route::resource('lithology', 'LithologyController');

    Route::post('porepressure/destroy', 'PorepressureController@destroy')->name('porepressure.destroy');
    Route::get('porepressure/destroyAllRows/{id}', 'PorepressureController@destroyAllRows')->name('porepressure.destroyAllRows');

    Route::post('fgpressure/destroy', 'FgpressureController@destroy')->name('fgpressure.destroy');
    Route::get('fgpressure/destroyAllRows/{id}', 'FgpressureController@destroyAllRows')->name('fgpressure.destroyAllRows');

    Route::post('temperature/destroy', 'TemperatureController@destroy')->name('temperature.destroy');
    Route::get('temperature/destroyAllRows/{id}', 'TemperatureController@destroyAllRows')->name('temperature.destroyAllRows');

    Route::post('lithology/destroy', 'LithologyController@destroy')->name('lithology.destroy');
    Route::get('lithology/destroyAllRows/{id}', 'LithologyController@destroyAllRows')->name('lithology.destroyAllRows');
    Route::post('lithology/update', 'LithologyController@update')->name('lithology.update');

    Route::resource('wellbore', 'WellboreController');
    Route::post('wellbore/update', 'WellboreController@update')->name('wellbore.update');

    Route::resource('drillstring', 'DrillstringController');
    Route::post('drillstringShow', 'DrillstringController@show')->name('drillstring.show');
    Route::post('drillstringComp/store', 'DrillstringController@comp_store')->name('drillstringComp.store');
    Route::post('drillstringComp/update', 'DrillstringController@comp_update')->name('drillstringComp.update');
    Route::post('drillstringComp/destroy', 'DrillstringController@comp_destroy')->name('drillstringComp.destroy');
    Route::get('drillstringComp/destroyAllRows/{id}', 'DrillstringController@comp_all_destroy')->name('drillstringComp.deleteAllRows');

    Route::post('drillstring/store', 'DrillstringController@store')->name('drillstring.store');
    Route::post('drillstring/update', 'DrillstringController@update')->name('drillstring.update');
    Route::post('drillstring/destroy', 'DrillstringController@destroy')->name('drillstring.destroy');
    Route::post('getdrillstring', 'DrillstringController@getDrillStringData')->name('drillstring.getdrillstringData');

    Route::post('surfpiping/store', 'SurfpipingController@store')->name('surfpiping.store');
    Route::post('surfpiping/update', 'SurfpipingController@update')->name('surfpiping.update');
    Route::post('surfpiping/destroy', 'SurfpipingController@destroy')->name('surfpiping.destroy');

    Route::resource('fluids', 'FluidsController');
    Route::get('fluids/select/{id}', 'FluidsController@selectFluid')->name('fluid.select');
    Route::post('fluids/store', 'FluidsController@store')->name('fluid.store');
    Route::post('fluids/destroy', 'FluidsController@destroy')->name('fluid.destroy');
    Route::post('fluids/update', 'FluidsController@update')->name('fluid.update');
    Route::get('fluids/deleteAllRows/{id}', 'FluidsController@deleteAllRows')->name('fluids.deleteAllRows');

    Route::post('sample/store', 'SampleController@store')->name('sample.store');
    Route::post('sample/update', 'SampleController@update')->name('sample.update');

    Route::resource('simulation', 'SimulationController');
    Route::resource('units', 'UnitController');
    Route::post('units/update', 'UnitController@update')->name('units.update');
});

Route::group(['as' => 'user.', 'prefix' => 'user', 'middleware' => ['auth', 'isPermissionValid']], function(){
    Route::get('project/index', 'ProjectController@index')->name('project.index');
    Route::resource('project', 'ProjectController');
    Route::get('project/select/{id}', 'ProjectController@selectproject')->name('project.select');
    Route::post('project/destroy', 'ProjectController@destroy')->name('project.destroy');
    Route::post('project/update', 'ProjectController@update')->name('project.update');
    Route::resource('survey', 'SurveyController');
    Route::post('survey/storePasteData', 'SurveyController@storePasteData')->name('survey.storePasteData');
    Route::post('survey/destroy', 'SurveyController@destroy')->name('survey.destroy');
    Route::get('survey/deleteAllRows/{id}', 'SurveyController@deleteAllRows')->name('survey.deleteAllRows');

    Route::resource('formation', 'FormationController');
    Route::resource('fgpressure', 'FgpressureController');
    Route::resource('porepressure', 'PorepressureController');
    Route::resource('temperature', 'TemperatureController');
    Route::resource('lithology', 'LithologyController');

    Route::post('porepressure/destroy', 'PorepressureController@destroy')->name('porepressure.destroy');
    Route::get('porepressure/destroyAllRows/{id}', 'PorepressureController@destroyAllRows')->name('porepressure.destroyAllRows');

    Route::post('fgpressure/destroy', 'FgpressureController@destroy')->name('fgpressure.destroy');
    Route::get('fgpressure/destroyAllRows/{id}', 'FgpressureController@destroyAllRows')->name('fgpressure.destroyAllRows');

    Route::post('temperature/destroy', 'TemperatureController@destroy')->name('temperature.destroy');
    Route::get('temperature/destroyAllRows/{id}', 'TemperatureController@destroyAllRows')->name('temperature.destroyAllRows');

    Route::post('lithology/destroy', 'LithologyController@destroy')->name('lithology.destroy');
    Route::get('lithology/destroyAllRows/{id}', 'LithologyController@destroyAllRows')->name('lithology.destroyAllRows');
    Route::post('lithology/update', 'LithologyController@update')->name('lithology.update');

    Route::resource('wellbore', 'WellboreController');
    Route::post('wellbore/update', 'WellboreController@update')->name('wellbore.update');

    Route::resource('drillstring', 'DrillstringController');
    Route::post('getdrillstring', 'DrillstringController@getDrillStringData')->name('drillstring.getdrillstringData');
    Route::post('drillstringShow', 'DrillstringController@show')->name('drillstring.show');
    Route::post('drillstringComp/store', 'DrillstringController@comp_store')->name('drillstringComp.store');
    Route::post('drillstringComp/update', 'DrillstringController@comp_update')->name('drillstringComp.update');
    Route::post('drillstringComp/destroy', 'DrillstringController@comp_destroy')->name('drillstringComp.destroy');
    Route::post('drillstring/store', 'DrillstringController@store')->name('drillstring.store');
    Route::post('drillstring/update', 'DrillstringController@update')->name('drillstring.update');
    Route::post('drillstring/destroy', 'DrillstringController@destroy')->name('drillstring.destroy');
    Route::get('drillstringComp/destroyAllRows/{id}', 'DrillstringController@comp_all_destroy')->name('drillstringComp.deleteAllRows');

    Route::post('surfpiping/store', 'SurfpipingController@store')->name('surfpiping.store');
    Route::post('surfpiping/update', 'SurfpipingController@update')->name('surfpiping.update');
    Route::post('surfpiping/destroy', 'SurfpipingController@destroy')->name('surfpiping.destroy');

    Route::resource('fluids', 'FluidsController');
    Route::get('fluids/select/{id}', 'FluidsController@selectFluid')->name('fluid.select');
    Route::post('fluids/store', 'FluidsController@store')->name('fluid.store');
    Route::post('fluids/destroy', 'FluidsController@destroy')->name('fluid.destroy');
    Route::get('fluids/deleteAllRows/{id?}', 'FluidsController@deleteAllRows')->name('fluids.deleteAllRows');
    Route::post('fluids/update', 'FluidsController@update')->name('fluid.update');

    Route::post('sample/store', 'SampleController@store')->name('sample.store');
    Route::post('sample/update', 'SampleController@update')->name('sample.update');

    Route::resource('simulation', 'SimulationController');
    Route::resource('units', 'UnitController');
    Route::post('units/update', 'UnitController@update')->name('units.update');
});
Route::post('/drillStringUpdate', 'WellboreController@drillStringUpdate');
Route::post('setunit', 'FormationController@setunit')->name('formation.setunit');
Route::post('setunitForSurvey', 'SurveyController@setunit')->name('survey.setunit');
Route::post('getChartsData', 'ProjectController@getChartsData')->name('project.getChartsData');
Route::post('getChartsSampleData', 'SampleController@getChartsSampleData')->name('sample.getChartsSampleData');
Route::post('getDataSimulation', 'SimulationController@getDataSimulation')->name('simulation.getDataSimulation');
Route::post('getDataSimulationGuageAndSlider', 'SimulationController@getDataSimulationGuageAndSlider')->name('simulation.getDataSimulationGuageAndSlider');

Route::post('porepressure/storePasteData', 'PorepressureController@storePasteData')->name('porepressure.storePasteData');
Route::post('fracture/storePasteData', 'FgpressureController@storePasteData')->name('fgpressure.storePasteData');
Route::post('temperature/storePasteData', 'TemperatureController@storePasteData')->name('temperature.storePasteData');
Route::post('lithology/storePasteData', 'LithologyController@storePasteData')->name('lithology.storePasteData');
Route::post('drillstring/storePasteData', 'DrillstringController@storePasteData')->name('drillstring.storePasteData');
Route::post('fluids/storePasteData', 'FluidsController@storePasteData')->name('fluids.storePasteData');




