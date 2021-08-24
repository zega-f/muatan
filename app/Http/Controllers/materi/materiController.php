<?php

namespace App\Http\Controllers\materi;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;
use DB;

class materiController extends Controller
{
    public function index()
    {
    	$title = 'Admin - materi';
    	// semua mata pelajaran
    	$all_mapel = DB::table('tblmapel')->get();
    	// semua materi
    	$all_materi = DB::table('coba_materi')->get();
    	// semua kelas
    	$all_kelas = DB::table('kelas')->get();
    	$type = 'common';
    	return view('muatan.materi.index',compact('all_materi','all_mapel','title','all_kelas','type'));
    }

    public function store(Request $request)
    {
    	$id_materi = Str::random(8);
    	$string_random = Str::random(32);
    	$directory = "public/muatan/materi/";
    	$lampiran_dir = "public/muatan/materi/lampiran/";
    	$file_array = array();

    	$store_materi = DB::table('coba_materi')
    	->insert([
    		'id_materi'=>$id_materi,
    		'id_kelas'=>$request->kelas,
    		'mapel'=>$request->mapel,
    		'judul'=>$request->judul,
    	]);

    	$json_content = array(
            'id_materi' => $id_materi,
            'judul'=>$request->judul,
            'konten' => $request->konten,
        );

        $text = json_encode($json_content);

        $myfile = fopen($directory.$id_materi.'.json', "w");
        fwrite($myfile, $text);

        if ($request->attachment) {
        	for ($i=0; $i <count($request->attachment) ; $i++) { 
	    		$file_array[] = array(
	    			'materi_id'=>$id_materi,
	    			'attachment_name'=>$string_random.$request->attachment[$i]->getClientOriginalName(),
	    			'attachment_original_name'=>$request->attachment[$i]->getClientOriginalName(),
	    		);
	    		$request->attachment[$i]->move($lampiran_dir,$string_random.$request->attachment[$i]->getClientOriginalName());
	     	}

	     	$store_lampiran = DB::table('coba_materi_lampiran')
	        ->insert($file_array);
        }

     	return back();
    }

    public function edit($materi_id)
    {
        $this_materi = DB::table('coba_materi')
        ->join('kelas','coba_materi.id_kelas','=','kelas.id_kelas')
        ->join('tblmapel','coba_materi.mapel','=','tblmapel.id_mapel')
        ->select('coba_materi.*','tblmapel.nama','kelas.room_name')
    	->where('coba_materi.id_materi',$materi_id)
    	->first();

    	$this_materi_lampiran = DB::table('coba_materi_lampiran')
    	->where([
    		['materi_id',$materi_id]
    	])
    	->get();

    	// $this_class_mapel = DB::table('mapel_kelas')
    	// ->join('tblmapel','mapel_kelas.mapel','=','tblmapel.id_mapel')
    	// ->select('mapel_kelas.*','tblmapel.nama')
    	// ->where([
    	// 	['mapel_kelas.kelas',$this_materi->id_kelas],
    	// 	['mapel_kelas.mapel','!=',$this_materi->mapel]
    	// ])
    	// ->get();

    	$all_kelas = DB::table('kelas')
    	->where('id_kelas','!=',$this_materi->id_kelas)
    	->get();

    	$type = 'edit';

    	return view('muatan.materi.edit_materi',compact('this_materi','this_materi_lampiran','all_kelas','type'));
    }

    public function update(Request $request, $id_materi)
    {
        $string_random = Str::random(32);
        $directory = "materi/";
        $lampiran_dir = "materi/lampiran/";
        $file_array = array();

        $store_materi = DB::table('coba_materi')
        ->where('id_materi',$id_materi)
        ->update([
            'id_kelas'=>$request->kelas,
            'mapel'=>$request->mapel,
            'judul'=>$request->judul,
        ]);

        $json_content = array(
            'id_materi' => $id_materi,
            'judul'=>$request->judul,
            'konten' => $request->konten,
        );

        $text = json_encode($json_content);

        $myfile = fopen($directory.$id_materi.'.json', "w");
        fwrite($myfile, $text);

        if ($request->attachment) {
            for ($i=0; $i <count($request->attachment) ; $i++) { 
                $file_array[] = array(
                    'materi_id'=>$id_materi,
                    'attachment_name'=>$string_random.$request->attachment[$i]->getClientOriginalName(),
                    'attachment_original_name'=>$request->attachment[$i]->getClientOriginalName(),
                );
                $request->attachment[$i]->move($lampiran_dir,$string_random.$request->attachment[$i]->getClientOriginalName());
            }

            $store_lampiran = DB::table('coba_materi_lampiran')
            ->insert($file_array);
        }

        $save_to_history = DB::table('coba_materi_history')
        ->insert([
            'updated_by'=>'user',
            'materi_id'=>$id_materi,
        ]);

        return back();
    }

    public function delete_materi(Request $request)
    {
    	$this_materi = DB::table('coba_materi')
    	->where([
    		['id_materi',$request->id_materi]
    	])
    	->first();

    	$all_lampiran = DB::table('coba_materi_lampiran')
    	->where([
    		['materi_id',$this_materi->id_materi]
    	])
    	->get();

    	foreach ($all_lampiran as $lampiran) {
    		if (File::exists('materi/lampiran/'.$lampiran->attachment_name)) {
    			File::delete('materi/lampiran/'.$lampiran->attachment_name);
    		}
    	}

    	if (File::exists('materi/'.$this_materi->id_materi.'.json')) {
    		File::delete('materi/'.$this_materi->id_materi.'.json');
    	}

    	$delete_lampiran = DB::table('coba_materi_lampiran')
    	->where([
    		['materi_id',$this_materi->id_materi]
    	])
    	->delete();

        $delete_materi = DB::table('coba_materi')
        ->where([
            ['id_materi',$request->id_materi]
        ])
        ->delete();

        $all_materi = DB::table('coba_materi')->get();

        return view('muatan.materi.component.all_materi_comp',compact('all_materi'));
    }
}
