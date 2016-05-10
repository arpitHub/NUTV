/*
Any-Month calendar script- Rob Patrick (rpatrick@mit.edu)
Script featured on and available at:
http://www.javascriptkit.com/
*/

var month;
var year;

var main = function setToday() {
  var now   = new Date();
  var day   = now.getDate();
  month = now.getMonth();
  year  = now.getYear();
  if (year < 2000)
  year = year + 1900;
  this.focusDay = day;
  
  displayCalendar(month, year);
}

function nextMonth() {
  month++;
  if (month == 12) {
    month = 0;
    year += 1;
  }
  
  displayCalendar(month, year);
}

function prevMonth() {
  month--;
  if (month == -1) {
    month = 11;
    year -= 1;
  }
  
  displayCalendar(month, year);
}

function isFourDigitYear(year) {
if (year.length != 4) {
alert ("Sorry, the year must be four-digits in length.");
document.calControl.year.select();
document.calControl.year.focus();
} else { return true; }
}

function selectDate() {
var year  = document.calControl.year.value;
if (isFourDigitYear(year)) {
var day   = 0;
var month = document.calControl.month.selectedIndex;
displayCalendar(month, year);
    }
}

function displayCalendar(month, year) {       
  month = parseInt(month);
  year = parseInt(year);
  var i = 1;
  var days = getDaysInMonth(month + 1,year);
  var firstOfMonth = new Date (year, month, 1);
  var startingPos = firstOfMonth.getDay();
  var id = startingPos;
  
  for (i = 0; i < 42; i++) {
    $("#" + i.toString()).text(" ");
  }
  
  for (i = 1; i < days + 1; i++) {
    $("#" + id.toString()).text(i.toString());
    id++;
  }
  
  $("#calendartitle").text(monthLookup(month) + " " + year.toString());
}

function getDaysInMonth(month,year)  {
var days;
  if (month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12)  days=31;
  else if (month==4 || month==6 || month==9 || month==11) days=30;
  else if (month==2)  {
  if (isLeapYear(year)) { days=29; }
  else { days=28; }
  }
  
  return (days);
}

function monthLookup(month) {
  if (month === 0) {
    return "January";
  }
  if (month == 1) {
    return "February";
  }
  if (month == 2) {
    return "March";
  }
  if (month == 3) {
    return "April";
  }
  if (month == 4) {
    return "May";
  }
  if (month == 5) {
    return "June";
  }
  if (month == 6) {
    return "July";
  }
  if (month == 7) {
    return "August";
  }
  if (month == 8) {
    return "September";
  }
  if (month == 9) {
    return "October";
  }
  if (month == 10) {
    return "November";
  }
  if (month == 11) {
    return "December";
  }
}

function isLeapYear (Year) {
  if (((Year % 4)===0) && ((Year % 100)!==0) || ((Year % 400)===0)) {
  return (true);
  } else { return (false); }
} 

$(document).ready(main);
$(document).on('page:load', main);