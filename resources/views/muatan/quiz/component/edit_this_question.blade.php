<div class="container shadow" id="question_editor_box" style="max-width: 600px; padding: 20px; background-color: white;">
	<h5>Edit Question <span style="float: right;" class="ion-android-close pointer" id="close_question_editor_box"></span></h5>
	<hr>
		<textarea name="question_field" id="edit_question_field"><?php echo $this_question->question; ?></textarea>
		<button class="btn btn-info btn-sm mt-2" id="updating_question" type="button">Save</button>
	</form>
</div>
<script type="text/javascript">
	$('#updating_question').click(function(){
		var id = '{{$this_question->id}}';
		var new_question = CKEDITOR.instances['edit_question_field'].getData();
		$.ajax({
			type : 'post',
			url : '{{URL::to('updating_question')}}',
			data : {'_token':'{{ csrf_token() }}',question_id:id,edited_question:new_question},
			success:function(data)
			{
				$('#question_body'+id).html(new_question);
				$('#edit_question_modal').hide();
				$('#question_editor_box').remove();
			}
		})
	})
	$('#close_question_editor_box').click(function(){
		$('#edit_question_modal').hide();
		$('#question_editor_box').remove();
	})
	var edit_question = document.getElementById("edit_question_field");
	    CKEDITOR.replace(edit_question,{
	    language:'en-gb'
	  });
  	CKEDITOR.config.allowedContent = true;
</script>