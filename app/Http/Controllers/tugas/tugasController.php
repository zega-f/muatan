<?php

namespace App\Http\Controllers\tugas;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;

class tugasController extends Controller
{
    public function index()
    {
    	$all_mapel = DB::table('tblmapel')->get();
    	// semua materi
    	$all_materi = DB::table('coba_materi')->get();
    	// semua kelas
    	$all_kelas = DB::table('kelas')->get();
    	$type = 'common';
    	return view('muatan.tugas.index',compact('all_mapel','all_kelas','type'));
    }
}
