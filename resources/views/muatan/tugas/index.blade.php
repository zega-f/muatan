@extends('muatan.layout')
@section('content')
<div class="container border mb-3 rounded" style="padding: 20px; background-color: white;">
	<form action="{{url('store_tugas')}}" id="materi_form" method="post" enctype="multipart/form-data">
		@csrf
		<h5 class="mb-3">
			Tugas
			<span style="float: right; font-size: 14px; font-weight: normal;">
				<button class="btn btn-sm btn-success">
					Simpan <i class="bi bi-check-square"></i>
				</button>
			</span>
		</h5>
		<table class="table">
			<tr>
				<td>Judul Tugas</td>
				<td>
					<input 
					type="text" 
					name="judul" 
					id="nama_materi" 
					class="form-control" 
					required
					placeholder="E.g. What is e-learning?" 
					>
					<small class="text-muted">Berikan judul yang mewakili isi tugas yang akan Anda buat.</small>
				</td>
			</tr>
			<tr>
				<td>Kelas/Mapel</td>
				<td>
					<div class="row">
						<div class="col-md-6">
							<div class="" style="position: relative;">
								<input type="text" name="kelas" class="form-control form-control-sm" value="1" readonly="">
								<!-- <select class="form-control" name="kelas" id="kelas" required="" style="width: 100%;">
									<option value="" selected="">Pilih Kelas</option>
									@foreach($all_kelas as $kelas)
										<option value="{{$kelas->id_kelas}}">{{$kelas->room_name}}</option>
									@endforeach
								</select> -->
							</div>
							<small class="text-muted">Pilih kelas dimana materi ini akan diberikan</small>
						</div>
						<div class="col-md-6">
							<input type="text" name="mapel" class="form-control form-control-sm" value="3" readonly="">
							<!-- <select class="form-control form-control-sm" id="mapel" name="mapel" required="" disabled="">
								
							</select> -->
							<small class="text-muted">Pilih mata pelajaran</small>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>Instruksi</td>
				<td>
					<textarea id="konten_materi" name="konten" required></textarea>
				</td>
			</tr>
			<tr>
				<td>
					Batas Waktu
				</td>
				<td>
					<div class="row">
						<div class="col-6">
							<input type="date" name="date" class="form-control form-control-sm" required="">
							<small>Pilih hari</small>
						</div>
						<div class="col-6">
							<input type="time" name="time" class="form-control form-control-sm" required="">
							<small>Tentukan Waktu</small>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>Lampiran</td>
				<td>
					<ul id="attachmentBox" style="list-style: none;"></ul>
					<div id="file-box"></div>
					<button class="btn btn-info btn-sm" id="add" type="button">Unggah File <i class="ion-upload"></i></button>
				</td>
			</tr>
		</table>
	</form>
</div>
<div class="container border mb-3 rounded" style="padding: 20px; background-color: white;">
	<header class="mb-2"><b>Semua Materi</b></header>
	<div class="alert alert-info" style="max-width: 600px; font-size: 14px;">
		Tabel dibawah ini menampilkan materi secara keseluruhan. Untuk mengelola materi pada kelas, harap masuk pada kelas masing - masing.
	</div>
	<div id="all_tugas_box" style="position: relative;">
		@include('muatan.tugas.component.all_tugas_comp')
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
	    $('#kelas').select2();
	});
	$('#kelas').on('change',function(){
		var value = $(this).val();
		var type = 'xhr';
		$.ajax({
			type : 'get',
			url : '{{URL::to('this_class_available_mapel')}}',
			data : {id_kelas:value,type:type},
			success:function(data)
			{
				$('#mapel').prop('disabled',false).html(data);
			}
		})
	});

	var i = 0;
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

	var konten = document.getElementById("konten_materi");
	    CKEDITOR.replace(konten,{
	    language:'en-gb'
	  });
  	CKEDITOR.config.allowedContent = true;
</script>
@endsection