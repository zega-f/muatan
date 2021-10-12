<div class="container shadow rounded" id="option_create_box" style="max-width: 800px; padding: 20px; background-color: white;">
	<h5>Make Option <span style="float: right;" class="ion-android-close pointer" id="close_option_create_box"></span></h5>
	<hr>
	
		<form id="option_form" enctype="multipart/form-data" style="max-height: 70vh; overflow: auto;">
			@csrf
			<header><b>Question</b></header>
			<div style="font-size: 14px;">
				<?php echo $this_question->question; ?>
			</div>
			<input type="text" value="{{$this_question->id}}" hidden="" name="question_id">
			<div id="errorbag"></div>
			<input type="text" name="quiz_id" hidden="" value="{{$quiz_id}}">
			<div class="form-group mb-3">
				<header>Gambar Ilustrasi</header>
				<img src="" style="max-width: 375px; position: relative;" id="blah">
				<input type="file" name="option_img" id="file" accept="image/png, image/gif, image/jpeg" class="form-control-file form-control-sm" onchange="readURL(this);">
			</div>
			<textarea name="option_field" id="option_field"></textarea>
			<button class="btn btn-info btn-sm mt-2" id="saving_option" type="button">Save</button>
		</form>
</div>
<script type="text/javascript">
	$('#saving_option').click(function(){
		var option = CKEDITOR.instances['option_field'].getData();
		let optionForm = document.getElementById('option_form');
	    let optionFormData = new FormData(optionForm);
	    optionFormData.append('option', option);

		var question_id = '{{$this_question->question_id}}';
		$.ajax({
			type : 'post',
			url : '{{URL::to('store_option')}}',
			data : optionFormData,
			success:function(data)
			{
				if (data['type']=='fail') {
					$('#errorbag').html('<div class="alert alert-danger temp-alert">'+data['message']+'</div>')
					$('.temp-alert').delay(3000).fadeOut();
				}else{
					$('#option_body'+question_id+'{{$quiz_id}}').html(data);
					$('#option_create_box').remove();
					$('#new_option_modal').hide();
				}
			},
			cache: false,
		    contentType: false,
		    processData: false,
		})
	})
	$('#close_option_create_box').click(function(){
		$('#option_create_box').remove();
		$('#new_option_modal').hide();
	})

	var option = document.getElementById("option_field");
	    CKEDITOR.replace(option,{
	    language:'en-gb'
	  });
  	CKEDITOR.config.allowedContent = true;
</script>