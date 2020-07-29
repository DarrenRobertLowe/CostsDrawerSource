/// validate_month(dateMonth);
/*
 * RETURNS: bool
 * 
*/
var month        = string_upper( string(dateMonth) );   // convert to upper case string
var monthDigits  = string_digits(month);                // create a copy of month with only digits
var monthLetters = string_letters(month);               // create a copy of month with only letters


// Null Cases
if (string_length(monthLetters) == string_length(month))    // if there are only letters...
{
    if (monthLetters == "")                                 // and nothing is written...
    {
        return true;                                        // date is valid!
        exit;
    }
}
if  (string_length(monthDigits) == string_length(month))    // if there are only digits...
{
    if (monthDigits == 0)                                   // and it's just 0...
    {
        return false;                                       // date is valid!
        exit;
    }
}


// DIGIT BASED MONTH
if ( string_length(monthDigits) > 0 )                           // date contains digits
{
    if (string_length(monthDigits) == string_length(month))     // and ONLY digits
    {
        var monthReal = real(month);                            // get the actual number (e.g. 004 = 4)
        
        if ((monthReal >= 0) and (monthReal < 13))              // as long as it's a valid month number
        {
            return true;                                        // date is valid.
            exit;
        }
        else // ERROR!
        {
            return false;
            exit;
        }
    }
    else                                                        // string contains both digits AND letters
    {
        return false;                                           // so it's invalid!
        exit;
    }
}




// LETTER BASED MONTH
if ( string_length(monthLetters) > 0 )                          // date contains letters
{
    if ( string_length(monthLetters) == string_length(month) )  // and ONLY letters
    {
        if (monthLetters == "JAN")                              // and is one of these strings...
        or (monthLetters == "FEB")
        or (monthLetters == "MAR")
        or (monthLetters == "APR")
        or (monthLetters == "MAY")
        or (monthLetters == "JUN")
        or (monthLetters == "JUL")
        or (monthLetters == "AUG")
        or (monthLetters == "SEP")
        or (monthLetters == "OCT")
        or (monthLetters == "NOV")
        or (monthLetters == "DEC")
        {
            // success!
            return true;                                        // date is valid.
        }
        else                                                    // date is not one of the valid strings.
        {
            // ERROR!
            return false;
            exit;
        }
    }
    else                                                        // string contains both letters and numbers 
    {
        // ERROR!
        return false;                                           // so it's invalid!
        exit;
    }
}
