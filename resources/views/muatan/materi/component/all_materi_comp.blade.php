<?php $all_materi = DB::table('coba_materi')->get(); ?>
<table class="table mt-3" id="materi_table">
	<thead>
		<tr>
			<th>Judul</th>
			<th>Kelas</th>
			<th>Mapel</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		@foreach($all_materi as $materi)
			<tr>
				<td>{{$materi->judul}}</td>
				<td>{{$materi->id_kelas}}</td>
				<td>{{$materi->mapel}}</td>
				<td>
					<a href="{{url('preview_materi/'.$materi->id_materi)}}" class="btn btn-sm btn-secondary ion-eye"></a>
					<a href="{{url('edit_materi/'.$materi->id_materi)}}" class="btn btn-info btn-sm ion-edit"></a>
					<button class="btn btn-sm btn-danger ion-trash-b" data-toggle="tooltip" data-placement="bottom" title="Hapus materi" data-id="{{$materi->id_materi}}"></button>
				</td>
			</tr>
		@endforeach
	</tbody>
</table>
<script type="text/javascript">
	$('.ion-trash-b').click(function(){
		var id = $(this).data('id');
		if (confirm('Apakah Anda yakin ingin menghapus materi ini? Menghapus materi akan menghapus semua lampiran dan file pendukung')) {
			$.ajax({
				type : 'get',
				url : '{{URL::to('delete_materi')}}',
				data : {id_materi:id}
				success:function(data)
				{
					$('#materi_box').html(data);
				}
			})
		}
	})
	$(document).ready(function(){
		$('#materi_table').DataTable();
	})
</script>