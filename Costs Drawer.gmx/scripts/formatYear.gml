/// formatYear(tempYear);
// returns INT
var year        = string(argument0);

var yearDigits  = string_digits(year);
var yearReal    = real(yearDigits);

if (yearReal > 1900) {
    return yearReal;
    exit;
}
else {
    return yearReal; //"ERR!";
    exit;
}
