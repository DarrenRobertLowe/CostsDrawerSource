/// encrypt_date(year,month,day);

var year    = argument0;
var month   = argument1;
var day     = argument2;

var year    = real(year);
var yearStr = string(real(year));


//show_message("month = "+string(month));
var monthStr = month;//"";

/*if (month < 10)
  then monthStr = "0"+string(real(month));
  else monthStr = string(real(month));
*/
  

//show_message("day = "+string(day));

//var dayStr = "";
/*
if (day < 10)
  then dayStr = "0"+string(real(day));
  else dayStr = string(real(day));
*/

var combinedStr = (yearStr + month+ day);
//show_message("combinedStr = "+string(combinedStr));

var encDate = encrypt_number(combinedStr);
return encDate;
