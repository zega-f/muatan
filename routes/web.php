<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\materi\materiController;
use App\Http\Controllers\materi\subMateriController;

use App\Http\Controllers\tugas\tugasController;
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
