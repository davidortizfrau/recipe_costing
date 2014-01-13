$(document).ready(function() {
	$("#new_component").hide();
	$("#recipes_ingredient_form").on("click", "#add_ingredient", function(event){
		
		var text = $(this).text();

		// event.stopPropagation();
		
		$(this).text(text == "Add Ingredient" ? "Cancel" : "Add Ingredient");
		$("#new_component").slideToggle();

		event.preventDefault();
	})
});