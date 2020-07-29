/// edit_outlay();

if (selectedField    = "outlay")
{
        reset_text();
        popupWaiting    = true;                                     // prevent other popups while we're doing this
        
        // Initialize Outlay
        if (editingOutlay == false)
        {
            keyboard_string = "";
            tempOutlay      = string(outlay);
            
            if (tempOutlay    = "0")
            or (tempOutlay    = NOQUANTUM)
              then tempOutlay = "";
            
            cursorPosition  = (string_length(tempOutlay)+1);        // put cursor at end of number
            editingOutlay   = true;
        }
        
        
        // Editing Outlay
        if (editingOutlay == true)                                  // while editing the outlay...
        {
            // draw the amount
            draw_set_halign(fa_right);                              // align the font to the right for quantum.
            
            draw_text(
                    global.fColumnX,                                // x position right side of the column
                    quantumPositionY,                               // y position
                    tempOutlay                                      // outlay amount
                    );                                    
            
            
            // CONFIRM AND STOP EDITING //
            if keyboard_check_released(vk_enter)
            or keyboard_check_released(vk_escape)
            or mouseClickOutsideArea(global.descriptionColumnX,y,global.outlayColumnX,borderEndY)
            {
                // UNDO CODE
                var event = 
                    "Edit Outlay;"
                    + string(myID)
                    + ";"
                    + string(outlayText)
                    + ";"
                ds_stack_push(global.UNDO, string(event));  // before change
                ds_stack_clear(global.REDO);                // empty the REDO stack
                
                
                // confirm and exit
                outlayText  = formatQuantum(tempOutlay);                            // format the string properly
                confirmOutlay(outlayText)//realOutlay);
                editingOutlay  = false;
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
            or keyboard_check_pressed(190) // . and >
            or keyboard_check_pressed(110) // numpad .
            or keyboard_check_pressed(189) // - and _
            {
                /// remove newlines '#' and '>'
                for (var i=1; i <= string_length(keyboard_string); i++)             // iterate through the string
                {
                    if string_char_at(keyboard_string,i) == "#"
                    or string_char_at(keyboard_string,i) == ">" 
                    or string_char_at(keyboard_string,i) == " "                   // check for new line codes
                    {
                        keyboard_string = "";
                    }
                }
                
                // add the last character typed to the outlay
                if (keyboard_string != "")
                {
                    var char    = string_char_at(keyboard_string,string_length(keyboard_string));
                    tempOutlay  = string_insert(char,tempOutlay,cursorPosition);
                    cursorPosition ++;
                }
            }
            
            
            
            // backspace code
            if (keyboard_check_pressed(vk_backspace))
            {
                tempOutlay = string_delete(tempOutlay,cursorPosition-1,1);              // delete the last char
                cursorPosition--;
            }
            
            // delete code
            if (keyboard_check_pressed(vk_delete))
            {
                tempOutlay = string_delete(tempOutlay,cursorPosition,1);                // delete the last char
            }
            
            
            
            
            // CURSOR //
            // cursor left and right
            if (keyboard_check_pressed(vk_left))   then cursorPosition --;
            if (keyboard_check_released(vk_right)) then cursorPosition ++;
            
            
            // constrain the cursor
            if ( cursorPosition > string_length(tempOutlay)+1 )
                then cursorPosition = string_length(tempOutlay)+1;
            if ( cursorPosition < 1 )
                then cursorPosition = 1;
            
            
            // calculate the cursor position
            var len                 = string_length(tempOutlay) - (cursorPosition-1);
            var quickString         = string_copy(tempOutlay, cursorPosition, len);
            var cursorPositionWidth = string_width(quickString);
            var cursor_xx           = (global.fColumnX) - cursorPositionWidth;
            
            
            /// BLINK THE CURSOR ///
            if (global.TIMER >= cursorTargetTime)
            {
                cursorBlink = !(cursorBlink);               // draw "|" or nothing
                cursorTargetTime = round( (get_timer()/1000) + cursorBlinkDelay);
            }
            
            if (cursorBlink == true)
            {
                draw_text(cursor_xx,quantumPositionY,"|");  // cursor_xx and cursor_yy are from getCursorPositionFromStringPosition()#
            }

        } // end of editing outlay loop
    } // end of edit outlay
