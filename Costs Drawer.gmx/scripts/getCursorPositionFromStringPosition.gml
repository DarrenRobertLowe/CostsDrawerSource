/// getCursorPositionFromStringPosition()
/* count the number of characters on each line before ours.
 * Deduct that from our stringPosition. That tells us how many
 * chars are on our line alone before our current position.
*/


var quickList = ds_list_create();                       // create a throwaway list
formatDescription(quickList,workingString,0);           // convert workingString to a list
remove_extra_spaces(quickList);                         // remove any extra spaces
size = ds_list_size(quickList);                         // get the size of that list
cursorLine = 0;                                         // reset cursorLine



// iterate through each list item until we reach stringPosition
var total  = 0;
var length = 0;

for (var i=0; i<(size-1); i++) {                        // go through all but the last line
    var tempString  = ds_list_find_value(quickList,i);  // get the string for each line
    var length      = string_length(tempString);        // get the length of that string
    
    
    if (total +  length) < stringPosition {             // while we're not on the same line as stringPosition
        total += length;                                // add the whole line length to total chars so far
        cursorLine ++;                                  // add 1 to cursorLine
    }
    else {                                              // we're on stringPosition's line...
        break;
    }
}
cursorPosition = (stringPosition - total);              // this is the character position on the current line





/// get the X and Y coords
var tempString  = ds_list_find_value(quickList,cursorLine);
if !is_undefined(tempString) { // no text = no list
    tempString      = string_copy(tempString,0,cursorPosition);
    }
else tempString = "";


var stringWidth = string_width(tempString);
var spaceWidth  = string_width("  ");


if (cursorLine == 0)
{
    // first line?
    cursor_xx = (descriptionX + (stringWidth));
    cursor_yy = textPosY + ((cursorLine-1) * rowHeight);
}
else {
    // not the first line?
    cursor_xx = (descriptionX + spaceWidth + (stringWidth));
    cursor_yy = textPosY + ((cursorLine-1) * rowHeight);
}

// reposition the view
blinker_check_view(cursor_xx,cursor_yy);                                                               

ds_list_destroy(quickList);
