            // draw the amount
            draw_set_halign(fa_right);                                 // align the font to the right for quantum.

            //xpos = global.dateColumnX+(global.dateColumnWidth/2)
            draw_text(
                    textPosX,                                               // x position right side of the column
                    textPosY+global.rowHeight,                          // y position
                    tempMonth                                           // month
                    );                                    
            
            
            // CONFIRM AND STOP EDITING //
            if keyboard_check_released(vk_enter)
            or keyboard_check_released(vk_escape)
            or mouseClickOutsideArea(global.dateColumnX,y,global.dateColumnX,borderEndY)
            {
                // confirm and exit
                format_confirmed_month(tempMonth);
                confirmMonth(dateMonth);
                set_unsaved();
                editingMonth  = false;
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
            or keyboard_check_pressed(ord("A"))
            or keyboard_check_pressed(ord("B"))
            or keyboard_check_pressed(ord("C"))
            or keyboard_check_pressed(ord("D"))
            or keyboard_check_pressed(ord("E"))
            or keyboard_check_pressed(ord("F"))
            or keyboard_check_pressed(ord("G"))
            or keyboard_check_pressed(ord("H"))
            or keyboard_check_pressed(ord("I"))
            or keyboard_check_pressed(ord("J"))
            or keyboard_check_pressed(ord("K"))
            or keyboard_check_pressed(ord("L"))
            or keyboard_check_pressed(ord("M"))
            or keyboard_check_pressed(ord("N"))
            or keyboard_check_pressed(ord("O"))
            or keyboard_check_pressed(ord("P"))
            or keyboard_check_pressed(ord("Q"))
            or keyboard_check_pressed(ord("R"))
            or keyboard_check_pressed(ord("S"))
            or keyboard_check_pressed(ord("T"))
            or keyboard_check_pressed(ord("U"))
            or keyboard_check_pressed(ord("V"))
            or keyboard_check_pressed(ord("W"))
            or keyboard_check_pressed(ord("X"))
            or keyboard_check_pressed(ord("Y"))
            or keyboard_check_pressed(ord("Z"))
            {
                /// remove newlines '#' and '>' //
                for (var i=1; i <= string_length(keyboard_string); i++)             // iterate through the string
                {
                    if string_char_at(keyboard_string,i) == "#"
                    or string_char_at(keyboard_string,i) == ">" 
                    or string_char_at(keyboard_string,i) == " "                    // check for new line codes
                    {
                        keyboard_string = "";
                    }
                }
                
                // add the last character typed to the month
                if (string_length(tempMonth) < 3) {                                  // only 3 numbers allowed
                    if (keyboard_string != "") {
                        var char = string_char_at(keyboard_string,string_length(keyboard_string));
                        tempMonth = string_insert(char,tempMonth,cursorPosition);
                        cursorPosition ++;
                    }
                }
            }
            
            
            // backspace code
            if keyboard_check_pressed(vk_backspace) {
                tempMonth = string_delete(tempMonth,cursorPosition-1,1);              // delete the last char
                cursorPosition--;
            }
            
            // delete code
            if keyboard_check_pressed(vk_delete) {
                tempMonth = string_delete(tempMonth,cursorPosition,1);                // delete the last char
            }
            

            // CURSOR //
            // cursor left and right
            if keyboard_check_pressed(vk_left)   then cursorPosition --;
            if keyboard_check_released(vk_right) then cursorPosition ++;

            
            // constrain the cursor
            if cursorPosition > string_length(tempMonth)+1
                then cursorPosition = string_length(tempMonth)+1;
            if cursorPosition < 1 then cursorPosition = 1;
            
            
            // calculate the cursor position
            var len                     = string_length(tempMonth) - (cursorPosition-1);
            var quickString             = string_copy(tempMonth, cursorPosition, len);
            var originX                 = textPosX;// + (string_width(tempMonth)/2) // left position of our tempMonth string
            var cursor_xx               = originX - string_width(quickString);
            
            
            /// BLINK THE CURSOR ///
            if (global.TIMER >= cursorTargetTime)
            {
                cursorBlink = !(cursorBlink);
                cursorTargetTime = ( (get_timer()/1000) + cursorBlinkDelay);
            }
            
            if (cursorBlink == true)
            {
                draw_text(cursor_xx,textPosY+(global.rowHeight),"|");  // cursor_xx and cursor_yy are from getCursorPositionFromStringPosition()#
            }
            else
            {
                draw_text(cursor_xx,textPosY+(global.rowHeight),"");
            }
