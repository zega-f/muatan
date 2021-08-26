@extends('muatan.layout')
@section('content')
<div id="materi_box">
	@include('muatan.materi.component.all_materi_comp')
</div>
<script type="text/javascript">
	$('#materi_box').on('click','.ion-trash-b',function(){
		var id = $(this).data('id');
		if (confirm('Apakah Anda yakin ingin menghapus materi ini? Menghapus materi akan menghapus semua lampiran dan file pendukung')) {
			$('#prog_modal').css({
				'display':'grid',
				'place-items':'center',
			});
			$.ajax({
				type : 'get',
				url : '{{URL::to('delete_materi')}}',
				data : {id_materi:id},
				success:function(data)
				{
					$('#prog_modal').hide();
					$('#materi_box').html(data);
				}
			})
		}
	})
</script>
@endsection