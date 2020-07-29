/// format_confirmed_month(tempMonth);
/* 
 * Takes a string or real value and sets
 * dateMonth and monthString based on it.
*/


// tempMonth could be letters or digits or a mix of both
var monthDigits  = real(string_digits(argument0));                              // create a copy of month with only digits
var monthLetters = string_upper(string_letters(argument0));                     // create a copy of month with only letters
monthLetters     = string_copy(monthLetters,1,3);


// Change our string if letters
if (monthLetters == "JAN"){dateMonth = 1; monthString = "JAN"; exit};
if (monthLetters == "FEB"){dateMonth = 2; monthString = "FEB"; exit};
if (monthLetters == "MAR"){dateMonth = 3; monthString = "MAR"; exit};
if (monthLetters == "APR"){dateMonth = 4; monthString = "APR"; exit};
if (monthLetters == "MAY"){dateMonth = 5; monthString = "MAY"; exit};
if (monthLetters == "JUN"){dateMonth = 6; monthString = "JUN"; exit};
if (monthLetters == "JUL"){dateMonth = 7; monthString = "JUL"; exit};
if (monthLetters == "AUG"){dateMonth = 8; monthString = "AUG"; exit};
if (monthLetters == "SEP"){dateMonth = 9; monthString = "SEP"; exit};
if (monthLetters == "OCT"){dateMonth = 10; monthString = "OCT"; exit};
if (monthLetters == "NOV"){dateMonth = 11; monthString = "NOV"; exit};
if (monthLetters == "DEC"){dateMonth = 12; monthString = "DEC"; exit};

// Change our string if digits
if (monthDigits == 1){dateMonth = 1; monthString = "JAN"; exit};
if (monthDigits == 2){dateMonth = 2; monthString = "FEB"; exit};
if (monthDigits == 3){dateMonth = 3; monthString = "MAR"; exit};
if (monthDigits == 4){dateMonth = 4; monthString = "APR"; exit};
if (monthDigits == 5){dateMonth = 5; monthString = "MAY"; exit};
if (monthDigits == 6){dateMonth = 6; monthString = "JUN"; exit};
if (monthDigits == 7){dateMonth = 7; monthString = "JUL"; exit};
if (monthDigits == 8){dateMonth = 8; monthString = "AUG"; exit};
if (monthDigits == 9){dateMonth = 9; monthString = "SEP"; exit};
if (monthDigits == 10){dateMonth = 10; monthString = "OCT"; exit};
if (monthDigits == 11){dateMonth = 11; monthString = "NOV"; exit};
if (monthDigits == 12){dateMonth = 12; monthString = "DEC"; exit};

if (monthLetters == ""){dateMonth = 0; monthString = ""; exit};
if (monthDigits == 0){dateMonth = 0; monthString = ""; exit};
