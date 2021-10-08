<?php

namespace App\Http\Controllers\quiz;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;
use DB;

class subQuizController extends Controller
{
    public function store_question(Request $request)
    {
        $this_quiz_question = DB::table('quiz_question')
        ->where([
            ['quiz_id',$request->quiz_id]
        ])
        ->orderBy('id','DESC')
        ->first();

        $file = $request->file('img');

        if ($this_quiz_question) {
            $question_id = $this_quiz_question->question_id+1;
        }else{
            $question_id = 1;
        }

        if ($file) {
            $directory = 'public/muatan/quiz/lampiran/';
            $filename = Str::random(16).$file->getClientOriginalName();
            DB::table('quiz_question_attachment')
            ->insert([
                'quiz_id'=>$request->quiz_id,
                'question_id'=>$question_id,
                'filename'=>$filename,
            ]);

            $file->move($directory,$filename);
        }

    	$new_question = DB::table('quiz_question')
    	->insert([
            'question_id'=>$question_id,
    		'quiz_id'=>$request->quiz_id,
    		'question'=>$request->question_field,
    	]);

        $quiz_id = $request->quiz_id;

        $all_question = DB::table('quiz_question')
        ->where('quiz_id',$quiz_id)
        ->orderBy('id','DESC')
        ->get();
    	
    	return view('muatan.quiz.component.all_question',compact('quiz_id','all_question'));
    }

    public function edit_this_question(Request $request)
    {
    	$this_question = DB::table('quiz_question')->where('id',$request->question_id)->first();
    	// print_r($this_question);
    	return view('muatan.quiz.component.edit_this_question',compact('this_question'));
    }

    /* 
        update pertanyaan 
        route : updating_question
        view : muatan.quiz.component.edit_this_question
        type : xhr
    */
    public function update_this_question(Request $request)
    {
        $response = '';
        // request input file dengan name 'img_edit'
        $file = $request->file('img_edit');

        // check apakah terdapat file gambar untuk pertanyaan ini
        if ($file) {
            // directory penyimpanan file baru
            $directory = 'public/muatan/quiz/lampiran/';
            // nama file baru
            $new_filename = Str::random(16).str_replace(' ', '', $file->getClientOriginalName());
            // change first() or get() if needed 
            $this_question_attachment = DB::table('quiz_question_attachment')
            ->where([
                ['quiz_id',$request->quiz_id],
                ['question_id',$request->question_id]
            ])
            ->first();

            /*
                check apakah terdapat file lama atau tidak
                jika ya : cek file, if exists then delete
                jika tidak : insert new record to quiz_question_attachment table
            */
            if ($this_question_attachment) {
                if (File::exists($directory.$this_question_attachment->filename)) {
                    File::delete($directory.$this_question_attachment->filename);
                }
                // update gambar lama dengan gambar baru
                DB::table('quiz_question_attachment')
                ->where([
                    ['quiz_id',$request->quiz_id],
                    ['question_id',$request->question_id]
                ])
                ->update([
                    'filename'=>$new_filename,
                ]);
            }else{
                // insert gambar baru
                DB::table('quiz_question_attachment')
                ->insert([
                    'quiz_id'=>$request->quiz_id,
                    'question_id'=>$request->question_id,
                    'filename'=>$new_filename,
                ]);
            }

            $file->move($directory,$new_filename);

            $response = [
                'msg'=>'new_file',
                'src'=>$new_filename,
            ];
        }else{
            $response = ['msg'=>'no_file'];
        }

        DB::table('quiz_question')
        ->where([
            ['question_id',$request->question_id],
            ['quiz_id',$request->quiz_id]
        ])
        ->update([
            'question'=>$request->edit_question_field,
        ]);

        return response($response);
    }

    public function delete_this_question(Request $request)
    {
        $directory = 'public/muatan/quiz/lampiran/';
    	$this_quiz = DB::table('quiz_question')
    	->where('id',$request->question_id)
    	->first();

        $this_quiz_attachment = DB::table('quiz_question_attachment')
        ->where([
            ['quiz_id',$this_quiz->quiz_id],
            ['question_id',$this_quiz->question_id]
        ])
        ->first();

        if ($this_quiz_attachment) {
            DB::table('quiz_question_attachment')
            ->where([
                ['quiz_id',$this_quiz->quiz_id],
                ['question_id',$this_quiz->question_id]
            ])
            ->delete();

            if (File::exists($directory.$this_quiz_attachment->filename)) {
                File::delete($directory.$this_quiz_attachment->filename);
            }
        }

    	DB::table('quiz_option')
    	->where([
    		['quiz_id',$this_quiz->quiz_id],
    		['quiz_question_id',$this_quiz->question_id]
    	])
    	->delete();

    	DB::table('quiz_question')
    	->where('id',$request->question_id)
    	->delete();
    }

    public function create_option(Request $request)
    {
    	$this_question = DB::table('quiz_question')->where('id',$request->question_id)->first();
        $quiz_id = $this_question->quiz_id;
    	return view('muatan.quiz.component.make_option',compact('this_question','quiz_id'));
    }

    public function store_option(Request $request)
    {
    	$this_quiz_question = DB::table('quiz_question')
    	->where('id',$request->question_id)
    	->first();

        // print_r($this_quiz_question);

    	if ($request->option==null) {
    		$response = array(
    			'type' => 'fail',
    			'message' => 'Opsi tidak boleh kosong',
    		);
            return response($response);
    	}else{
            $first_option = DB::table('quiz_option')
            ->where([
                ['quiz_id',$this_quiz_question->quiz_id],
                ['quiz_question_id',$this_quiz_question->question_id]
            ])
            ->count();

            if ($first_option==0) {
                DB::table('quiz_option')
                ->insert([
                    'quiz_id'=>$this_quiz_question->quiz_id,
                    'quiz_question_id'=>$this_quiz_question->question_id,
                    'option_text'=>$request->option,
                    'benar'=>1,
                ]);
            }else{
                DB::table('quiz_option')
                ->insert([
                    'quiz_id'=>$this_quiz_question->quiz_id,
                    'quiz_question_id'=>$this_quiz_question->question_id,
                    'option_text'=>$request->option,
                ]);
            }

            $question_id = $this_quiz_question->question_id;
            $quiz_id = $this_quiz_question->quiz_id;

    		return view('muatan.quiz.component.option_list',compact('question_id','quiz_id'));
    	}
    }

    public function edit_option(Request $request)
    {
        $this_option = DB::table('quiz_option')
        ->where('id',$request->option_id)
        ->first();

        return view('muatan.quiz.component.edit_option',compact('this_option'));
    }

    public function update_option(Request $request)
    {
        $this_option = DB::table('quiz_option')
        ->where('id',$request->option_id)
        ->first();

        $this_option_update = DB::table('quiz_option')
        ->where('id',$request->option_id)
        ->update([
            'option_text'=>$request->new_option
        ]);

        $question_id = $request->question_id;
        $quiz_id = $this_option->quiz_id;

        return view('muatan.quiz.component.option_list',compact('question_id','quiz_id'));
    }

    public function set_as_right_answer(Request $request)
    {
        $this_option = DB::table('quiz_option')
        ->where('id',$request->option_id)
        ->first();

        $set_as_wrong_ans = DB::table('quiz_option')
        ->where([
            ['quiz_id',$this_option->quiz_id],
            ['quiz_question_id',$this_option->quiz_question_id]
        ])
        ->update([
            'benar'=>0,
        ]);

        $set_as_right_answer = DB::table('quiz_option')
        ->where('id',$request->option_id)
        ->update([
            'benar'=>1
        ]);
    }

    public function delete_option(Request $request)
    {
        DB::table('quiz_option')
        ->where('id',$request->option_id)
        ->delete();

        $question_id = $request->question_id;

        $quiz_id = $request->quiz_id;

        return view('muatan.quiz.component.option_list',compact('question_id','quiz_id'));
    }
}
