///get_real_version()
/* @return int
 * Takes a version string and modifies it so
 * that each group of digits is always 2 digits,
 * thus making them properly comparable as ints.
 * So:
 *  2.0.11  = 20011
 *  13.0.1  = 130001
 *  1.10.10 = 11010
 *
*/
//show_message("input string is "+string(argument0));
var version      = argument0;
var moddedString = "";
var number       = "";
var pos          = 0;


// FIRST DIGITS
pos = string_pos(".",version);
if (pos == 0) then pos = string_length(version)+1;

    number      = string_copy(version,0,pos-1);     // grab the number
    version     = string_delete(version,1,pos);     // trim version for next number
    // add a zero before it?
    if (string_length(number) == 1) then number = ("0" + number);
    moddedString += number;



// SECOND DIGITS
pos = string_pos(".",version);
if (pos == 0) then pos = string_length(version)+1;

    number      = string_copy(version,0,pos-1);     // grab the number
    version     = string_delete(version,1,pos);     // trim version for next number
    // add a zero before it?
    if (string_length(number) == 1) then number = ("0" + number);
    moddedString += number;



// THIRD DIGITS
pos = string_pos(".",version);
if (pos == 0) then pos = string_length(version)+1;

    number      = string_copy(version,0,pos-1);     // grab the number
    version     = string_delete(version,1,pos);     // trim version for next number
    // add a zero before it?
    if (string_length(number) == 1) then number = ("0" + number);
    moddedString += number;


// FOURTH DIGITS
/* (because game maker doesn't follow github's semantic versioning)
 * We'll just set this as 00 so it's always a bigger number than the
 * initial Costs Drawer versions.
*/
moddedString += "00";


//show_message("final version: "+string(real(string_digits(moddedString))));
return real(string_digits(moddedString));
