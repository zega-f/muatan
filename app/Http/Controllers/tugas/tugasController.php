<?php

namespace App\Http\Controllers\tugas;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;
use DB;

class tugasController extends Controller
{
    public function index()
    {
    	$all_mapel = DB::table('tblmapel')->get();
    	// semua materi
    	$all_materi = DB::table('coba_tugas')->get();
    	// semua kelas
    	$all_kelas = DB::table('kelas')->get();
    	$type = 'common';
    	return view('muatan.tugas.index',compact('all_mapel','all_kelas','type'));
    }

    public function store(Request $request)
    {
        // ubah sesuai nama field untuk kelas dan mapel
        $id_kelas = $request->kelas;
        $id_mapel = $request->mapel;

        $id_tugas = Str::random(8);
        $string_random = Str::random(32);
        $directory = "public/muatan/tugas/";
        $lampiran_dir = "public/muatan/tugas/lampiran/";
        $file_array = array();

        $store_materi = DB::table('coba_tugas')
        ->insert([
            'id_tugas'=>$id_tugas,
            'id_kelas'=>$id_kelas,
            'mapel'=>$id_mapel,
            'judul'=>$request->judul,
            'waktu'=>$request->date.' '.$request->time,
        ]);

        $json_content = array(
            'id_tugas' => $id_tugas,
            'judul'=>$request->judul,
            'konten' => $request->konten,
        );

        $text = json_encode($json_content);

        $myfile = fopen($directory.$id_tugas.'.json', "w");
        fwrite($myfile, $text);

        if ($request->attachment) {
            for ($i=0; $i <count($request->attachment) ; $i++) { 
                $file_array[] = array(
                    'tugas_id'=>$id_tugas,
                    'attachment_name'=>$string_random.$request->attachment[$i]->getClientOriginalName(),
                    'attachment_original_name'=>$request->attachment[$i]->getClientOriginalName(),
                );
                $request->attachment[$i]->move($lampiran_dir,$string_random.$request->attachment[$i]->getClientOriginalName());
            }

            $store_lampiran = DB::table('coba_tugas_lampiran')
            ->insert($file_array);
        }

        return back();

    }

    public function edit($tugas_id)
    {
        $this_tugas = DB::table('coba_tugas')
        ->join('kelas','coba_tugas.id_kelas','=','kelas.id_kelas')
        ->join('tblmapel','coba_tugas.mapel','=','tblmapel.id_mapel')
        ->select('coba_tugas.*','tblmapel.nama','kelas.room_name')
        ->where('coba_tugas.id_tugas',$tugas_id)
        ->first();

        $this_tugas_lampiran = DB::table('coba_tugas_lampiran')
        ->where([
            ['tugas_id',$tugas_id]
        ])
        ->get();

        return view('muatan.tugas.edit_tugas',compact('this_tugas','this_tugas_lampiran'));
    }

    public function update(Request $request, $tugas_id)
    {
        $string_random = Str::random(32);
        $directory = "public/muatan/tugas/";
        $lampiran_dir = "public/muatan/tugas/lampiran/";
        $file_array = array();

        $update_tugas = DB::table('coba_tugas')
        ->where('id_tugas',$tugas_id)
        ->update([
            'judul'=>$request->judul,
            'waktu'=>$request->date.' '.$request->time,
        ]);

        $json_content = array(
            'id_tugas' => $tugas_id,
            'judul'=>$request->judul,
            'konten' => $request->konten,
        );

        $text = json_encode($json_content);

        $myfile = fopen($directory.$tugas_id.'.json', "w");
        fwrite($myfile, $text);

        if ($request->attachment) {
            for ($i=0; $i <count($request->attachment) ; $i++) { 
                $file_array[] = array(
                    'tugas_id'=>$tugas_id,
                    'attachment_name'=>$string_random.$request->attachment[$i]->getClientOriginalName(),
                    'attachment_original_name'=>$request->attachment[$i]->getClientOriginalName(),
                );
                $request->attachment[$i]->move($lampiran_dir,$string_random.$request->attachment[$i]->getClientOriginalName());
            }

            $store_lampiran = DB::table('coba_tugas_lampiran')
            ->insert($file_array);
        }

        return back();
    }

    public function delete(Request $request)
    {
        $this_tugas = DB::table('coba_tugas')
        ->where([
            ['id_tugas',$request->id_tugas]
        ])
        ->first();

        $all_lampiran = DB::table('coba_tugas_lampiran')
        ->where([
            ['tugas_id',$this_tugas->id_tugas]
        ])
        ->get();

        foreach ($all_lampiran as $lampiran) {
            if (File::exists('public/muatan/tugas/lampiran/'.$lampiran->attachment_name)) {
                File::delete('public/muatan/tugas/lampiran/'.$lampiran->attachment_name);
            }
        }

        if (File::exists('public/muatan/tugas/'.$this_tugas->id_tugas.'.json')) {
            File::delete('public/muatan/tugas/'.$this_tugas->id_tugas.'.json');
        }

        $delete_lampiran = DB::table('coba_tugas_lampiran')
        ->where([
            ['tugas_id',$this_tugas->id_tugas]
        ])
        ->delete();

        $delete_tugas = DB::table('coba_tugas')
        ->where([
            ['id_tugas',$request->id_tugas]
        ])
        ->delete();

        return view('muatan.tugas.component.all_tugas_comp');
    }
}
