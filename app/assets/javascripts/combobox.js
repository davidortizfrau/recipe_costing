function getAllOptions(selectOptions) {
	var options = [];
  selectOptions.each(function(){
		options.push($(this).text());
  });
	return options;
};

$(document).ready(function(){
  $("select#recipe_ingredient_ingredient_id").hide();
	
	var options = $("select#recipe_ingredient_ingredient_id option");
	var a = getAllOptions(options);
	$("input#combobox").autocomplete({
      source: a
  });

  $("input#combobox").focusout(function(){
  	var value = $(this).val();
		$(this).hide();
		$("#recipe_ingredient_ingredient_id").show();
		$('#recipe_ingredient_ingredient_id option:contains(' + value + ')').attr("selected",true);
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
});