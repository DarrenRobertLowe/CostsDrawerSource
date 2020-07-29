/// getStringPositionFromCursorPosition()


var quickList = ds_list_create();                       // create a throwaway list
formatDescription(quickList,workingString,0);           // convert workingString to a list
remove_extra_spaces(quickList);                         // remove any extra spaces
size = ds_list_size(quickList);                         // get the size of that list


// iterate through each list item until we reach stringPosition
var total  = 0;
var length = 0;

for (var i=0; i<cursorLine; i++)
{
    var tempString  = ds_list_find_value(quickList,i);      // get the string for each line
    length          += string_length(tempString);           // get the length of that string
}
length += cursorPosition;

stringPosition = length;


ds_list_destroy(quickList);
