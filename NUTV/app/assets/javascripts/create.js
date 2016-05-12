var main = function() { 
  $("#addproj").click(function() {
    $("#projform").removeClass("hidden");
    $(".content").addClass("blurred");
  });
  
  $("#close").click(function() {
    $("#projform").addClass("hidden");
    $("#projdisplay").addClass("hidden");
    $(".content").removeClass("blurred");
  });
  
  $(".edit").click(function() {
    $("#projdisplay").removeClass("hidden");
    $(".content").addClass("blurred");
  });
  
    $("#closedis").click(function() {
    $("#projdisplay").addClass("hidden");
    $(".content").removeClass("blurred");
  });
}

$(document).ready(main);
$(document).on('page:load', main);