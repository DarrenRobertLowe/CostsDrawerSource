/// validate_year();
var yearReal = real(dateYear);

if  (yearReal == 0)         // we don't want "ERR" and a warning when 0
or  (yearReal > 1900)       // really this should be more like 2010, but you never know.
{
    // success
    return true;
    exit;
}
else
{
    // ERROR!
    return false;
    exit;
}
