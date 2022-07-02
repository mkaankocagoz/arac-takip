<?php

use Illuminate\Support\Facades\Route;

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

Auth::routes();

Route::group(['middleware' => ['auth']], function () { 
    Route::get('/', [App\Http\Controllers\FormController::class, 'index']);
    Route::post('/get_models',  [App\Http\Controllers\FormController::class, 'get_models']);
    Route::post('/tamir_yeri',  [App\Http\Controllers\FormController::class, 'tamir_yeri']);
    Route::post('/tamir',  [App\Http\Controllers\FormController::class, 'tamir']);
});






