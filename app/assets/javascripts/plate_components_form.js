$(document).ready(function() {
	$("#new_plate_component").hide();
	$("#plate_component_form").on("click", "#add_component", function(event){
		
		var text = $(this).text();
		
		$(this).text(text == "Add Component" ? "Cancel" : "Add Component");
		$("#new_plate_component").slideToggle();

		event.preventDefault();
	})
});