@extends('muatan.layout')
@section('content')
<div class="container rounded border" style="background-color: white; padding: 20px; max-width: 900px;">
	<h5 style="text-align: center;">
		{{$this_materi->judul}}
	</h5>
	<?php  
		$materi_file = file_get_contents("materi/".$this_materi->id_materi.'.json');
        $string = json_decode($materi_file,true);
    ?>
    <div id="konten" style="font-size: 14px;">
    	<?php
	    echo $string['konten'];
		?>
		@if(count($this_materi_lampiran)>0)
		Lampiran
		<ul>
			@foreach($this_materi_lampiran as $lampiran)
				<li><a href="{{url('materi/lampiran/'.$lampiran->attachment_name)}}">{{$lampiran->attachment_original_name}}</a></li>
			@endforeach
		</ul>
		@endif
    </div>
</div>
@endsection