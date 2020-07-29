/// decrypt_number(string);
// returns STRING
// first we need to decode base_64 it
var word = base64_decode(argument0);
//show_message("word after base64 decode:#"+string(word));

// then we need to decompress the string
word = decompress_encrypted(word);
//show_message("word after decryption:#"+string(word));

// now our string will be like FiFiZZOq
// so we need to get the last char
var char  = string_char_at(word, string_length(word));
////show_message("last char found to be "+string(char));

word = string_delete(word,string_length(word),1);
////show_message("word is now "+string(word));


// then the value that that character represents
var value = decrypt_add_counter_char(char);
if (value == -1)
{
    ////show_message("Invalid verification code! Please contact support!");
    return "invalid";
}
else
{
    /// Convert our string of chars back into a date string format DayMonthYear
    var unEncStr = "";
    
    while (string_length(word) > 0)
    {
        var pos  = string_length(word);
        var char = string_char_at(word,pos)
        //show_message("last char of word is "+string(char));
        
        if ( char != string_upper(char) )
        {
            pos--; // because it must be a two letter combination
        }
        
        var extractStr = string_copy(word,pos,string_length(word)); // copy the last contents
        
        ////show_message("extractStr, i.e. the last characters, is "+string(extractStr));
        
        word = string_delete(word,pos,string_length(word)); // trim the word
        ////show_message("word is now : "+string(word));
        
        
        if (extractStr == "T")  then unEncStr += "0";
        if (extractStr == "Fi") then unEncStr += "1";
        if (extractStr == "Z")  then unEncStr += "2";
        if (extractStr == "Tp") then unEncStr += "3";
        if (extractStr == "Fo") then unEncStr += "4";
        if (extractStr == "O")  then unEncStr += "5";
        if (extractStr == "E")  then unEncStr += "6";
        if (extractStr == "N")  then unEncStr += "7";
        if (extractStr == "Si") then unEncStr += "8";
        if (extractStr == "Se") then unEncStr += "9";
        //20181010 = 13
        //show_message("unEncStr is now : "+string(unEncStr));
    }
    
    ////show_message("unEncStr = "+string(unEncStr));
    
    
    /// COUNT AND COMPARE VALUES
    ////show_message("Now we'll compare values");
    
    var str = ( string_copy(unEncStr, 1, string_length(unEncStr)) );
    var count = 0;
    
    for (var i=1; i<=string_length(unEncStr); i++)
    {
        var digit = real(string_char_at(unEncStr,i));
        ////show_message("digit is "+string(digit));
        count += digit;
    }
    
    
    ////show_message("Count = "+string(count) +"#value = "+string(value));
    if (count != value)
    {
        ////show_message("Invalid verification code!");
        return "invalid";
    }
    else
    {
        // now our string is 
        ////show_message("Passed the value comparison check!");
        return unEncStr;
    }
}
