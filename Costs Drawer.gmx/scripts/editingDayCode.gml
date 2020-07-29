if tempDay = "0" then tempDay = "";

// draw the amount
draw_set_halign(fa_right);                                 // align the font to the right for quantum.

textPosX = global.dateColumnX+(global.dateColumnWidth/2)
draw_text(
        textPosX,                                               // x position right side of the column
        textPosY+(global.rowHeight*2),                      // y position
        tempDay                                             // day
        );                                    


// CONFIRM AND STOP EDITING //
if keyboard_check_released(vk_enter)
or keyboard_check_released(vk_escape)
or mouseClickOutsideArea(global.dateColumnX,y,global.dateColumnX,borderEndY)
{
    // confirm and exit
    //tempDay = formatDay(tempDay);
    set_unsaved();
    confirmDay(tempDay);
    editingDay  = false;
    reset_text();
    exit;
}


// USER INPUT //
if keyboard_check_pressed(ord("1"))
or keyboard_check_pressed(ord("2"))
or keyboard_check_pressed(ord("3"))   
or keyboard_check_pressed(ord("4")) 
or keyboard_check_pressed(ord("5")) 
or keyboard_check_pressed(ord("6")) 
or keyboard_check_pressed(ord("7")) 
or keyboard_check_pressed(ord("8")) 
or keyboard_check_pressed(ord("9")) 
or keyboard_check_pressed(ord("0"))
{
    keyboard_string = string_digits(keyboard_string);
    /*
    /// remove newlines '#' and '>' //
    for (var i=1; i <= string_length(keyboard_string); i++)             // iterate through the string
    {
        if string_char_at(keyboard_string,i) == "#"
        or string_char_at(keyboard_string,i) == ">" 
        or string_char_at(keyboard_string,i) == " "{                    // check for new line codes
            keyboard_string = "";
        }
    }
    */
    // add the last character typed to the month
    if string_length(tempDay) < 2 {                                  // only 2 numbers allowed
        if keyboard_string != "" {
            var char = string_char_at(keyboard_string,string_length(keyboard_string));
            tempDay = string_insert(char,tempDay,cursorPosition);
            cursorPosition ++;
        }
    }
}


// backspace code
if keyboard_check_pressed(vk_backspace) {
    tempDay = string_delete(tempDay,cursorPosition-1,1);              // delete the last char
    cursorPosition--;
}

// delete code
if keyboard_check_pressed(vk_delete) {
    tempDay = string_delete(tempDay,cursorPosition,1);                // delete the last char
}


// CURSOR //
// cursor left and right
if keyboard_check_pressed(vk_left)   then cursorPosition --;
if keyboard_check_released(vk_right) then cursorPosition ++;


// constrain the cursor
if cursorPosition > string_length(tempDay)+1
    then cursorPosition = string_length(tempDay)+1;
if cursorPosition < 1 then cursorPosition = 1;



// calculate the cursor position
var len                     = string_length(tempDay) - (cursorPosition-1);
var quickString             = string_copy(tempDay, cursorPosition, len);
var originX                 = textPosX;//xpos + (string_width(tempDay)/2) // left position of our tempMonth string
var cursor_xx               = originX - string_width(quickString);


/// BLINK THE CURSOR ///
if (global.TIMER >= cursorTargetTime)
{
    cursorBlink = !(cursorBlink);
    cursorTargetTime = ( (get_timer()/1000) + cursorBlinkDelay);
}

if (cursorBlink == true)
{
    draw_text(cursor_xx,textPosY+(global.rowHeight*2),"|");  // cursor_xx and cursor_yy are from getCursorPositionFromStringPosition()#
}
else
{
    draw_text(cursor_xx,textPosY+(global.rowHeight*2),"");
}
