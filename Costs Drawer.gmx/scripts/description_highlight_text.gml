/// description_highlight_text();
var list = argument0;

var descriptionColumnX = global.descriptionColumnX;
var descriptionColumnWidth = global.descriptionColumnWidth;
var outlayColumnX = global.outlayColumnX;
var lineVal = 0; // how many chars per line up to the current line
var spacesWidth = string_width("  ");
var highlightingNow = false;


// START HIGHLIGHTING?
if ( mouse_check_button(mb_left) )
{
    if (highlightingText == false)
    {
        getStringPositionFromCursorPosition(); // gives stringPosition (start char).
        startChar = stringPosition;
        endChar   = stringPosition;
        highlightingText = true;
    }
}

if (startChar != endChar)
{
    highlightingText = true;
}



// HIGHLIGHT TEXT (click and drag)
if (highlightingText == true)
{
    // continuously update endChar position if we're holding the mouse button
    if ( mouse_check_button(mb_left) ) 
    {
        get_cursor_position_from_mouse();
        endChar = stringPosition;
    }
    
    
    // setup drawing
    var col = draw_get_color();
    var preDepth = depth;
    depth = -100000;
    draw_set_color(c_aqua);
    
    var e = endChar;
    var s = startChar;
    
    if (s > e)
    {
        s = endChar;
        e = startChar;
    }


    // DRAW RECTANGLE FROM startChar TO endChar
    for (var line=0; line<ds_list_size(list); line++) // go through each line
    {
        // format the string
        var str = "";
        str += ds_list_find_value(list,line); // add the actual string
        
        
        // go through each char...
        var direct = 0; // -1 = backwards, 1 = fowards
        for (var c=0; c<string_length(str); c++)
        {
            /// determine if we're highlighting...
            if  ( (c + lineVal) >= s )
            and ( (c + lineVal) < e )
            {
                highlightingNow = true;
                //direct = -1;
            }
            
            /// draw the highlighting
            if (highlightingNow == true)
            {
                var charPosOnLine = (s - lineVal);
                var tempStr = string_copy(str, 1, charPosOnLine);   //string_copy(workingString, lineVal, charPosOnLine);
                startX = ( descriptionColumnX + string_width(tempStr) );
                if (line > 0) then startX += spacesWidth;
                
                
                var charPosOnLine = (e - lineVal);
                var tempStr = string_copy(str, 1, charPosOnLine);   //string_copy(workingString, lineVal, charPosOnLine);
                endX = ( descriptionColumnX + string_width(tempStr) );
                if (line > 0) then endX += spacesWidth;
                
                
                var y1Val = ( global.pageStart + (row + line - 1) * global.rowHeight );
                var y2Val = ( y1Val + global.rowHeight );
                
                
                // draw the rectangle(s)
                draw_rectangle(startX, y1Val, endX, y2Val, false);
            }
        }
        
        lineVal += (string_length(str)); // add this line's char count so c knows if it's past the startChar or endChar.
    }
    
    if (s < e)
      then selectedString = string_copy(workingString, startChar, (endChar-startChar));//+1 was at end here
      else selectedString = string_copy(workingString, endChar, (startChar-endChar)); //was endChar+1
    
    
    //show_debug_message("selectedString = " +string(selectedString));
    depth = preDepth;
    draw_set_color(col);
}

