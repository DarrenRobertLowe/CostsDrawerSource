/// edit_description(textPosY)
textPosY        = argument0;
textPosX        = global.descriptionColumnX;
descriptionX    = (textMargin + textPosX);


if ( selectedField == "description" )
{
    // INITIALIZE
    if ( editingDescription == false )
    {
        // before editing the description...
        ds_list_copy(tempDescriptionList,descriptionList);      
        remove_extra_spaces(tempDescriptionList);                                       // remove starting spaces
        previousLines       = lines; // used to tell DOC_ORG to run or not (see confirmDescription)
        var lastLine        = ds_list_size(tempDescriptionList)-1;
        cursorLine          = lastLine;
        
        var lastString      = ds_list_find_value(tempDescriptionList,lastLine);
        if !is_undefined(lastString)
        {
            cursorPosition  = string_length(lastString);
            if is_undefined(lastString) then lastString = "";
        }
        else
        {
            lastString = "";
        }
        
        workingString       = getTempDescription(tempDescriptionList);                  // convert the list to a string
        stringPosition      = string_length(workingString); // this needs to
        
        getCursorPositionFromStringPosition();
        editingDescription  = true;
        DOCtimer = 0;                           // variable used to tell DOC_ORGANIZER to reposition items while typing.
        
        ds_list_clear(checkedWords);
        ds_list_clear(wrongWords);
        //wrongWordIn  = 0;
        //wrongWordOut = 0;
        wrongWordUnderline = 0;
    }
    
    
    
    
    // EDITING LOOP
    if (editingDescription == true)             // while editing the description...
    {
        //window_set_cursor(cr_default);
        
        if ( mouseOverDescription() )
        {
            window_set_cursor(cr_beam);
            
            if ( mouse_check_button_pressed(mb_left) )
            {
                /// HIGHLIGHTING....
                if  (keyboard_check(vk_shift))   // shift clicking should highlight
                and (global.textHighlightable == true)
                {
                    startChar = stringPosition;
                    show_debug_message("startChar = "+string(startChar));
                    get_cursor_position_from_mouse();
                    getCursorPositionFromStringPosition();
                    endChar   = stringPosition;
                    show_debug_message("endChar = "+string(endChar));
                    highlightingText = true;
                }
                else // NORMAL clicking around
                {
                    highlightingText = false;
                    startChar = stringPosition;
                    endChar   = stringPosition;
                    get_cursor_position_from_mouse();
                    getCursorPositionFromStringPosition();
                }
            }
            
            
            // CONTEXT MENU
            if ( mouse_check_button_pressed(mb_right) )
            {
                get_cursor_position_from_mouse();
                getCursorPositionFromStringPosition();
                
                
                /// GET THE WORD AT STRING POSITION
                var wordStartPos = -1;
                var wordEndPos   = -1;
                
                
                // find the first char of the word
                for (var i=stringPosition; i>0; i--)
                {
                    var char = string_char_at(workingString, i);
                    
                    if ( is_punctuation(char) )
                    {
                        wordStartPos = (i+1); // +1 because otherwise it includes the space/punctuation
                        i = 0;
                        break;
                    }
                }
                wordStartPos = max(wordStartPos,0);
                
                
                // find the last char of the word
                var len = string_length(workingString);
                
                for (var i=stringPosition; i<len; i++)
                {
                    var char = string_char_at(workingString, i);
                    if ( is_punctuation(char) )
                    {
                        wordEndPos = (i); // -1 because otherwise it includes the space/punctuation
                        i = 0;
                        break;
                    }
                }
                if (wordEndPos == -1) then wordEndPos = string_length(workingString);
                
                
                // check the word
                show_debug_message("checking "+string(wordStartPos) +" to "+string(wordEndPos));
                var wrd = string_copy(workingString, wordStartPos, (wordEndPos - wordStartPos));
                show_debug_message("selected word is "+string(wrd));
                dictionaryWordToAdd = wrd;
                descriptionContextMenu.dictionaryWordToAdd = dictionaryWordToAdd;
                
                //show_message("dictionaryWordToAdd is "+string(dictionaryWordToAdd));
                global.contextItemSelected = id;
                activateDescriptionContextMenu(id, "", true);
                /*
                if !( spellcheck(wrd) )
                {
                    activateDescriptionContextMenu(id, "", true);
                }
                */
            }
        }
        else
        {
            window_set_cursor(cr_default);
        }
        
        
        
        global.SHOW_WARNINGS = false;           // don't highlight warning rows as they don't update while editing (right now)
        updateLines(tempDescriptionList);
        
        // hack fix for Witness Fees 
        var addline = 0;
        if (object_index == WITNESS_FEE) then addline = 1;
        
        
        // draw background behind text
        depth = -1000;
        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_rectangle(
                textPosX,
                textPosY - (rowHeight),
                global.outlayColumnX,
                textPosY + ((lines-2+addline)*rowHeight),
                false
                );
        // draw left-margin rectangle for double-space
        draw_set_color(c_ltgray);
        draw_set_alpha(1);
        draw_rectangle(
                textPosX,
                textPosY,
                textPosX + string_width("  "),
                textPosY + ((lines-2+addline)*rowHeight),
                false
                );
        // draw outline to the background area
        draw_set_color(c_blue);
        draw_set_alpha(1);
        draw_rectangle(
                textPosX,
                textPosY-(rowHeight),
                global.outlayColumnX,
                textPosY + ((lines-2+addline)*rowHeight),
                true
                );
        
        depth = -1;
        
        /*
        // This would update the rows as you type, but is FAR too slow!
        DOCtimer ++;
        if DOCtimer == global.DOCtimerRate
        {
            DOC_ORGANIZER.alarm[0] = 1;
            DOCtimer = 0;
        }
        */
        
        
        //////  DRAW TEMP DESCRIPTION FOR EDITING  //////
        reset_text();
        draw_set_valign(fa_top);
        
        // SETUP //
        var tempString   = workingString;
        descriptionWidth = global.descriptionTextWidth;                 // WE DON'T TAKE SCALE INTO CONSIDERATION FOR THIS CALCULATION!
        
        // not the fastest, but probably the easiest...
        //formatDescription(descriptionList,tempString,1)
        if  (global.textHighlightable == true)
        {
            //description_highlight_text(tempDescriptionList);  // uncomment to allow highlighting text
        }
        draw_edit_description(descriptionList,tempString);
        
        
        
        ///////////////////// DRAW THE CURSOR ////////////////////// 
        
        // FIND THE CURSOR POSITION
        //getCursorPositionFromStringPosition();
        
        // ATTEMPT TO MOVE CURSOR TO CORRECT POSITION WHEN AT END OF LINE (CAUSES CRASH!)
        //tempString    = ds_list_find_value(tempDescriptionList,cursorLine);
        //if cursorPosition == string_length(tempString) {
            // manually set the cursor to appear on the next line
            // xx = textPosX + spaceWidth;
            // yy = textPosY + (cursorLine * rowHeight);
        //}
        
        
        
        /// BLINK THE CURSOR ///
        if (global.TIMER >= cursorTargetTime)
        {
            cursorBlink = !(cursorBlink);
            cursorTargetTime = round( (get_timer()/1000) + cursorBlinkDelay);
        }
        
        if (cursorBlink == true)
        {
            draw_text(cursor_xx,cursor_yy,"|");  // cursor_xx and cursor_yy are from getCursorPositionFromStringPosition()#
        }
        //else
        //{
        //    draw_text(cursor_xx,cursor_yy,"");
        //}
        ///////  END OF DRAW CURSOR  //////
        
        
        
        
        /// ESCAPE KEY (CANCEL)
        if (keyboard_check_released(vk_escape))
        {
            confirmDescription(description);
            editingDescription = false;
            reset_text();
            
            global.SHOW_WARNINGS = true;
            
            //if ds_exists(checkedWords,ds_type_list) then ds_list_destroy(checkedWords);
            ds_list_clear(checkedWords);
            ds_list_clear(wrongWords);
            exit;
        }
        
        
        
        //////////////////////  CURSOR CONTROLS  //////////////////////
        // CONFIRM AND STOP EDITING //
        if   (keyboard_check_released(vk_enter))
        or   (mouseClickOutsideArea(textPosX,y,global.outlayColumnX,borderEndY))
        {
            editingDescription = false;
            reset_text();
            set_unsaved();
            global.SHOW_WARNINGS = true;
            
            // UNDO
            var event = 
                "Edit Description;"
                + string(myID)
                + ";"
                + string(description)
                + ";"
            ds_stack_push(global.UNDO, string(event));  // before change
            
            // empty the REDO stack
            ds_stack_clear(global.REDO);
            
            // CONFIRM DESCRIPTION CHANGE
            confirmDescription(workingString);
            
            ds_list_clear(checkedWords);
            ds_list_clear(wrongWords);
        }
        
        
        /////////  NAVIGATION  /////////  
        descriptionEditNavigation(tempDescriptionList,workingString);       // UP, DOWN, LEFT, RIGHT, SPACEBAR
        
        
        // HOME Key
        // TO DO: add highlighting with shift
        if (keyboard_check_released(vk_home))
        {
            if (cursorLine = 0) then cursorPosition = 0;
            else cursorPosition = 1;
            getStringPositionFromCursorPosition();
            getCursorPositionFromStringPosition();
            
            
            // stop highlighting
            keyboard_key_release(vk_shift);
            highlightingText = false;
        }
        
        
        // END Key
        if (keyboard_check_released(vk_end))
        {
            formatDescription(tempDescriptionList, workingString, 0);
            var quickList = ds_list_create();
            ds_list_clear(quickList);
            ds_list_copy(quickList,tempDescriptionList);
            remove_extra_spaces(quickList);
            
            var length = string_length(ds_list_find_value(quickList,cursorLine));
            cursorPosition = length;
            
            //confineCursorPosition();
            getStringPositionFromCursorPosition();
            getCursorPositionFromStringPosition();
            ds_list_destroy(quickList);                                             // destroy quickList
            
            
            // stop highlighting
            keyboard_key_release(vk_shift);
            highlightingText = false;
        }
        
        
        
        
        
        
        //////////////////////  BACKSPACE KEY  //////////////////////
        if (keyboard_check(vk_backspace))   // when backspace is being held down...
        {
            reset_text_highlight();
            if (highlightingText == false)
            {
                cursorBlink = true;                                                     // force the blinker to be displayed
                
                if (backspaceTargetTime == 0)                                                    // the time when it starts to repeat
                {
                    backspaceTargetTime = ( (get_timer() / 1000) + delayBeforeButtonRepeat);                          // setup for repeat
                    
                    // BACKSPACE ONCE //
                    if (stringPosition > 0)
                    {
                        workingString = string_delete(workingString,stringPosition,1);
                        stringPosition --;
                    }
                }
                
                if  (backspaceTargetTime > 0)
                and (global.TIMER >= backspaceTargetTime)                                   // repeat the button press
                {
                    // REPEAT BACKSPACE //
                    if (stringPosition > 0)
                    {
                        workingString = string_delete(workingString,stringPosition,1);
                        stringPosition--;
                    }
                    
                    backspaceTargetTime = ((get_timer() / 1000) + buttonRepeatDelay);       // set to repeat
                }
                
                getCursorPositionFromStringPosition();
            }
            else // highlighting
            {
                if (global.textHighlightable == true)
                {
                    keyboard_clear(vk_backspace);
                    highlight_delete();
                    backspaceTargetTime = 0;
                }
            }
        }
        else backspaceTargetTime = 0;
        //////////////////////  END OF BACKSPACE KEY  //////////////////////
        
        
        
        
        
        
        //////////////////////  DELETE KEY  //////////////////////
        if (keyboard_check(vk_delete))
        {
            reset_text_highlight();
            
            if (highlightingText == false)
            {
                cursorBlink = true;                                                         // force the blinker to be displayed
                
                if (deleteTargetTime == 0)                                                  // the time when it starts to repeat
                {
                    deleteTargetTime = ( (get_timer() / 1000) + delayBeforeButtonRepeat);   // setup for repeat
                    
                    /// PERFORM THE DELETE ACTION ONCE ///
                    workingString = string_delete(workingString,stringPosition+1,1);
                    getCursorPositionFromStringPosition();
                }
                
                if  (deleteTargetTime > 0)
                and (global.TIMER >= deleteTargetTime)                                      // repeat the button press
                {
                    /// REPEAT DELETE ///
                    workingString = string_delete(workingString,stringPosition+1,1);
                    getCursorPositionFromStringPosition();
                    
                     deleteTargetTime = ((get_timer() / 1000) + buttonRepeatDelay);         // set to repeat
                }
            }
            else // highlighting
            {
                if (global.textHighlightable == true)
                {
                    keyboard_clear(vk_delete);
                    highlight_delete();
                    backspaceTargetTime = 0;
                }
            }
        }
        else 
        {
            deleteTargetTime = 0;
        }
        //////////////////////  END OF DELETE KEY  //////////////////////
        
        
        
        
        
        // INPUT KEYS
        if (keyboard_check(vk_control) == false)
        {
            if (string_length(workingString) >= global.maxDescriptionChars) // prevent typing for than a certain amount
            {    
                exit;
            }
            else 
            {
                if keyboard_check_pressed(ord("A"))
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
                or keyboard_check_pressed(ord("1"))
                or keyboard_check_pressed(ord("2"))
                or keyboard_check_pressed(ord("3"))   
                or keyboard_check_pressed(ord("4")) 
                or keyboard_check_pressed(ord("5")) 
                or keyboard_check_pressed(ord("6")) 
                or keyboard_check_pressed(ord("7")) 
                or keyboard_check_pressed(ord("8")) 
                or keyboard_check_pressed(ord("9")) 
                or keyboard_check_pressed(ord("0")) 
                or keyboard_check_pressed(190)          // . >
                or keyboard_check_pressed(188)          // , <
                or keyboard_check_pressed(192)          // ' @
                or keyboard_check_pressed(186)          // ; :
                or keyboard_check_pressed(221)          // ] }
                or keyboard_check_pressed(219)          // [ {
                or keyboard_check_pressed(189)          // - _
                or keyboard_check_pressed(187)          // + =
                or keyboard_check_pressed(191)          // ? /
                or keyboard_check_pressed(220)          // \ |
                or keyboard_check_pressed(110)          // numpad .
                or keyboard_check_pressed(106)          // numpad *
                or keyboard_check_pressed(111)          // numpad /
                or keyboard_check_pressed(109)          // numpad -
                or keyboard_check_pressed(107)          // numpad + 
                or keyboard_check_pressed(8364)         // € (altgrav + 4)
                {
                    var len = string_length(keyboard_string);
                    var tempChar;
                    
                    // remove newlines #
                    for (var i = 1; i <= len; i += 1 )
                    {
                        tempChar = string_char_at( keyboard_string, i );
                        if (tempChar == "#")    // these will break description
                        or (tempChar == ";")    // these will break save files
                        or (tempChar == "^")    // these will break save files
                        {
                            keyboard_string = "";
                            exit;
                        }
                    }
                    
                    // attempt to remove spaces " "
                    for (var i = 1; i <= len; i += 1 )
                    {
                        tempChar = string_char_at( keyboard_string, i );
                        if (tempChar == " ")
                        {
                            keyboard_string = string_delete(keyboard_string,i,1);
                        }
                    }
                    
                    
                    // Insert the new character */
                    var lastChar  = string_char_at(keyboard_string,string_length(keyboard_string));         // find the last character of keyboard_string
                    
                    // find the word width
                    var wordWidth = get_last_word_width(workingString);
                    var charWidth = string_width(lastChar);
                    var buffer = 50; // some pixels
                    
                    // if our word width is okay...
                    if ( (wordWidth + charWidth) < (global.descriptionColumnWidth - buffer) )
                    {
                        workingString = string_insert(lastChar,workingString,stringPosition+1);             // add the new character
                        stringPosition ++;
                        
                        keyboard_lastkey = -1;
                        keyboard_lastchar = "";
                        
                        formatDescription(tempDescriptionList, workingString,0);                            // turn it back into a list of strings
                        getCursorPositionFromStringPosition();
                    }
                    else /// insert a space so our line breaks there
                    {
                        workingString = string_insert(" ",workingString,stringPosition+1);                  // add a space
                        stringPosition ++;
                        
                        workingString = string_insert(lastChar,workingString,stringPosition+1);             // add the new character
                        stringPosition ++;
                        
                        keyboard_lastkey  = -1;
                        keyboard_lastchar = "";
                        
                        formatDescription(tempDescriptionList, workingString,0);                            // turn it back into a list of strings
                        getCursorPositionFromStringPosition();
                        //show_debug_message("Cannot add character as word is too long!");
                    }
                    
                    highlightingText = false;
                    startChar   = stringPosition;
                    endChar     = startChar;
                    
                    
                    /// delete highlighted text
                    if (highlightingText == true)
                    and (global.textHighlightable == true)
                    {
                        highlight_delete();
                        editingDescription = false;
                        global.selected = -1;
                        exit;
                    }
                    /*
                    else
                    {
                        refresh_string_position(stringPosition); // or clicking around and highlighting will be broken
                    }
                    */
                }
            }
        }
        
        
        /////////////////////// CONTROL COMMANDS ////////////////////// 
        if ( keyboard_check(vk_control) )
        {
            if ( keyboard_check_pressed( ord("V") ) )
            {
                if ( clipboard_has_text() )
                {   
                    pasteText();
                    
                    if  (highlightingText == true)
                    and (global.textHighlightable == true)
                    {
                        highlight_delete();
                    }
                    
                    exit;
                }
            }
        }
        
        
    }
}
else
{
    depth = 0;
}



reset_text();
