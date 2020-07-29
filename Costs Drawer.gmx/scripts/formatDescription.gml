///formatDescription(descriptionList, description, draw to screen?)
/// formatDescription(list,string)
/* argument0 = The list to store the string to.
 * argument1 = The string text to be separated into a list.
 * argument2 = 0 or 1, 0 = format to a list, 1 = draw to the screen
 * Returns: ds_list
 *
 * Takes a string and converts it to a list of strings for
 * displaying the way it should on a spreadsheet.
 * This method allows a user to simply type as much text as
 * they like and the program will automagically format it
 * all out, even separating on spaces rather than splitting
 * words across the lines.
*/

ds_list_clear(argument0);
draw_set_font(font_Times);

var description = string(argument1);                                                // the string to be formatted


// SETUP //
var descriptionWidth = global.descriptionTextWidth;                                 // WE DON'T TAKE SCALE INTO CONSIDERATION FOR THIS CALCULATION!


// change width for bold text
if (object_index == PLAINTIFF)
or (object_index == DEFENDANT)
{
    descriptionWidth /= 1.5; // because bold text CAPS
}

if (object_index == WITNESS)
{
    descriptionWidth /= 1.10; // because bold text
}



// add spaces to paragraph item descriptions
if (countMyItemNumber == false)
{
    if  (object_index != PLAINTIFF)
    and (object_index != DEFENDANT)
    and (object_index != WITNESS)
      then description = "  " +string(description);
}



for (var n=0; string_length(description)>0; n++)                                    // while there's still some string left...
{
    draw_set_font(font_Times);                                                      // TIMES 11 NEEDS TO BE USED FOR CALCULATING WORDS PER ROW!
    var nextLine   = "";
    
    // get the next line of characters...
    if (string_width(description) >= descriptionWidth)                               // if there's more than 1 row left...
    {
        
        // get a line's worth of characters by adding 1 char at a 
        // time until we go past the descriptionWidth...
        var stringWidth = 0;
        var count = 0;
        
        for (count=1; (stringWidth < descriptionWidth); count++)                    // while the width is less than a row...
        {
            nextLine    = string_copy(description,1,count+1);                       // add one character at a time
            stringWidth = string_width(nextLine);                                   // check the width and continue until the line is reached
        }
        
        // the above script goes over the descriptionWidth by 1 character
        // so it needs to remove that last character
        nextLine     = string_copy(description,1,count);
        description  = string_delete(description,1,count);                           // delete that line from the full description string
        
        
        /// BREAK ON A SPACE
        if (string_count(" ", nextLine) > 0)                                        // if there's a space in the string...
        {
            var count  = 0;
            var length = string_length(nextLine);

            for(var i=(length-1); i>0; i--)                                         // iterate backwards through the string until we find a space.
            {
                count ++;                                                           // how many characters to be separated to the next line
                if (string_char_at(nextLine,i) = " ")                               // once we've found a space...
                {
                    var maxLen = string_length(nextLine);                           // take the length of the whole line
                    
                    
                    var str = string_copy(nextLine, maxLen-(count-1), count);       // copy that word
                    description = (str + description);                              // re-add that word to the string
                    
                    
                    nextLine = string_delete(nextLine, maxLen-(count-1), count);    // delete the word from the end of the line
                    break;                                                          // stop the loop
                }
            }
        }
        else
        {
            // THIS IS WHERE THE PROGRAM USED TO CRASHE DUE TO NO SPACES
        }
        
        description = "  "+description;                                             // add the 2 extra spaces for each subsequent line
    }
    else // last line
    { 
         nextLine = string(description);
         description = "";
    }
   
   
   
    if (argument2 == 0) // draw = false
    {   // add to the list
        ds_list_add(argument0,nextLine);
    }
    if (argument2 == 1) // draw = true
    {   // draw the lines of text to the screen (USER_ITEM draw event)
        draw_set_font_scaled(font_Times);
        var yy = ( (textPosY +((n-1)*rowHeight)) +4)
        draw_text(descriptionX, yy, nextLine);
    }
}

// reset the scaling for drawing
draw_set_font_scaled(font_Times);
