@extends('muatan.layout')
@section('content')
<div class="container border mb-3 rounded" style="padding: 20px; background-color: white; max-width: 1000px;">
	<form action="{{url('update_quiz/'.$this_quiz->quiz_id)}}" id="materi_form" method="post" enctype="multipart/form-data">
		@csrf
		<h5 class="mb-3">
			Quiz
			<span style="float: right; font-size: 14px; font-weight: normal;">
				<button class="btn btn-sm btn-primary">
					Simpan <i class="bi bi-check-square"></i>
				</button>
				<a href="{{url('unpublish_quiz/'.$this_quiz->quiz_id)}}" class="btn btn-success btn-sm">
					Publish <i class="ion-android-bulb"></i>
				</a>
				<button class="button orange-button">Warning button</button>
			</span>
		</h5>
		<table class="table">
			<tr>
				<td>Nama Quiz</td>
				<td>
					<input 
					type="text" 
					name="nama" 
					id="nama_materi" 
					class="form-control" 
					required
					placeholder="E.g. Quiz akhir tahun"
					value="{{$this_quiz->quiz_name}}" 
					>
					<small class="text-muted">Berikan nama yang mewakili isi quiz yang akan Anda buat.</small>
				</td>
			</tr>
			<tr>
				<td>Kelas/Mapel</td>
				<td>
					<div class="row">
						<div class="col-md-6">
							<div class="" style="position: relative;">
								<input type="text" name="kelas" class="form-control form-control-sm" value="VusuSJ" readonly="">
							</div>
							<small class="text-muted">Pilih kelas dimana materi ini akan diberikan</small>
						</div>
						<div class="col-md-6">
							<input type="text" name="mapel" class="form-control form-control-sm" value="3" readonly="">
							<small class="text-muted">Pilih mata pelajaran</small>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					Batas Waktu
				</td>
				<td>
					<input type="number" name="duration" class="form-control form-control-sm" required="" min="1" value="{{$this_quiz->time}}">
					<small>Berikan waktu pengerjaan pada quiz ini. <br>Ketika waktu pengerjaan telah habis, quiz pada siswa akan otomatis di kirim dan di nilai.</small>
				</td>
			</tr>
			<tr>
				<td>Nilai Minimum</td>
				<td>
					<input type="number" name="kkm" class="form-control form-control-sm" required="" max="100" value="{{$this_quiz->kkm}}">
					<small>Berikan nilai minimum kelulusan pada quiz ini</small>
				</td>
			</tr>
		</table>
	</form>
	<hr>
	<div id="question_box">
		@include('muatan.quiz.component.all_question')
	</div>
</div>
@endsection