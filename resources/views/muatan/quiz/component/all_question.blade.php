<h5 class="mb-3">
	Pertanyaan 
	<span style="float: right;">
		<button class="btn btn-info btn-sm mb-3" id="add_question">Pertanyaan <i class="ion-android-add"></i></button>
	</span>
</h5>
<?php 
	if (isset($this_quiz)) {
		$quiz_id = $this_quiz->quiz_id;	
	}

	$all_question = DB::table('quiz_question')
	->where('quiz_id',$quiz_id)
	->get();
	
?>

@if(count($all_question)==0)
<div class="alert alert-info">Belum terdapat pertanyaan. Buat satu untuk memulai</div>
@else
	@foreach($all_question as $question)
		<div class="mb-3 border rounded question_body" id="question_container{{$question->id}}" style="padding: 20px; font-size: 14px;">
			<header class="mb-3" style="text-align: right;">
				<button class="btn btn-sm btn-info ion-edit edit_this_question" data-id="{{$question->id}}" data-toggle="tooltip" data-placement="bottom" title="Edit question"></button>
				<button class="btn btn-sm btn-success ion-android-add add_option" data-id="{{$question->id}}" data-toggle="tooltip" data-placement="bottom" title="Add Option"></button>
				<button class="btn btn-sm btn-danger ion-trash-b delete_this_question" data-id="{{$question->id}}" data-toggle="tooltip" data-placement="bottom" title="Delete Question"></button>
			</header>
			<div id="question_body{{$question->id}}">
				<?php echo $question->question; ?>
			</div>
			<div id="option_body{{$question->id}}">
				<?php  
					$all_option = DB::table('quiz_option')
					->where([
						['quiz_id',$quiz_id],
						['quiz_question_id',$question->id]
					])
					->get();
				?>
				<ul id="list{{$question->id}}">
					@foreach($all_option as $option)
						<li class="option_text"><?php echo $option->option_text; ?></li>
					@endforeach
				</ul>
			</div>
		</div>
	@endforeach
@endif

<div class="modal" id="edit_question_modal">
	
</div>

<div class="modal" id="new_option_modal">
	
</div>

<div class="modal" id="add_question_modal">
	<div class="container" style="padding: 20px; background-color: white;">
		<h5>New Question <span style="float: right;" class="ion-android-close pointer" id="close_add_question_modal"></span></h5>
		<form id="question_form">
			<table class="table">
				<tr>
					<td>Question</td>
					<td>
						<textarea name="question_field" id="question_field"></textarea>
					</td>
				</tr>
			</table>
			<button class="btn btn-info btn-sm" id="saving_question" type="button">Save</button>
		</form>
	</div>
</div>

<script type="text/javascript">
	var konten = document.getElementById("question_field");
	    CKEDITOR.replace(konten,{
	    language:'en-gb'
	  });
  	CKEDITOR.config.allowedContent = true;
</script>
<script type="text/javascript">
	$('.option_text').click(function(){
		$(this).hide();
	})
	$('.add_option').click(function(){
		var id = $(this).data('id');
		$.ajax({
			type : 'get',
			url : '{{URL::to('create_option')}}',
			data : {question_id:id},
			success:function(data)
			{
				$('#new_option_modal').css({
					'display':'grid',
					'place-items':'center',
				}).html(data);
			}
		})
	})
	$('.delete_this_question').click(function(){
		var id = $(this).data('id');
		if (confirm('Apakah Anda yakin ingin menghapus pertanyaan ini? Semua pilihan jawaban juga akan dihapus')) {
			$.ajax({
				type : 'get',
				url : '{{URL::to('delete_this_question')}}',
				data : {question_id:id},
				success:function(data)
				{
					$('#question_container'+id).remove();
				}
			})
		}
	})
	$('.edit_this_question').click(function(){
		var id = $(this).data('id');
		$.ajax({
			type : 'get',
			url : '{{URL::to('edit_this_question')}}',
			data : {question_id:id},
			success:function(data)
			{
				$('#edit_question_modal').html(data).css({
					'display':'grid',
					'place-items':'center',
				});
			}
		})
	})

	$('#saving_question').click(function(){
		var quiz_id = '{{$quiz_id}}';
		// var question = $('textarea[name="question_field"]').val();
		var question = CKEDITOR.instances['question_field'].getData();
		$.ajax({
			type : 'post',
			url : '{{URL::to('store_question')}}',
			data : {'_token':"{{ csrf_token() }}",quiz_id:quiz_id,question:question},
			success:function(data)
			{
				$('#add_question_modal').hide();
				$('#question_form')[0].reset();
				$('#question_box').html(data);
			}
		})
	})
	$('#add_question').click(function(){
		$('#add_question_modal').css({
			'display':'grid',
			'place-items':'center',
		});
	})
	$('#close_add_question_modal').click(function(){
		$('#add_question_modal').hide();
		$('#question_form')[0].reset();
	})
</script>