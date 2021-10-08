<?php 
$all_materi = DB::table('coba_materi')
->get(); 
?>
<table class="table mt-3" id="materi_table">
	<thead>
		<tr>
			<th>Judul</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		@foreach($all_materi as $materi)
			<tr>
				<td>{{$materi->judul}}</td>
				<td>
					<a href="{{url('preview_materi/'.$materi->id_materi)}}" class="btn btn-sm btn-secondary ion-eye"></a>
					<a href="{{url('edit_materi/'.$materi->id_materi)}}" class="btn btn-info btn-sm ion-edit"></a>
					<button class="btn btn-sm btn-danger ion-trash-b" data-toggle="tooltip" data-placement="bottom" title="Hapus materi" data-id="{{$materi->id_materi}}"></button>
				</td>
			</tr>
		@endforeach
	</tbody>
</table>
<div class="modal rounded" id="prog_modal" style="position: absolute;">
	<div class="rounded" style="padding: 20px; background-color: white;">Sedang Memproses</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#materi_table').DataTable();
	})
</script>