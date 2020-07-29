/// isLeapYear(dateYear)
/* Returns bool
 * Calculates whether the given year is a leap year.
*/

var year = argument0;

if (year mod 4 == 0) and (year mod 100 != 0)
or (year mod 400 == 0)
    then return true
else return false
