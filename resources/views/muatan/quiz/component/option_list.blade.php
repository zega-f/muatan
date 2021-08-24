<?php
	if (isset($all_question)) {
		$question_id = $question->id;
	}

	$all_option = DB::table('quiz_option')
	->where([
		['quiz_question_id',$question_id]
	])
	->get();
	
?>
<table class="table" style="border: none;">
	@foreach($all_option as $option)
		<tr class="option_text" id="option_text{{$option->id}}" style="position: relative;">
			<td id="column{{$option->id}}"><?php echo $option->option_text; ?></td>
			<td style="width: 100px;">
				<i class="delete-option{{$question_id}} ion-trash-b text-danger pointer" data-id="{{$option->id}}"></i>
				<i class="edit-option{{$question_id}} ion-edit text-info pointer" data-id="{{$option->id}}"></i>
				<input type="radio" name="right_answer{{$question_id}}" id="radio{{$question_id}}{{$option->id}}" class="option{{$question_id}}"  data-id="{{$option->id}}" data-question="{{$question_id}}" <?php if ($option->benar==1) {
					echo "checked";
				}?>>
			</td>
		</tr>
	@endforeach
</table>
<div class="modal" id="editing_option_modal"></div>
<script type="text/javascript">
	$('.option{{$question_id}}').click(function(e){
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
	$('.edit-option{{$question_id}}').click(function(){
		var id = $(this).data('id');
		$.ajax({
			type : 'get',
			url : '{{URL::to('edit_option')}}',
			data : {option_id:id},
			success:function(data)
			{
				$('#editing_option_modal').show().html(data);
			}
		})
	})
	$('.delete-option').click(function(){
		var id = $(this).data('id');
		$.ajax({
			type : 'get',
			url : '{{URL::to('delete_option')}}',
			data : {option_id:id},
			success:function(data)
			{
				$('#option_text'+id).remove();
			}
		})
	})
</script>