/// decrypt_number(string);
/* returns STRING
 * Note: Encryption is done via a separate encrypted 
 * code maker program.
 * This just decrypts what gets pulled from the server.
*/

var word = base64_decode(argument0);
word = base64_decode(word);
return word; // remove this if you return unEncStr instead.
//show_message("word after base64 decode:#"+string(word));


/*
// then we need to decompress the string
word = decompress_encrypted(word);
show_message("word after decryption:#"+string(word));

/// Convert our string of chars back into a string format costsdrawer19psswrd19^20200131
var unEncStr = "";

while (string_length(word) > 0)
{
    // note this goes backwards through the string
    var pos  = string_length(word);
    var char = string_char_at(word,pos)
    //show_message("last char of word is "+string(char));
    
    if ( char != string_upper(char) )
    {
        pos--; // because it must be a two letter combination
    }
    
    var extractStr = string_copy(word, pos, string_length(word)); // copy the last contents
    
    ////show_message("extractStr, i.e. the last characters, is "+string(extractStr));
    
    word = string_delete(word, pos, string_length(word)); // trim the word
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

return unEncStr;
*/



