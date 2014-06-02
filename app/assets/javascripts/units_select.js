$(document).ready(function(){

	$("#recipe_ingredient_ingredient_id").change(function(){
		var ozcup = $( "#recipe_ingredient_ingredient_id option:selected" ).attr("data-ozcup")
		var unit = $( "#recipe_ingredient_ingredient_id option:selected" ).attr("data-unit")
		if (unit == "weight" && ozcup == "false") {
			$(".option_unit[data-unit!=weight]").remove();
		};
		if (unit == "volume" && ozcup == "false") {
			$(".option_unit[data-unit!=volume]").remove();
		};
		if (unit == "other") {
			$(".option_unit[data-unit!=other]").remove();
		};
	});

	$("#plate_ingredient_ingredient_id").change(function(){

		var ozcup = $( "#plate_ingredient_ingredient_id option:selected" ).attr("data-ozcup");
		var unit = $( "#plate_ingredient_ingredient_id option:selected" ).attr("data-unit");
		if (unit == "weight" && ozcup == "false") {
			$(".option_unit[data-unit!=weight]").remove();
		};
		if (unit == "volume" && ozcup == "false") {
			$(".option_unit[data-unit!=volume]").remove();
		};
		if (unit == "other") {
			$(".option_unit[data-unit!=other]").remove();
		};
	});

	$("#recipe_component_component_id").change(function(){
		var unit = $( "#recipe_component_component_id option:selected" ).attr("data-unit")
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

	$("#plate_component_recipe_id").change(function(){
		var unit = $( "#plate_component_recipe_id option:selected" ).attr("data-unit")
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