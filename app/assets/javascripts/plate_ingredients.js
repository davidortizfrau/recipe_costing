$(document).ready(function() {
	$("#new_plate_ingredient").hide();
	$("#plate_ingredients_form").on("click", "#add_ingredient", function(event){
		
		var text = $(this).text();
		
		$(this).text(text == "Add Ingredient" ? "Cancel" : "Add Ingredient");
		$("#new_plate_ingredient").slideToggle();

		event.preventDefault();
	})
});