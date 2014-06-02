$(document).ready(function() {
	$("#new_recipe_component").hide();
	$("#recipe_component_form").on("click", "#add_component", function(event){
		
		var text = $(this).text();
		
		$(this).text(text == "Add Component" ? "Cancel" : "Add Component");
		$("#new_recipe_component").slideToggle();

		event.preventDefault();
	})
});