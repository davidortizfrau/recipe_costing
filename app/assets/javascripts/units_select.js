$(document).ready(function(){

	$("#recipe_ingredient_ingredient_id").change(function(){
			
		var unit = $( "#recipe_ingredient_ingredient_id option:selected" ).attr("data-unit")
		
		if (unit == "weight") {
			$(".option_unit[data-unit!=weight]").remove();
		};

		if (unit == "volume") {
			$(".option_unit[data-unit!=volume]").remove();
		};
		
		if (unit == "other") {
			$(".option_unit[data-unit!=other]").remove();
		};

	});

});