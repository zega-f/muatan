<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\materi\materiController;
use App\Http\Controllers\materi\subMateriController;

use App\Http\Controllers\kelas\CommonController as SiswaController;

use App\Http\Controllers\tugas\tugasController;
use App\Http\Controllers\tugas\subTugasController;


use App\Http\Controllers\quiz\quizController;
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

// change this route callback to materi_index
// MATERI
// index materi
Route::get('/',[materiController::class,'index']);
// check mapel pada table mapel_kelas
Route::get('this_class_available_mapel',[subMateriController::class,'check_mapel']);
// show materi
Route::get('preview_materi/{materi_id}',[subMateriController::class,'show']);
// delete file
Route::get('delete_file',[subMateriController::class,'delete_file']);


// store materi
Route::post('coba_sn',[materiController::class,'store']);
// show for edit
Route::get('edit_materi/{materi_id}',[materiController::class,'edit']);
// update materi
Route::post('update_materi/{id_materi}',[materiController::class,'update']);
// delete materi
Route::get('delete_materi',[materiController::class,'delete_materi']);


// TUGAS
// index tugas
Route::get('tugas',[tugasController::class,'index']);

// store materi
Route::post('store_tugas',[tugasController::class,'store']);
// show tugas for edit
Route::get('edit_tugas/{tugas_id}',[tugasController::class,'edit']);
// update
Route::post('update_tugas/{tugas_id}',[tugasController::class,'update']);
// delete tugas
Route::get('delete_tugas',[tugasController::class,'delete']);

// show tugas
Route::get('preview_tugas/{tugas_id}',[subTugasController::class,'preview_tugas']);
// delete file
Route::get('delete_tugas_file',[subTugasController::class,'delete_file']);


// quiz
Route::get('quiz',[quizController::class,'index']);

// COMMON
// get kelas
Route::get('get_all_kelas',[SiswaController::class,'get_all_kelas']);