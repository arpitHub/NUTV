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
  
  $("#addevent").click(function() {
    $("#eventform").removeClass("hidden");
    $(".detailscontent").addClass("blurred");
  });
  
  $('#eventbox').change(function(){
    if(this.checked) {
      $("#addevent").removeClass("hidden");
    }
    else {
      $("#addevent").addClass("hidden");
    }
  });
  
  $("#closeevent").click(function() {
    $("#eventform").addClass("hidden");
    $(".detailscontent").removeClass("blurred");
  });

  $("th").click(function() {
    $(".sortarrow").removeClass("hidden");
  })
  
  $('#addevent').change(function(e) {
    if($('#shootbutton').is(":checked")){
      $(".equipmentreserve").removeClass("hidden");  
    }
    else {
      $(".equipmentreserve").addClass("hidden");
    }
  });
    
}

$(document).ready(main);
$(document).on('page:load', main);