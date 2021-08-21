<?php

namespace App\Http\Controllers\quiz;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;

class subQuizController extends Controller
{
    public function store_question(Request $request)
    {
    	$new_question = DB::table('quiz_question')
    	->insert([
    		'quiz_id'=>$request->quiz_id,
    		'question'=>$request->question,
    	]);
    	$quiz_id = $request->quiz_id;
    	return view('muatan.quiz.component.all_question',compact('quiz_id'));
    }

    public function edit_this_question(Request $request)
    {
    	$this_question = DB::table('quiz_question')->where('id',$request->question_id)->first();
    	// print_r($this_question);
    	return view('muatan.quiz.component.edit_this_question',compact('this_question'));
    }

    public function update_this_question(Request $request)
    {
    	DB::table('quiz_question')
    	->where('id',$request->question_id)
    	->update([
    		'question'=>$request->edited_question,
    	]);
    }

    public function delete_this_question(Request $request)
    {
    	$quiz_id = DB::table('quiz_question')
    	->where('id',$request->question_id)
    	->first()->quiz_id;

    	DB::table('quiz_option')
    	->where([
    		['quiz_id',$quiz_id],
    		['quiz_question_id',$request->question_id]
    	])
    	->delete();

    	DB::table('quiz_question')
    	->where('id',$request->question_id)
    	->delete();
    }

    public function create_option(Request $request)
    {
    	$this_question = DB::table('quiz_question')->where('id',$request->question_id)->first();
    	return view('muatan.quiz.component.make_option',compact('this_question'));
    }

    public function store_option(Request $request)
    {
    	$quiz_id = DB::table('quiz_question')
    	->where('id',$request->question_id)
    	->first()->quiz_id;

    	$response = '';

    	if ($request->option==null) {
    		$response = array(
    			'type' => 'fail',
    			'message' => 'Opsi tidak boleh kosong',
    		);
    	}else{
    		DB::table('quiz_option')
	    	->insert([
	    		'quiz_id'=>$quiz_id,
	    		'quiz_question_id'=>$request->question_id,
	    		'option_text'=>$request->option,
	    	]);

    		$response = array(
    			'type'=>'success',
	    		'quiz_id'=>$quiz_id,
	    		'quiz_question_id'=>$request->question_id,
	    		'option_text'=>$request->option,
	    	);
    	}

    	return response($response);
    }
}
