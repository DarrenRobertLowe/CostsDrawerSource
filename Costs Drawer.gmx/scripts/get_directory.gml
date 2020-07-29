///get_directory(string);
var str = argument0;
var fileDirectory = "";
var pos = string_length(str);

// find the directory (iterate backwards through the string until we find "\")
while (pos > 0) 
{
    if (string_char_at(str, pos) == "\")    // check for "\"
    {
        fileDirectory = string_copy(str, 1, pos);                       // grab everything up to the last "\"
        break;
    }
    
    pos--;  // iterate backwards
}

return fileDirectory;
