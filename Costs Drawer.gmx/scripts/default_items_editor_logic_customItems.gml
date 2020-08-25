///default_items_editor_logic_customItems();
var y1 = windowY1;
var y2 = windowY2;
maxItem = default_items_editor_getMaxItem();

// allow scrolling through list
if ( mouse_over_popup_area(windowX1,windowY1,windowX2,windowY2) )
{
    if (mouse_wheel_up())
    {
        startingIndex--;
        startingIndex = max(0, startingIndex);
    }
    
    if (mouse_wheel_down())
    {
        var lastScrollableItem = ( (size - maxItemsShowable) +1);
        
        if (startingIndex < lastScrollableItem)
        then startingIndex++;
    }
}



// DRAW / EDIT LIST ITEMS
for (var i=startingIndex; i<maxItem; i++)
{
    var yy           = (listStartY + ((i-startingIndex)*rowHeight));
    var y2           = (yy - rowHeight);
    var description  = array[i, 0];
    var outlay       = array[i, 1];
    var professional = array[i, 2];
    
    /// Highlight the selected row for deleting and ordering
    if (indexSelected == i)
    {
        draw_set_alpha(0.3);
        draw_set_color(highlight_color);
        draw_rectangle(windowX1, y2-2, windowX2, yy+2, false);
        
        draw_set_alpha(1);
        draw_set_color(c_blue);
        draw_rectangle(windowX1, y2-2, windowX2, yy+2, true);
    } 
    
    
    
    /// DESCRIPTION
    // mouse clicking
    if ( mouse_over_popup_area(descriptionColumnX, y2, outlayColumnX, yy) )
    {
        if (mouse_check_button_released(mb_left))
        {
            fieldSelected = descriptionFieldIndex;
            
            // enteredValue-click on row
            if (indexSelected == i)
            {
                if (double_clicked())
                {
                    // get the new description
                    var preStr  = description;
                    var str     = get_string("Enter a description:", description);
                    
                    if (str != "")
                    {
                        // set the value
                        if (str != description)
                        {
                            description = str;
                            hcCustomArray[i, customDescriptionIndex] = description;
                            array = hcCustomArray;
                            default_items_editor_check_addRow();    // if the last item has any data, then add another line
                            event_user(2); // tell Save Button to become visible/clickable
                        }
                    }
                }
                else reset_clickTime();
            }
            else
            {
                indexSelected = i;
                reset_clickTime();
            }
        }
    }
    
    
    // edit with keyboard
    if keyboard_check_pressed(vk_enter)
    {
        if  (indexSelected == i)
        and (fieldSelected == descriptionFieldIndex)
        {
            // get the new description
            var preStr  = description;
            var str     = get_string("Enter a description:", description);
            
            if (str != description)
            {
                description = str;
                hcCustomArray[i, customDescriptionIndex] = description;
                array = hcCustomArray;
                default_items_editor_check_addRow();    // if the last item has any data, then add another line
                event_user(2); // tell Save Button to become visible/clickable
            }
        }
    }
    
    
    draw_set_alpha(rowAlpha);
    // if selected, draw a blue background and set text to white
    if  (indexSelected == i)
    and (fieldSelected = descriptionFieldIndex)
    {
        draw_set_color(c_blue);
        draw_rectangle(descriptionColumnX, y2, outlayColumnX, yy, false);
        draw_set_color(c_white);
    }
    else
    {
        // mouse over?
        if ( mouse_over_popup_area(descriptionColumnX, y2, outlayColumnX, yy) )
        {
            draw_set_colour(highlight_color);
            draw_rectangle(descriptionColumnX, y2, outlayColumnX, yy+1, false);
        }
        
        // black text
        draw_set_color(c_black);
    }
    
    draw_set_alpha(1);
    
    // DRAW DESCRIPTION TEXT
    draw_set_halign(fa_left);
    draw_text(descriptionTextX, yy, description);
    
    
    
    
    
    
    
    
    
    
    /// EDITING OUTLAY AND PROFESSIONAL
    // OUTLAY
    if (description != "") // we can only edit them when there's a description
    {
        /// OUTLAY
        // mouse clicking
        if ( mouse_over_popup_area(outlayColumnX, y2, professionalColumnX, yy) )
        {
            if (mouse_check_button_released(mb_left))
            {
                fieldSelected = outlayValueFieldIndex;
                
                // enteredValue-click on row
                if (indexSelected == i)
                {
                    if (double_clicked())
                    {
                        // get the new description
                        var preStr  = string(outlay);
                        var str     = get_string("Enter value for Outlay:", outlay);
                        
                        if (str != "")
                        {
                            var enteredValue = formatQuantum(str);
                            
                            // set the value
                            enteredValue = real(enteredValue);
                            if (enteredValue != outlay)
                            {
                                outlay = real(enteredValue);
                                hcCustomArray[i, outlayValueFieldIndex] = outlay;
                                array = hcCustomArray;
                                event_user(2); // tell Save Button to become visible/clickable
                            }
                        }
                    }
                    else reset_clickTime();
                }
                else
                {
                    indexSelected = i;
                    reset_clickTime();
                }
            }
        }
        // edit with keyboard
        if keyboard_check_pressed(vk_enter)
        {
            if  (indexSelected == i)
            and (fieldSelected = outlayValueFieldIndex)
            {
                // get the new description
                var preStr  = string(outlay);
                var str     = get_string("Enter value for Outlay:", outlay);
                
                if (str != "")
                {
                    var enteredValue = formatQuantum(str);
                    
                    // set the value
                    enteredValue = real(enteredValue);
                    if (enteredValue != outlay)
                    {
                        outlay = real(enteredValue);
                        hcCustomArray[i, outlayValueFieldIndex] = outlay;
                        array = hcCustomArray;
                        event_user(2); // tell Save Button to become visible/clickable
                    }
                }
            }
        }
        
        draw_set_alpha(rowAlpha);
        // if selected, draw a blue background and set text to white
        if  (indexSelected == i)
        and (fieldSelected = outlayValueFieldIndex)
        {
            draw_set_color(c_blue);
            draw_rectangle(outlayColumnX, y2, professionalColumnX, yy, false);
            draw_set_color(c_white);
        }
        else
        {
            // mouse over?
            if ( mouse_over_popup_area(outlayColumnX, y2, professionalColumnX, yy) )
            {
                draw_set_colour(highlight_color);
                draw_rectangle(outlayColumnX, y2-1, professionalColumnX, yy+1, false);   
            }
            
            // black text
            draw_set_color(c_black);
        }
        
        /// DRAW OUTLAY TEXT
        draw_set_alpha(1);
        draw_set_color(c_black);
        draw_set_halign(fa_right);
        draw_text(outlayTextX,     yy, outlay);
        
        // draw row 
        draw_line(windowX1, yy, windowX2, yy);
        
        
        
        
        
        
        
        
        /// PROFESSIONAL
        // mouse clicking
        if ( mouse_over_popup_area(professionalColumnX, y2, windowX2, yy) )
        {
            if (mouse_check_button_released(mb_left))
            {
                fieldSelected = professionalValueFieldIndex;
                
                // enteredValue-click on row
                if (indexSelected == i)
                {
                    if (double_clicked())
                    {
                        // get the new description
                        var preStr          = string(professional);
                        var str             = get_string("Enter value for Professional:", professional);
                        
                        if (str != "")
                        {    
                            var enteredValue    = formatQuantum(str);
                            
                            // set the value
                            enteredValue = real(enteredValue);
                            if (enteredValue != professional)
                            {
                                professional = enteredValue;
                                hcCustomArray[i, professionalValueFieldIndex] = professional;
                                array = hcCustomArray;
                                event_user(2); // tell Save Button to become visible/clickable
                            }
                        }
                    }
                    else reset_clickTime();
                }
                else
                {
                    indexSelected = i;
                    reset_clickTime();
                }
            }
        }
        // edit with keyboard
        if keyboard_check_pressed(vk_enter)
        {
            if  (indexSelected == i)
            and (fieldSelected = professionalValueFieldIndex)
            {
                // get the new description
                var preStr          = string(professional);
                var str             = get_string("Enter value for Professional:", professional);
                
                if (str != "")
                {    
                    var enteredValue    = formatQuantum(str);
                    
                    // set the value
                    enteredValue = real(enteredValue);
                    if (enteredValue != professional)
                    {
                        professional = enteredValue;
                        hcCustomArray[i, professionalValueFieldIndex] = professional;
                        array = hcCustomArray;
                        event_user(2); // tell Save Button to become visible/clickable
                    }
                }
            }
        }
        
        draw_set_alpha(rowAlpha);
        // if selected, draw a blue background and set text to white
        if  (indexSelected == i)
        and (fieldSelected = professionalValueFieldIndex)
        {
            draw_set_color(c_blue);
            draw_rectangle(professionalColumnX, y2, windowX2, yy, false);
            draw_set_color(c_white);
        }
        else
        {
            // mouse over?
            if ( mouse_over_popup_area(professionalColumnX, y2, windowX2, yy) )
            {
                draw_set_colour(highlight_color);
                draw_rectangle(professionalColumnX, y2-1, windowX2, yy+1, false);   
            }
            
            // black text
            draw_set_color(c_black);
        }
        
        /// DRAW OUTLAY
        draw_set_alpha(1);
        draw_set_color(c_black);
        draw_set_halign(fa_right);
        draw_text(professionalTextX, yy, professional);
        
        // draw row 
        draw_line(windowX1, yy, windowX2, yy);
    }

}
