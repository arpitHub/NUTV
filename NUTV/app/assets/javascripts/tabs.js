var main = function() {
    $("#listtab").show();
    $("#progresstab").hide();
    $("#calendartab").hide();
  
  $("#listlink").click(function() {
    $("#listlink").addClass("is-active");
    $("#progresslink").removeClass("is-active");
    $("#calendarlink").removeClass("is-active");
    $("#listtab").show();
    $("#progresstab").hide();
    $("#calendartab").hide();
  });
  
  $("#progresslink").click(function() {
    $("#listlink").removeClass("is-active");
    $("#progresslink").addClass("is-active");
    $("#calendarlink").removeClass("is-active");
    $("#listtab").hide();
    $("#progresstab").show();
    $("#calendartab").hide();
  });
  
  $("#calendarlink").click(function() {
    $("#listlink").removeClass("is-active");
    $("#progresslink").removeClass("is-active");
    $("#calendarlink").addClass("is-active");
    $("#listtab").hide();
    $("#progresstab").hide();
    $("#calendartab").show();
  });
}

$(document).ready(main);
$(document).on('page:load', main);