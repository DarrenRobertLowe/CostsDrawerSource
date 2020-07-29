/// user_text_input(tempLine,textPosX,textPosY,allowCarriageReturn)
//editingDescription = true;

var tempLine            = argument0;
var textPosX            = argument1;
var cursorPosY          = argument2;
var allowCarriageReturn = argument3;


// USER INPUT //
if keyboard_check_pressed(ord("0"))
or keyboard_check_pressed(ord("1"))
or keyboard_check_pressed(ord("2"))
or keyboard_check_pressed(ord("3"))   
or keyboard_check_pressed(ord("4")) 
or keyboard_check_pressed(ord("5")) 
or keyboard_check_pressed(ord("6")) 
or keyboard_check_pressed(ord("7")) 
or keyboard_check_pressed(ord("8")) 
or keyboard_check_pressed(ord("9")) 
{
    /// remove newlines '#' and '>' //
    if (allowCarriageReturn == false)
    {
        for (var i=1; i <= string_length(keyboard_string); i++)                         // iterate through the string
        {
            if (string_char_at(keyboard_string,i) == "#")
            or (string_char_at(keyboard_string,i) == ">")
            {                   // check for new line codes
                keyboard_string = "";
            }
        }
    }
    
    // add the last character typed to the tempLine
    if (keyboard_string != "")
    {
        var char  = string_char_at(keyboard_string,string_length(keyboard_string));
        tempLine  = string_insert(char,tempLine,cursorPosition);
        cursorPosition ++;
    }
}


// backspace
if (keyboard_check_pressed(vk_backspace))
{
    tempLine = string_delete(tempLine,cursorPosition-1,1);          // delete the last char
    cursorPosition--;
    buttonRepeatTimer = (global.buttonTimerDelay * room_speed);
}

if (keyboard_check(vk_backspace))
{
    if (buttonRepeatTimer > 0) then buttonRepeatTimer--;
    
    if (buttonRepeatTimer <= 0)
    {
        tempLine = string_delete(tempLine,cursorPosition-1,1);      // delete the last char
        cursorPosition--;
        buttonRepeatTimer = (global.textRepeatSpeed * room_speed);
    }
}

if (keyboard_check_released(vk_backspace)){
    buttonRepeatTimer = (global.buttonTimerDelay * room_speed);
}




// delete
if (keyboard_check_pressed(vk_delete))
{
    tempLine = string_delete(tempLine,cursorPosition,1);            // delete the last char
    //cursorPosition--;
    buttonRepeatTimer = (global.buttonTimerDelay * room_speed);
}

if (keyboard_check(vk_delete))
{
    if (buttonRepeatTimer > 0) then buttonRepeatTimer--;
    
    if (buttonRepeatTimer <= 0)
    {
        tempLine = string_delete(tempLine,cursorPosition,1);        // delete the last char
        //cursorPosition--;
        buttonRepeatTimer = (global.textRepeatSpeed * room_speed);
    }
}

if (keyboard_check_released(vk_delete))
{
    buttonRepeatTimer = (global.buttonTimerDelay * room_speed);
}




// CURSOR //
// home
if  ( keyboard_check_pressed(vk_home) )
then cursorPosition = 1;

// end
if  ( keyboard_check_pressed(vk_end) )
then cursorPosition = string_length(tempLine)+1;

// cursor left
if  ( keyboard_check_pressed(vk_left) )
and ( cursorPosition > 1 )
 then cursorPosition --;
 
// cursor right
if  ( keyboard_check_released(vk_right) )
and ( cursorPosition < string_length(tempLine)+1 )
 then cursorPosition ++;


// constrain the cursor
if (cursorPosition > ( string_length(tempLine)+1 ) )
 then cursorPosition = (string_length(tempLine)+1 );
if (cursorPosition < 1)
 then cursorPosition = 1;


// calculate the cursor position
var subString               = string_copy(tempLine, 1, cursorPosition-1);
var cursorPositionWidth     = string_width(subString);
var cursorPositionX         = textPosX + cursorPositionWidth;


/// BLINK THE CURSOR ///
if (global.TIMER >= cursorTargetTime)
{
    cursorBlink = !(cursorBlink);               // draw "|" or nothing
    cursorTargetTime = ( (get_timer()/1000) + cursorBlinkDelay);
}

if (cursorBlink == true)
{
    draw_set_color(c_black);
    draw_text(cursorPositionX,cursorPosY,"|");  // cursor_xx and cursor_yy are from getCursorPositionFromStringPosition()#
}


return tempLine;

//editingDescription = false;
