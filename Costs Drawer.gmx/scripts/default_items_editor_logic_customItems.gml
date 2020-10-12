///default_items_editor_logic_customItems();
var y1          = windowY1;
var y2          = contentEndY;
maxItemVisible  = default_items_editor_getMaxItem();
listSize        = array_height_2d(array);
lastIndex       = (listSize-1);


if (lastIndex > -1)
{
    // MOUSE WHEEL SCROLLING
    if ( mouse_over_popup_area(windowX1, windowY1, windowX2, contentEndY) )
    {
        if (mouse_wheel_up())
        {
            event_user(7);  // scroll up
        }
        
        if (mouse_wheel_down())
        {
            event_user(8);  // scroll down
        }
    }
    
    
    
    // DRAW / EDIT LIST ITEMS
    for (var i=startingIndex; i<(maxItemVisible+1); i++)
    {
        if (i<0) then break;    // a bit of a hack to prevent crashing. Shouldn't be needed when scrollbar math is fixed.
        
        var yy           = (listStartY + ( (i-startingIndex) *rowHeight));
        var y2           = (yy - rowHeight);
        
        
        // white background for every item
        draw_set_color(c_white);
        draw_rectangle(windowX1, y2, windowX2, yy, false);
        
        // draw rows
        draw_set_color(c_dkgray);
        draw_line(windowX1, y2, windowX2, y2);
        
        
        if (i < maxItemVisible)
        {
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
                    
                    // click on row
                    if (indexSelected == i)
                    {
                        if (double_clicked())
                        {
                            items_editor_edit_description(description, i);
                        }
                        else reset_clickTime();
                    }
                    else
                    {
                        indexSelected = i;
                        reset_clickTime();
                    }
                }
                
                tooltip(array[i,0]);
            }
            
            
            // edit with keyboard
            if (keyboard_check_pressed(vk_enter))
            {
                if  (indexSelected == i)
                and (fieldSelected == descriptionFieldIndex)
                {
                    items_editor_edit_description(description, i);
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
            
            var idesc        = "";
            var strLength    = (string_length(description) + 1);
            var targetWidth  = ( (descriptionColumnWidth - descriptionTextX) - string_width("...") );
            
            for (var a=0; a < strLength; a++)
            {
                if (string_width(idesc) > targetWidth)
                {
                    idesc += "...";     // trim and exit
                    a = strLength;
                }
                else idesc = string_copy(description, 0, a); // add a char
            }
            
            draw_text(descriptionTextX, yy, idesc);
            
            
            
            
            
            
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
                                items_editor_edit_outlay(outlay, i);
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
                        items_editor_edit_outlay(outlay, i);
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
                // draw_line(windowX1, yy, windowX2, yy);
                
                
                
                
                
                
                
                
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
                                items_editor_edit_professional(professional, i);
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
                        items_editor_edit_professional(professional, i);
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
                
            }
                
        }
    }
    
    
    // draw columns
    var y1 = windowY1;
    var y2 = contentEndY;
    
    draw_set_color(c_dkgray);
    draw_line(newValueColumnX,      y1,   newValueColumnX,        y2);
    draw_line(defaultValueColumnX,  y1,   defaultValueColumnX,    y2);
}
