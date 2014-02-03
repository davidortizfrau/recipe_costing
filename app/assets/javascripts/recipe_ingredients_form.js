$(document).ready(function() {
	$("#new_recipe_ingredient").hide();
	$("#recipes_ingredient_form").on("click", "#add_ingredient", function(event){
		
		var text = $(this).text();

		// event.stopPropagation();
		
		$(this).text(text == "Add Ingredient" ? "Cancel" : "Add Ingredient");
		$("#new_recipe_ingredient").slideToggle();

		event.preventDefault();
	})
});