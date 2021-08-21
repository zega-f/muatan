<?php

namespace App\Http\Controllers\quiz;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use DB;

class quizController extends Controller
{
    public function index()
    {
    	return view('muatan.quiz.index');
    }

    public function store(Request $request)
    {
    	$quiz_id = Str::random(8);

    	DB::table('quiz')
    	->insert([
    		'bab_id'=>0,
    		'room_id'=>$request->kelas,
    		'mapel_id'=>$request->mapel,
    		'quiz_id'=>$quiz_id,
    		'quiz_name'=>$request->nama,
    		'kkm'=>$request->kkm,
    		'time'=>$request->duration,
    	]);

    	return back()->with('success','Berhasil membuat quiz');
    }

    public function edit($quiz_id)
    {
    	$this_quiz = DB::table('quiz')
    	->where('quiz_id',$quiz_id)
    	->first();

    	return view('muatan.quiz.edit_quiz',compact('this_quiz'));
    }
}
