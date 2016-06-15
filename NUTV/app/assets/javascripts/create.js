var main = function() {
  $(".actions").click(function() {
    $("#projform").removeClass("hidden");
    $(".pcontent").addClass("blurred");
  });
  
  $("#close").click(function() {
    $("#projform").addClass("hidden");
    $("#projdisplay").addClass("hidden");
    $(".pcontent").removeClass("blurred");
  });
  
  $(".edit").click(function() {
    $("#projdisplay").removeClass("hidden");
    $(".pcontent").addClass("blurred");
  });
  
  $("#closedis").click(function() {
  $("#projdisplay").addClass("hidden");
  $(".pcontent").removeClass("blurred");
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
  
  $("#projaddeven").click(function() {
    $("#eventform").removeClass("hidden");
    $(".detailscontent").addClass("blurred");
  });
  
  $(".signupbutton").unbind().click(function() {
    $(".signupbutton").addClass("hidden");
    alert(currUser);
  });
  
  $('#eventform').change(function(e) {
    if($('.shootbutton').is(":checked")){
      $(".equipmentreserve").removeClass("hidden");  
    }
    else {
      $(".equipmentreserve").addClass("hidden");
    }
  });
  
  $('.editform').change(function(e) {
    if($('.shootbutton').is(":checked")){
      $(".equipmentreserve").removeClass("hidden");  
    }
    else {
      $(".equipmentreserve").addClass("hidden");
    }
  });
 
}
 
$(document).ready(main);
$(document).on('page:load', main);
$(window).load(main);