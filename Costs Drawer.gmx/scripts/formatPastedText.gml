/// formatPastedText(string);

var str = argument0;

for(var i=0; i<string_length(str)+1; i++)
{
    var char = string_char_at(str,i);
    
    if  (char != " ")
    and (char != ",")
    and (char != ".")
    and (char != ">")
    and (char != "<")
    and (char != "'")
    and (char != '"')
    and (char != "!")
    and (char != "£")
    and (char != "$")
    and (char != "%")
    and (char != "&")
    and (char != "*")
    and (char != "(")
    and (char != ")")
    and (char != "€")
    and (char != "-")
    {
        char = string_lettersdigits(char); // convert to letters and digits
        
        if (char = "")  // if blank, delete that position as it's something weird
        {
            str = string_delete(str,i,1);
            i = 0;
        }
    }
}

return str;
