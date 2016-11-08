var main = function() {
  
  if (sessionStorage.getItem('activeTab') === null) {
    sessionStorage.setItem('activeTab', 'listtab');
    sessionStorage.setItem('activeLink', 'listlink');
  }
  
  $("#listtab").hide();
  $("#progresstab").hide();
  $("#calendartab").hide();
  $("#" + sessionStorage.getItem('activeTab')).show();
  
  $("#listlink").removeClass("is-active");
  $("#progresslink").removeClass("is-active");
  $("#calendarlink").removeClass("is-active");
  $("#" + sessionStorage.getItem('activeLink')).addClass("is-active");

  $("#listlink").click(function() {
    $("#listlink").addClass("is-active");
    $("#progresslink").removeClass("is-active");
    $("#calendarlink").removeClass("is-active");
    $("#listtab").show();
    $("#progresstab").hide();
    $("#calendartab").hide();
    sessionStorage.setItem('activeTab', 'listtab');
    sessionStorage.setItem('activeLink', 'listlink');
  });
  
  $("#progresslink").click(function() {
    $("#listlink").removeClass("is-active");
    $("#progresslink").addClass("is-active");
    $("#calendarlink").removeClass("is-active");
    $("#listtab").hide();
    $("#progresstab").show();
    $("#calendartab").hide();
    sessionStorage.setItem('activeTab', 'progresstab');
    sessionStorage.setItem('activeLink', 'progresslink');
  });
  
  $("#calendarlink").click(function() {
    $("#listlink").removeClass("is-active");
    $("#progresslink").removeClass("is-active");
    $("#calendarlink").addClass("is-active");
    $("#listtab").hide();
    $("#progresstab").hide();
    $("#calendartab").show();
    sessionStorage.setItem('activeTab', 'calendartab');
    sessionStorage.setItem('activeLink', 'calendarlink');
  });
  
}

$(document).ready(main);
$(document).on('page:load', main);