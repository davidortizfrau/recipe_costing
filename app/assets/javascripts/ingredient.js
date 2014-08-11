$(document).ready(function(){
  $("aside").hide().fadeIn();
  $("#ingredient_name").focus();

  $("select#ingredient_ingredient_category_id").focus(function(){
    $("aside").fadeOut(function(){
    	showTipCategory();
    });
  });

  $("input#ingredient_price").focus(function(){
  	$("aside").fadeOut(function(){
    	showTipPrice();
    });
  });

  $("select#ingredient_unit").focus(function(){
    $("aside").fadeOut(function(){
    	showTipUnit();
    });
  });

  $("input#ingredient_inventory").focus(function(){
  	$("aside").fadeOut(function(){
      showTipInventory();
    });
  });

  $("input#ingredient_yield").focus(function(){
  	$("aside").fadeOut(function(){
      showTipYield();
    });
  });

  $("input#ingredient_ounces_per_cup").focus(function(){
  	$("aside").fadeOut(function(){
      showTipOuncesPerCup();
    });
  });
});

function hideAside() {
	$("aside").fadeOut();
};

function showAside() {
	$("aside").fadeIn();
};

function showTipCategory() {
  $("aside p").text("You can change and add your own ingredient categories");
  $("aside ul").html("<li>Dry</li> <li>Canned</li>");
  showAside();
};

function showTipPrice() {
  $("aside p").text("Put price per single unit");
  $("aside ul").html("<li>If 5 pounds of Flour costs $5.00, divide $5 by 5 pounds to get $1.00</li> <li>1.00 should be in the price input field</li> <hr><li>If a dozen eggs costs $4.00, divide $4 by 12 eggs to get $0.34 (rounding up a cent)</li> <li>0.34 should be in the price input field</li>");
  showAside();
};

function showTipUnit() {
  $("aside p").text("The unit here should be the unit used to calculate the price. Also this unit is the unit used to measure how much inventory you have of said ingredient.");
  $("aside ul").html("<li>If 5 pounds of Flour costs $5.00</li> <li>You should select lb from options</li> <hr><li>If a dozen eggs costs $4.00</li> <li>You should select ea from options if price was calculated by dividing price by 12</li>");
  showAside();
};

function showTipInventory() {
  $("aside p").text("This is the quantity of product at hand given in units used to calculate price.");
  $("aside ul").html("<li></li>");
  showAside();
};

function showTipYield() {
  $("aside p").text("Yield or Edible Portion.");
  $("aside ul").html("<li></li>");
  showAside();
};

function showTipOuncesPerCup() {
  $("aside p").text("Ounces per cup");
  $("aside ul").html("<li></li>");
  showAside();
};