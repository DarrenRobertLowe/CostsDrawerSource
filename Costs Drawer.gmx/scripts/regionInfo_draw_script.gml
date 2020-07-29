if ( in_view() )
{
    reset_text();
    textPosY = getYFromRow(row + 1);        // +1 because text is drawn from bottom up and getYFromRow returns row -1. Don't know why, but it seems to be needed.
    textPosX = global.descriptionColumnX;
    
    
    /// DRAW ///
    // while not editing...
    if (editingDescription == false)
    {
        draw_set_color(global.itemTextColor);
        draw_text(
            global.textMargin + textPosX,
            textPosY,
            description
        );
    }
    
    
    // while editing...
    if (global.selected == id)
    {
        keyboard_CURSOR.field = 5;
        if (selectedField = "description")
        {
            // Initialize
            if (editingDescription == false)
            {
                keyboard_string     = "";
                tempDescription     = string(description);
                cursorPosition      = (string_length(tempDescription)+1);   // put cursor at end of record number
                editingDescription = true;
                
                global.UNSAVED = 1                                              // Mark that the file has been changed
                popupWaiting   = true;                                          // prevent other popups while we're doing this
                drawBorder("description");
            }
            
            
            if (editingDescription == true)
            {
                // draw the temporary record number
                draw_set_color(global.itemTextColor);
                draw_text
                    (
                    global.textMargin + textPosX,                           // x,
                    textPosY+(0*global.rowHeight),                          // y,
                    tempDescription                                        // text
                    );
                
                // MAGIC TEXT INPUT
                tempDescription = user_text_input(tempDescription,textPosX,textPosY,false);
                
                
                // CANCEL AND STOP EDITING //
                if keyboard_check_released(vk_escape)
                {
                    editingDescription = false;
                    tempDescription = "";
                    selectedField = "";
                    reset_text();
                    //clear_warnings();                                    // reset Warnings lists
                    exit;
                }
                
                
                // CONFIRM AND STOP EDITING //
                if keyboard_check_released(vk_enter)
                or mouseClickOutsideArea(global.descriptionColumnX, borderStartY, global.outlayColumnX, borderEndY)
                {
                    // confirm and exit
                    description   = tempDescription;
                    editingDescription = false;
                    selectedField = "";
                    reset_text();
                    set_unsaved();
                    exit;
                }
            }
    
        }
    }
    
    // MOUSE OVER CHECK
    if !(mouseOverDocument()) then exit;
    
    if ( mouseOverDescription() )
    {
        drawBorder("description");
        // LEFT CLICK
        if mouse_check_button_released(mb_left)
        {
            global.selected = id;
            selectedField = "description";
        }
    }
}

