$(function(){

	$("form").on('click', ".remove-fields", function(){
			$(this).prev('input[type=hidden]').val('1');
			$(this).closest(".row").hide();
			event.preventDefault();
	});
	
});

