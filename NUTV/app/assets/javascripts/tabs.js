var main = function() {
    sessionStorage.setItem('activeTab', 'listtab');
    $("#listtab").hide();
    $("#progresstab").hide();
    $("#calendartab").hide();
  //alert(sessionStorage.getItem('activeTab'));
    $("#" + sessionStorage.getItem('activeTab')).show();

  $("#listlink").click(function() {
    $("#listlink").addClass("is-active");
    $("#progresslink").removeClass("is-active");
    $("#calendarlink").removeClass("is-active");
    $("#listtab").show();
    $("#progresstab").hide();
    $("#calendartab").hide();
    sessionStorage.setItem('activeTab', 'listtab');
    //alert(sessionStorage.getItem('activeTab'));
  });
  
  $("#progresslink").click(function() {
    $("#listlink").removeClass("is-active");
    $("#progresslink").addClass("is-active");
    $("#calendarlink").removeClass("is-active");
    $("#listtab").hide();
    $("#progresstab").show();
    $("#calendartab").hide();
    sessionStorage.setItem('activeTab', 'progresstab');
    //alert(sessionStorage.getItem('activeTab'));
  });
  
  $("#calendarlink").click(function() {
    $("#listlink").removeClass("is-active");
    $("#progresslink").removeClass("is-active");
    $("#calendarlink").addClass("is-active");
    $("#listtab").hide();
    $("#progresstab").hide();
    $("#calendartab").show();
    sessionStorage.setItem('activeTab', 'calendartab');
    //alert(sessionStorage.getItem('activeTab'));
  });
  
}

$(document).ready(main);
$(document).on('page:load', main);