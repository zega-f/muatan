@extends('muatan.layout')
@section('content')
<?php  
	$materi_file = file_get_contents("materi/".$this_materi->id_materi.'.json');
    $string = json_decode($materi_file,true);
?>
<div class="container border mb-3 rounded" style="padding: 20px; background-color: white;">
	<form action="{{url('update_materi/'.$this_materi->id_materi)}}" id="materi_form" method="post" enctype="multipart/form-data">
		@csrf
		<a href="{{url('/')}}" class="mb-3 link-secondary"><i class="ion-arrow-left-c"></i> Back</a>
		<h5 class="mb-3">
			Edit materi
			<span style="float: right; font-size: 14px; font-weight: normal;">
				<button type="reset" class="btn btn-warning btn-sm" onclick="reset_mapel();">Batal <i class="ion-android-refresh"></i></button>
				<button class="btn btn-sm btn-success">
					Simpan <i class="bi bi-check-square"></i>
				</button>
			</span>
		</h5>
		<table class="table">
			<tr>
				<td>Judul materi</td>
				<td>
					<input 
					type="text" 
					name="judul" 
					id="nama_materi" 
					class="form-control" 
					required
					placeholder="E.g. What is e-learning?"
					value="{{$this_materi->judul}}" 
					>
					<small class="text-muted">Berikan judul yang mewakili isi materi yang akan Anda buat.</small>
				</td>
			</tr>
			<tr>
				<td>Kelas/Mapel</td>
				<td>
					<div class="row">
						<div class="col-md-6">
							<select class="form-control" id="kelas" name="kelas" required="">
								<option value="{{$this_materi->id_kelas}}" selected="">{{$this_materi->room_name}}</option>
								@foreach($all_kelas as $kelas)
								<option value="{{$kelas->id_kelas}}">{{$kelas->room_name}}</option>
								@endforeach
							</select>
							<small class="text-muted">Pilih kelas dimana materi ini akan diberikan</small>
						</div>
						<div class="col-md-6">
							<select class="form-control" id="mapel" name="mapel" required="">
								@include('muatan.materi.component.all_mapel_comp')
							</select>
							<small class="text-muted">Pilih mata pelajaran</small>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>Konten</td>
				<td>
					<textarea id="konten_materi" name="konten" required><?php echo $string['konten']; ?></textarea>
				</td>
			</tr>
			<tr>
				<td>Lampiran</td>
				<td>
					<ul id="attachmentBox" style="list-style: none;">
						<?php $i=0; ?>
						@foreach($this_materi_lampiran as $lampiran)
						<?php $i++; ?>
						<li id="list{{$i}}" class="lampiran">
							<button class="btn btn-sm mb-2" type="button">
								{{$lampiran->attachment_original_name}}
							</button>
							<i style="margin-left:20px; cursor:pointer;" class="ion-android-close delete-file" data-id="{{$i}}" data-lampiran="{{$lampiran->id}}"></i>
						</li>
						@endforeach
					</ul>
					<div id="file-box"></div>
					<button class="btn btn-info btn-sm" id="add" type="button">Unggah File <i class="ion-upload"></i></button>
				</td>
			</tr>
		</table>
	</form>
</div>
<div class="container rounded border" style="padding: 20px; background-color: white;">
	<h5 class="mb-3">Edit History</h5>
	<?php $all_history  = DB::table('coba_materi_history')->where('materi_id',$this_materi->id_materi)->get(); ?>
	<table class="table" id="history">
		<thead>
			<tr>
				<th>Oleh</th>
				<th>@</th>
			</tr>
		</thead>
		<tbody>
			@foreach($all_history as $history)
			<tr>
				<td>{{$history->updated_by}}</td>
				<td>{{$history->updated_at}}</td>
			</tr>
			@endforeach
		</tbody>
	</table>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#history').DataTable();
		})
	</script>
</div>
<div class="modal" id="cancel_confirm">
	<div class="card shadow" style="border: none; max-width: 500px;">
		<div class="card-header bg-info text-light">
			<header>Batalkan edit materi? <span style="float: right;" class="ion-android-close pointer" onclick="cancel_reset();"></span></header>
		</div>
		<div class="card-body">
			<div class="alert alert-warning">
				Apakah anda yakin ingin membatalkan proses edit materi ini?
			Perubahan yang tidak disimpan akan hilang.
			</div>
			<header>
				<a href="{{url()->current()}}" class="btn btn-warning btn-sm">Ya, lanjutkan</a>
			<button class="btn btn-info btn-sm" onclick="cancel_reset();">Tidak</button>
			</header>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('.delete-file').click(function(){
		var id = $(this).data('id');
		var id_lampiran = $(this).data('lampiran');
		if (confirm('File ini telah diunggah, apakah Anda yakin ingin menghapus file ini? File yang telah dihapus tidak dapat dipulihkan walaupun materi ini direset seperti semula')) {
			// $('#list'+id).remove();
			$.ajax({
				type : 'get',
				url : '{{URL::to('delete_file')}}',
				data : {lampiran_id:id_lampiran},
				success:function(data)
				{
					$('#list'+id).remove();
				}
			})
		}
	})

	function reset_mapel()
	{
		$('#cancel_confirm').css({
			'display':'grid',
			'place-items':'center'
		});
	}

	function cancel_reset()
	{
		$('#cancel_confirm').hide();
	}

	$('#kelas').on('change',function(){
		var value = $(this).val();
		var type = 'xhr'
		$.ajax({
			type : 'get',
			url : '{{URL::to('this_class_available_mapel')}}',
			data : {id_kelas:value,type:type},
			success:function(data)
			{
				$('#mapel').prop('disabled',false).html(data);
			}
		})
	})
	var i = '{{$i}}';
	$('#add').click(function(){
		i++;
		console.log(i);
		$('#file-box').append('<div style="display:none;" class="form-file-box" id="form-file-box'+i+'"><input type="file" id="attachment'+i+'" name="attachment[]" data-id="'+i+'" class="form-control-file mb-2 file"></div><div class="col-4"></div>')
		$('#attachment'+i).click();

		$('.file').bind('change', function() {
			var maxAllowedSize = 10000000;
			var thisFile = this.files[0].size;

			if (thisFile>maxAllowedSize) {
				alert('file terlalu besar')
				$(this).val('');
				$('#submit').prop('disabled',true);
			}else{
				$('#attachmentBox').append('<li id="list'+i+'" class="lampiran"><button class="btn btn-sm mb-2" type="button">'+$('#attachment'+i).val().replace(/C:\\fakepath\\/i, '')+'</button><i style="margin-left:20px; cursor:pointer;" class="ion-android-close remove-file" data-id="'+i+'"></i></li>');
				$('.remove-file').click(function(){
					var id = $(this).data('id');
					$('#form-file-box'+id).remove();
					$('#list'+id).remove();
				})
				$('#submit').prop('disabled',false);
			}
		});
	})
</script>
<!-- <script type="text/javascript">
	$('#submit_button').click(function(){
		var lampiran_lenght = $('.lampiran').length;
		if (lampiran_lenght>0) {
			$('#canceled_form').submit();
		}else{
			alert('Harap unggah paling tidak satu lampiran');
		}
	})
</script> -->
<script type="text/javascript">
	var konten = document.getElementById("konten_materi");
	    CKEDITOR.replace(konten,{
	    language:'en-gb'
	  });
  	CKEDITOR.config.allowedContent = true;
</script>
@endsection