/// formatQuantum(double)
/*  
 *  returns string "stringVal"
 *  
 *  Converts argument0 into a string.
 *  Trims that string to two decimal places.
 *  Removes leading zeros.
 *  Groups digits with ",".
*/

var stringVal       = string(argument0);

if (string_length(stringVal) > 0)
and(string_length(string_digits(stringVal)) == 0)
{
    stringVal = NOQUANTUM; //"-.--"
}
else
{
    var length          = string_length(stringVal);
    var decimalPoint    = -1;
    
    
    // Search for decimal
    length              = string_length(stringVal);                         // update the length variable
    for(i=length;i>0;i--) {
        var tempChar    = string_char_at(stringVal,i)                       // iterate backwards through the string
        
        if tempChar == "." {                                                // if the current character is a decimal
            decimalPoint = i;                                               // this is the position of the decimal point
        }
    }
    
    
    // Remove any non-digits and re-add the decimal place
    if decimalPoint > -1{                                                   // IF THERE'S A DECIMAL...
        var stringBeforeDecimal
            = string_copy(stringVal,0,decimalPoint);                        // create the stringBeforeDecimal var
        var stringAfterDecimal
            = string_copy(stringVal,decimalPoint,string_length(stringVal)); // create the stringAfterDecimal var
        
        stringBeforeDecimal = string_digits(stringBeforeDecimal);           // convert stringBeforeDecimal into digits
        stringAfterDecimal = string_digits(stringAfterDecimal);             // convert stringAfterDecimal into digits
        stringAfterDecimal = string_copy(stringAfterDecimal,0,2);           // trim stringAfterDecial to 2 decimal places
        stringVal = stringBeforeDecimal+"."+stringAfterDecimal;             // concatenate the strings e.g. "xxxx.yy"
        }
    else{                                                                   // IF THERE'S NO DECIMAL...
        var stringBeforeDecimal
            = string_copy(stringVal,0,string_length(stringVal));            // create the stringBeforeDecimal var
        
        stringBeforeDecimal = string_digits(stringBeforeDecimal);           // convert into digits
        stringVal = stringBeforeDecimal+".00";                              // add ".00" string to end
    }
    
    
    
    // convert string to a real number to remove leading zeros
    stringVal = real(stringVal);                                            // convert to a real number
    stringVal = string(stringVal);                                          // convert back into string for further processing
    
    
    // Search for decimal again
    length  = string_length(stringVal);                                     // update the length variable
    decimalPoint = -1;                                                      // reset decimalPoint to an impossible position
    for(i=length;i>-1;i--)
    {
        var tempChar = string_char_at(stringVal,i)                          // iterate backwards through the string
        
        if (tempChar == ".")                                                // if the current character is a decimal
        {
            decimalPoint = i;                                               // this is the position of the decimal point
        }
    }
    
    
    // Always have two decimal places
    if decimalPoint == -1 {                                                 // if there's not even a decimal point
        stringVal += ".00";                             
    }
    
    if length - decimalPoint = 0 {                                          // if the last character is the decimal
        stringVal += "00";               
    }
    
    if length - decimalPoint = 1 {                                          // if there's only 1 decimal number after decimal point
        stringVal += "0";             
    }
    if length - decimalPoint = 2 {                                          // if there's 2 decimal numbers
        stringVal += "";                               
    }
    decimalPoint = string_length(stringVal)-2;                              // set the new position of the decimalPoint var
    
    
    
    // Insert digit group commas every 3rd digit from the back
    /*
    length  = string_length(stringVal);                                     // update the length variable
    for(i=(decimalPoint-3);i>0;i-=3){                                       // iterate backwards through string 3 digits at a time, skipping over the first few chars i.e. 123.00
        if (i > 1) {                                                        // we don't want commas as the left-most character
            stringVal = string_insert(",",stringVal,i);                     // insert "," where needed
            }
    }
    */
    
    // Final formatting
    if (real(stringVal) = 0)
    {
        stringVal = "";
    }

}


return stringVal;
