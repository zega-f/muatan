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

        $all_question = DB::table('quiz_question')
        ->where('quiz_id',$quiz_id)
        ->orderBy('id','DESC')
        ->get();

        if ($this_quiz->status==0) {
            return view('muatan.quiz.edit_quiz',compact('this_quiz','all_question','quiz_id'));
        }else{
            return view('muatan.quiz.published_quiz',compact('this_quiz','all_question','quiz_id'));
        }
    }

    public function update(Request $request, $id)
    {
        DB::table('quiz')
        ->where('quiz_id',$id)
        ->update([
            'quiz_name'=>$request->nama,
            'kkm'=>$request->kkm,
            'time'=>$request->duration,
        ]);

        return back()->with('success','Berhasil mengupdate Quiz');
    }

    public function unpublish($quiz_id)
    {
        $this_quiz = DB::table('quiz')
        ->where('quiz_id',$quiz_id);

        $status = $this_quiz->first()->status;
        $new_stat = 0;

        $this_quiz_question = DB::table('quiz_question')
        ->where('quiz_id',$quiz_id)
        ->get();

        $need_answer = 0;
        foreach ($this_quiz_question as $question) {
            $option = DB::table('quiz_option')
            ->where([
                ['quiz_id',$quiz_id],
                ['quiz_question_id',$question->id]
            ])
            ->count();

            if ($option==0) {
                $need_answer+=1;
            }
        }

        // check whether this quiz has question or not
        if (count($this_quiz_question)<1) {
            return redirect()->route('edit_quiz',['quiz_id'=>$quiz_id])->with('fail','Belum terdapat pertanyaan pada Quiz ini. Buat setidaknya satu pertanyaan untuk melanjutkan');
        }else{
            if ($need_answer==0) {
                if ($status==0) {
                    $new_stat = 1;
                }

                DB::table('quiz')
                ->where('quiz_id',$quiz_id)
                ->update([
                    'status'=>$new_stat
                ]);

                return redirect()->route('edit_quiz',['quiz_id'=>$quiz_id]);
            }else{
                return redirect()->route('edit_quiz',['quiz_id'=>$quiz_id])->with('fail','Terdapat soal tanpa jawaban');
            }
        }
    }
}
