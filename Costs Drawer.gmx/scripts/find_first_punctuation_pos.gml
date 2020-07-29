/// find_first_punctuation_pos(string);
var str = argument0;
var a = 0;
while (a < string_length(str))
{
    a++;
    
    var char = (string_char_at(str,a));
    var prevChar;
    

    // allow 's (needed for Plaintiff's and Defendant's, etc)
    if (char == "s") 
    {
        var prevChar = string_char_at(str,a-1);
        if (prevChar == "'")
        {
            return a;
            exit;
        }
    }
    
    if is_punctuation(char)
    {
        return a;
        exit;
    }
}

return 0;
