/// get_last_word_width(string)
var str     = argument0;
var width   = 0;

for(var i=string_length(str); i>0; i--)
{
    var char = string_char_at(str,i);
    if (char == " ")
    {
        return width;
        exit;
    }
    
    width += string_width(char);
}

return width;
