/// descriptionEditNavigation(list,workingString)
/* Run by USER_ITEM in draw_event when editing
 * an item's description.
 * Placed here to keep code cleaner.
*/

var list                = argument0;        // needed for up and down keys
var size                = ds_list_size(list);
var lastLine            = size-1;
var unused              = argument1;
var stopH               = false;


/// SPACE BAR
if keyboard_check_pressed(vk_space)
{
    stopH = true; // stop highlighting

    if string_char_at(workingString,stringPosition) != " "
    and (stringPosition > 0)
    {                                            // things get messed up if the first character is a space.
        workingString   = string_insert(" ",workingString,stringPosition+1);
        stringPosition ++;
        getCursorPositionFromStringPosition();
        keyboard_lastkey = -1;
        keyboard_lastchar = "";
    }

    //formatDescription(tempDescriptionList, workingString);          // format it and turn it back into a list
}





/// MOVE LEFT (keep away from starting 2-spaces)
if (keyboard_check(vk_left))
{
    if !(keyboard_check(vk_shift)) then stopH = true; // stop highlighting
    else endChar = stringPosition;
    
    cursorBlink = true;                                                     // force the blinker to be displayed
    
    if (leftTargetTime == 0)                                                    // the time when it starts to repeat
    {
        leftTargetTime = ( (get_timer() / 1000) + delayBeforeButtonRepeat);     // setup for repeat
        
        // MOVE LEFT
        if (stringPosition > 0)
        then stringPosition--;
        getCursorPositionFromStringPosition();      // reposition the cursor
    }
    
    if  (leftTargetTime > 0)
    and (global.TIMER >= leftTargetTime)                                        // repeat the button press
    {
        /// REPEAT LEFT ///
        if (stringPosition > 0)
        then stringPosition--;
        getCursorPositionFromStringPosition();      // reposition the cursor                                             // make the cursor visible
        leftTargetTime = ((get_timer() / 1000) + buttonRepeatDelay);              // set to repeat
    }
}
else 
{
    leftTargetTime = 0;
}



/// MOVE RIGHT
if (keyboard_check(vk_right))
{
    if !(keyboard_check(vk_shift)) then stopH = true; // stop highlighting
    else endChar = stringPosition;
    
    cursorBlink = true;                                                     // force the blinker to be displayed
    
    if (rightTargetTime == 0)                                                       // the time when it starts to repeat
    {
        rightTargetTime = ( (get_timer() / 1000) + delayBeforeButtonRepeat);        // setup for repeat
        
        // MOVE RIGHT
        if stringPosition < string_length(workingString)
        then stringPosition ++;
        getCursorPositionFromStringPosition();      // reposition the cursor
    }
    
    if  (rightTargetTime > 0)
    and (global.TIMER >= rightTargetTime)                                           // repeat the button press
    {
        /// REPEAT RIGHT ///
        if stringPosition < string_length(workingString)
        then stringPosition ++;
        
        getCursorPositionFromStringPosition();                                      // reposition the cursor 
        
        rightTargetTime = ((get_timer() / 1000) + buttonRepeatDelay);               // set to repeat
    }
}
else 
{
    rightTargetTime = 0;
}



/// MOVE UP
if (keyboard_check(vk_up))
{
    if !(keyboard_check(vk_shift)) then stopH = true; // stop highlighting
    else endChar = stringPosition;
    
    cursorTimer = 0;                                                                // make the cursor blinker visible
    
    
    if (upTargetTime == 0)                                                       // the time when it starts to repeat
    {
        upTargetTime = ( (get_timer() / 1000) + delayBeforeButtonRepeat);        // setup for repeat
        
        // MOVE UP
        cursorTimer = 0;                        // make the cursor visible
        if cursorLine > 0 then cursorLine--;
        confineCursorPosition(list,cursorLine);
        getStringPositionFromCursorPosition();
        getCursorPositionFromStringPosition();
    }
    
    if  (upTargetTime > 0)
    and (global.TIMER >= upTargetTime)                                           // repeat the button press
    {
        /// REPEAT UP ///
        cursorTimer = 0;                        // make the cursor visible
                
                if cursorLine > 0 then cursorLine--;
                confineCursorPosition(list,cursorLine);
                getStringPositionFromCursorPosition();
                getCursorPositionFromStringPosition();
        
        upTargetTime = ((get_timer() / 1000) + buttonRepeatDelay);               // set to repeat
    }
}
else 
{
    upTargetTime = 0;
}

/// MOVE DOWN
if (keyboard_check(vk_down))
{
    if !(keyboard_check(vk_shift)) then stopH = true; // stop highlighting
    else endChar = stringPosition;
    
    cursorBlink = true;                                                     // force the blinker to be displayed
    
    
    if (downTargetTime == 0)                                                       // the time when it starts to repeat
    {
        downTargetTime = ( (get_timer() / 1000) + delayBeforeButtonRepeat);        // setup for repeat
        
        // MOVE DOWN
        if cursorLine < (size-1)
          then cursorLine ++;
        confineCursorPosition(list,cursorLine);
        getStringPositionFromCursorPosition();
        getCursorPositionFromStringPosition();
    }
    
    if  (downTargetTime > 0)
    and (global.TIMER >= downTargetTime)                                           // repeat the button press
    {
        /// REPEAT DOWN ///
        if cursorLine < (size-1)
          then cursorLine ++;
        confineCursorPosition(list,cursorLine);
        getStringPositionFromCursorPosition();
        getCursorPositionFromStringPosition();
        
        downTargetTime = ((get_timer() / 1000) + buttonRepeatDelay);               // set to repeat
    }
}
else 
{
    downTargetTime = 0;
}




/// STOP HIGHLIGHTING
if (stopH == true)
{
    startChar = stringPosition;
    endChar   = stringPosition;
    highlightingText = false;
    stopH = false;
}
