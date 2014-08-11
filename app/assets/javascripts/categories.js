$(document).ready(function(){
  
  // $("section.categories").height(1000);
  var firstCat = $("section.category a:first")
  var id = firstCat.attr("id");

  firstCat.addClass("active");

  hideResources();
  showResources(id);

  $("section#resources div.resources:first").show();
  
  $("section.category a").not("section.category a#add").on("click", function(event){
    removeActive();
    $(this).addClass("active");
    var id = $(this).attr("id");
    hideResources();
    showResources(id);
    event.preventDefault();
  });

});

function removeActive() {
  $("section.category a").removeClass("active")
};

function hideResources() {
  $(".resource").hide();
};

function showResources(id) {
  $(".resource[data-category="+id+"]").show();
};
