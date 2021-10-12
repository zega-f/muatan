<h5 class="mb-3">
	Pertanyaan 
	<span style="float: right;">
		<button class="btn btn-info btn-sm mb-3" data-toggle="modal" data-target="#add_question_modal">Pertanyaan <i class="ion-android-add"></i></button>
	</span>
</h5>
<!-- <div class="alert alert-danger" style="max-width: 500px; font-size: 14px;">
	Pertanyaan tanpa jawaban benar tidak akan ditampilkan pada user dan tetap bernilai benar.
</div> -->

@if(count($all_question)==0)
<div class="alert alert-info">Belum terdapat pertanyaan. Buat satu untuk memulai</div>
@else
	@foreach($all_question as $question)
		<div class="mb-3 border rounded question_body" id="question_container{{$question->id}}" style="padding: 20px; background-color: white; font-size: 16px;">
			<header class="mb-3" style="text-align: right;">
				<!-- <button class="btn btn-sm btn-info ion-edit edit_this_question" data-id="{{$question->id}}" data-toggle="tooltip" data-placement="bottom" title="Edit question"></button> -->
				<button class="btn btn-sm btn-success ion-android-add add_option" data-id="{{$question->id}}" data-toggle="tooltip" data-placement="bottom" title="Add Option"></button>
				<button class="btn btn-sm btn-danger ion-trash-b delete_this_question" data-id="{{$question->id}}" data-toggle="tooltip" data-placement="bottom" title="Delete Question"></button>
			</header>
			<hr>
			<div>
				<?php  
					$check_attachment = DB::table('quiz_question_attachment')
					->where([
						['quiz_id',$quiz_id],
						['question_id',$question->question_id]
					])
					->first();

					$question_img_id = explode('.', $check_attachment->filename);
				?>
				@if($check_attachment)
				<header><b>Attachment : </b></header>
				<div id="question-lampiran{{$question->id}}">
					<img 
						src="{{url('public/muatan/quiz/lampiran/'.$check_attachment->filename)}}" 
						width="200" 
						style="display: block;" 
						class="preview-question-img pointer" 
						data-url="{{url('public/muatan/quiz/lampiran/'.$check_attachment->filename)}}" id="img{{$question_img_id[0]}}"
						>
				</div>

				@endif
				<div>
					<header><b>Question <i class="pointer ion-edit edit_this_question" data-id="{{$question->id}}" data-toggle="tooltip" data-placement="bottom" title="Edit question" style="display: inline;"></i> : </b></header>
					<div id="question_body{{$question->id}}">
						<?php
							echo $question->question; 
						?>
					</div>
				</div>
			</div>
			<div id="option_body{{$question->question_id}}{{$quiz_id}}">
				<header><b>Choice : </b></header>
				@include('muatan.quiz.component.option_list')
			</div>
		</div>
		<script type="text/javascript">
			$('#question-lampiran{{$question->id}}').on('click','.preview-question-img', function(){
				var url = $(this).data('url');
				$('#preview-img').attr('src',url);
				$('#preview-img-modal').css({
					'display':'grid',
					'place-items':'center',
				});
			});

			$('#option_body{{$question->question_id}}{{$quiz_id}}').on('click','.edit-option{{$question->question_id}}{{$quiz_id}}',function(){
				var id = $(this).data('id');
				$.ajax({
					type : 'get',
					url : '{{URL::to('edit_option')}}',
					data : {option_id:id},
					success:function(data)
					{
						$('#editing_option_modal').css({
							'display':'grid',
							'place-items':'center',
						}).html(data);
					}
				})
			})

			// delete option
			$('#option_body{{$question->question_id}}{{$quiz_id}}').on('click','.delete-option{{$question->question_id}}{{$quiz_id}}',function(){
				var id = $(this).data('id');
				var question_id = $(this).data('question');
				$.ajax({
					type : 'get',
					url : '{{URL::to('delete_option')}}',
					data : {option_id:id,question_id:question_id,quiz_id:'{{$quiz_id}}'},
					success:function(data)
					{
						$('#option_body'+question_id+'{{$quiz_id}}').html(data);
						// $('#option_text'+id).remove();
					}
				})
			})

			// set as right answer
			$('#option_body{{$question->question_id}}{{$quiz_id}}').on('click','.option_radio{{$question->question_id}}{{$quiz_id}}',function(e){
				e.preventDefault();
				var id = $(this).data('id');
				var question_id = $(this).data('question');
				$.ajax({
					type : 'get',
					url : '{{URL::to('set_as_right_answer')}}',
					data : {option_id:id},
					success:function(data)
					{
						$('#radio'+question_id+id).prop("checked",true);
					},
					error: function()
					{
						alert('gagal');
					}
				})
			})
		</script>
	@endforeach
@endif

<div class="modal" id="edit_question_modal">
	
</div>

<div class="modal" id="new_option_modal">
	
</div>

<div class="modal" id="preview-img-modal">
	<div class="rounded shadow" style="position: relative; background-color: white;">
		<span class="ion-close-circled text-danger pointer close-preview" style="position: absolute; top: 30px; right: 50px; font-size: 2rem;"></span>
		<img src="" id="preview-img" style="max-height: 80vh; margin: 0 auto; display: block;">
	</div>
</div>

<script type="text/javascript">
	$('#preview-img-modal').click(function(e){
		if ($(e.target).is('#preview-img-modal')) {
			$('#preview-img-modal').fadeOut();
		}
	})

	$('.close-preview').click(function(){
		$('#preview-img-modal').hide();
	})

	// $('#coms_modal').click(function(e){
	// 	var coms = $('.coms_box');
	// 	if ($(e.target).is('#coms_modal')) {
	// 		$('#coms_modal').fadeOut();
	// 		// console.log('inside');
	// 	}
	// })
</script>