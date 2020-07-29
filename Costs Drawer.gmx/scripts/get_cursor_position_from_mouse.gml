// get_cursor_position_from_mouse();

var quickList = ds_list_create();                           // create a throwaway list
formatDescription(quickList,workingString,0);               // convert workingString to a list
remove_extra_spaces(quickList);                             // remove any extra spaces


/// find the correct line
var relativeY   = (mouse_y - borderStartY);
cursorLine      = floor(relativeY / global.rowHeight);



// find the char position
var tempString  = ds_list_find_value(quickList,cursorLine); // grab the string from cursorY

if  !(is_undefined(tempString))
{
    var length      = string_length(tempString);                // get the length of that string
    
    var relativeX   = (mouse_x - global.descriptionColumnX);    // where on the description field we're clicking
    var cursorX     = (relativeX / string_width(tempString));
    
    
    for(var i=1; i<length; i++)
    {
        var stringSoFar = string_copy(tempString,1,i);
        
        if (cursorLine > 0)
          then width = string_width("  " + string(stringSoFar));
          else width = string_width(stringSoFar);
        
        
        if (width > relativeX)
        {
            cursorPosition = (i-1);
            if (cursorPosition <= 0) then cursorPosition = 0;
            break;
        }
        
        
        if (relativeX > width)
        {
            cursorPosition = length;
        }
    }
    
    getStringPositionFromCursorPosition();
}
