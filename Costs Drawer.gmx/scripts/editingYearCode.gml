if (tempYear == "0") then tempYear = "";

// draw the amount
draw_set_halign(fa_right);                          // align the font to the right for quantum.

draw_text
(
    textPosX, //xpos                                // x position right side of the column
    textPosY,                                       // y position
    tempYear                                        // year string
);


// CONFIRM AND STOP EDITING //
if keyboard_check_released(vk_enter)
or keyboard_check_released(vk_escape)
or mouseClickOutsideArea(global.dateColumnX,y,global.dateColumnX,borderEndY)
{
    // confirm and exit
    tempYear = formatYear(tempYear);
    confirmYear(tempYear);
    editingYear = false;
    reset_text();
    set_unsaved();
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
    
    // add the last character typed to the year
    if (string_length(tempYear) < 4)    // only 4 numbers allowed
    {
        if (keyboard_string != "")
        {
            var char = string_char_at(keyboard_string,string_length(keyboard_string));
            tempYear = string_insert(char,tempYear,cursorPosition);
            cursorPosition ++;
        }
    }
}


// backspace code
if keyboard_check_pressed(vk_backspace)
{
    tempYear = string_delete(tempYear,cursorPosition-1,1);              // delete the last char
    cursorPosition--;
}

// delete code
if keyboard_check_pressed(vk_delete)
{
    tempYear = string_delete(tempYear,cursorPosition,1);                // delete the last char
}




// CURSOR //
// cursor left and right
if keyboard_check_pressed(vk_left)   then cursorPosition --;
if keyboard_check_released(vk_right) then cursorPosition ++;


// constrain the cursor
if (cursorPosition > string_length(tempYear) +1)
{
    cursorPosition = string_length(tempYear) +1;
}

if (cursorPosition < 1) then cursorPosition = 1;



// calculate the cursor position
var len                     = string_length(tempYear) - (cursorPosition-1);
var quickString             = string_copy(tempYear, cursorPosition, len);
var originX                 = textPosX //+ (string_width(tempYear)/2);//xpos + left position of our tempYear string
var cursor_xx               = originX - string_width(quickString);


/// BLINK THE CURSOR ///
if (global.TIMER >= cursorTargetTime)
{
    cursorBlink      = !(cursorBlink);
    cursorTargetTime = ( (get_timer()/1000) + cursorBlinkDelay);
}

if (cursorBlink == true)
{
    draw_text(cursor_xx,textPosY,"|");  // cursor_xx and cursor_yy are from getCursorPositionFromStringPosition()#
}
else
{
    draw_text(cursor_xx,textPosY,"");
}
