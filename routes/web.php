<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\materi\materiController;
use App\Http\Controllers\materi\subMateriController;

use App\Http\Controllers\kelas\CommonController as SiswaController;

use App\Http\Controllers\tugas\tugasController;
use App\Http\Controllers\tugas\subTugasController;


use App\Http\Controllers\quiz\quizController;
use App\Http\Controllers\quiz\subQuizController;
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
// END MATERI


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
// END TUGAS


// QUIZ
// quiz index
Route::get('quiz',[quizController::class,'index']);
// store quiz
Route::post('store_quiz',[quizController::class,'store']);
// edit quiz
Route::get('edit_quiz/{quiz_id}',[quizController::class,'edit'])->name('edit_quiz');
// update quiz
Route::post('update_quiz/{id}',[quizController::class,'update']);
// unpublish quiz
Route::get('unpublish_quiz/{quiz_id}',[quizController::class,'unpublish']);

// quiz component
// store question
Route::post('store_question',[subQuizController::class,'store_question']);
// edit question
Route::get('edit_this_question',[subQuizController::class,'edit_this_question']);
// update question
Route::post('updating_question',[subQuizController::class,'update_this_question']);
// delete question
Route::get('delete_this_question',[subQuizController::class,'delete_this_question']);

// option
// create option
Route::get('create_option',[subQuizController::class,'create_option']);
// store option
Route::post('store_option',[subQuizController::class,'store_option']);
// delete option
Route::get('delete_option',[subQuizController::class,'delete_option']);
// edit option
Route::get('edit_option',[subQuizController::class,'edit_option']);
// update option
Route::post('update_option',[subQuizController::class,'update_option']);
// set as right answer
Route::get('set_as_right_answer',[subQuizController::class,'set_as_right_answer']);
// END QUIZ

// COMMON
// get kelas
Route::get('get_all_kelas',[SiswaController::class,'get_all_kelas']);

Route::get('component',function(){
	return view('all_component');
});


// TEST
Route::get('test1',function(){
	return view('test.test1');
});