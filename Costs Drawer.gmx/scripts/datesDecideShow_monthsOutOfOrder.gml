var monthStr = "";
if dateMonth == 1  then monthStr = "January";
if dateMonth == 2  then monthStr = "February";
if dateMonth == 3  then monthStr = "March";
if dateMonth == 4  then monthStr = "April";
if dateMonth == 5  then monthStr = "May";
if dateMonth == 6  then monthStr = "June";
if dateMonth == 7  then monthStr = "July";
if dateMonth == 8  then monthStr = "August";
if dateMonth == 9  then monthStr = "September";
if dateMonth == 10 then monthStr = "October";
if dateMonth == 11 then monthStr = "November";
if dateMonth == 12 then monthStr = "December";

var monthStr2 = "";
if prevItem.dateMonth == 1  then monthStr2 = "January";
if prevItem.dateMonth == 2  then monthStr2 = "February";
if prevItem.dateMonth == 3  then monthStr2 = "March";
if prevItem.dateMonth == 4  then monthStr2 = "April";
if prevItem.dateMonth == 5  then monthStr2 = "May";
if prevItem.dateMonth == 6  then monthStr2 = "June";
if prevItem.dateMonth == 7  then monthStr2 = "July";
if prevItem.dateMonth == 8  then monthStr2 = "August";
if prevItem.dateMonth == 9  then monthStr2 = "September";
if prevItem.dateMonth == 10 then monthStr2 = "October";
if prevItem.dateMonth == 11 then monthStr2 = "November";
if prevItem.dateMonth == 12 then monthStr2 = "December";

/// WARN USER
errorString = "Timeline Error! Month "
            + string(monthStr) + " is not later than " +
            + string(monthStr2);

add_warning(errorString,row);

showMonth = 1;                                                  // shows the error
