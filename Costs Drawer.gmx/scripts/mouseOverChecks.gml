/// mouseOverChecks()
/* Also see user_item_dates() etc...
*/
if (global.PRINT_VIEW == true) then exit;
if (global.menuSelected != 0)  then exit;      // used to prevent selecting items while File Menu is open
if (global.middleMouseDragging == true) then exit;
if (exists(global.selected)) and (editing_item(global.selected)) then exit;

if  ( SCROLLBAR_H.scrollbarShown)
and ( SCROLLBAR_H.mouseOver )
  then exit;
    
if mouseOverAnyGUI() then exit;




// SELECT WHOLE ITEM
if ( mouseOverRowNumber() )
{
    drawBorder("item");
    
    if ( mouse_check_button_pressed(mb_left) )
    {
        global.selected     = id;
        selectedField       = "none";
        
        keyboard_CURSOR.field = 0;
        cursor_update_borders();
    }
}



// DELETE ITEM
if  ( global.selected == id )
and ( canDelete == true )
{
    draw_sprite(spr_bin, 0, global.hColumnX + 8, borderStartY + 4);
    drawBorder("item");
}
// delete is always available for "VAT Not Otherwise Recoverable"
if  (object_index == lastPage_VATNotRecoverable)
or  (object_index == WITNESS_FEE)
{
    if ( canDelete == true ) then draw_sprite(spr_bin, 0, global.hColumnX + 8, borderStartY + 4);
}



if (mouseOverDocument())
{
    if  (mouseOverBin())
    and (canDelete == true)
    {
        if ( global.selected == id )
        or ( object_index == lastPage_VATNotRecoverable)
        {
            highlightButtonArea(global.hColumnX,borderStartY,global.hColumnX + 32,borderStartY+global.rowHeight);
            draw_sprite(spr_bin,0,global.hColumnX + 8,borderStartY + 4);
            drawBorder("item");
            
            if mouse_check_button_pressed(mb_left)
            {
                if show_question(DELETE_ITEM_MESSAGE)
                {
                    global.selected = -1;
                    delete_item(id);
                    set_unsaved();
                }
            }
        }
    }
    
    
    
    
    
    
    
    // GENERAL INSTRUCTIONS HIDE/SHOW
    /*
    if (object_index == GENERAL_INSTRUCTIONS_FEE)
    {
        if mouseOverItem()
        {
            if (global.HIDE_INSTRUCTIONS_FEE == true) // the icon shows what clicking will do
                then draw_sprite(spr_show,0,global.hColumnX + 8,borderStartY + 4);
                else draw_sprite(spr_hide,0,global.hColumnX + 8,borderStartY + 4);
                
            drawBorder("instructions");
        }
        
        if mouseOverBin() // mouse over hide/shoow
        {
            highlightButtonArea(global.hColumnX,borderStartY,global.hColumnX + 32,borderStartY+global.rowHeight);
            
            if (global.HIDE_INSTRUCTIONS_FEE == true) // the icon shows what clicking will do
                then draw_sprite(spr_show,0,global.hColumnX + 8,borderStartY + 4);
                else draw_sprite(spr_hide,0,global.hColumnX + 8,borderStartY + 4);
                
            drawBorder("instructions");
            
            if mouse_check_button_released(mb_left)
            {
                global.HIDE_INSTRUCTIONS_FEE = !global.HIDE_INSTRUCTIONS_FEE;   // false -> true, true -> false
                DOC_ORGANIZER.startFrom = GENERAL_INSTRUCTIONS_FEE.id           // set doc org to sort only the last page items
                DOC_ORGANIZER.alarm[0]  = 1;                                    // and sort them asap
            }
        }
    }
    */
    
    
    
    /// DATE
    //if (global.selected = id)
    {
        /// YEAR
        if ( mouseOverYear() )
        {
            if ( global.datePopup == id )
            or ( global.datePopup == -1 )
            {
                global.datePopup = id;
                
                
                if ( hasYear == true )
                {
                    drawBorder("year");
                    
                    // LEFT CLICK
                    if mouse_check_button_released(mb_left)
                    {
                        global.selected = id;
                        selectedField = "year";
                        
                        keyboard_CURSOR.field = 1;
                        cursor_update_borders();
                   } 
                   
                    // RIGHT CLICK
                    if  mouse_check_button_released(mb_right)
                    {
                        global.selected = id;
                        selectedField = "year";
                        keyboard_CURSOR.field = 1;
                        cursor_update_borders();
                        
                        
                        activateContextMenu(id,"year",true);
                        itemContextMenu.itemID = item;                  // pass the ITEM to the Context Menu
                        /*
                        instance_activate_object(itemContextMenu);      // activate the context menu object
                        itemContextMenu.alarm[0] = 1;                   // reposition the menu
                        global.menuSelected = itemContextMenu.id;       // only allow this GUI menu item to show
                        itemContextMenu.itemID = global.selected;       // pass the ITEM to the Context Menu
                        //global.selected     = itemContextMenu.id;       // disable the ITEM underneath
                        itemContextMenu.selectedField = "year";         // pass the field to the Context Menu
                        */
                    }
                }
                else // if (hasYear == false) select the whole item instead
                {
                    if ( mouse_check_button_released(mb_left) )
                    {
                        global.selected = id;
                        selectedField = "whole item";
                            
                        keyboard_CURSOR.field = 0;
                        cursor_update_borders();
                    }
                }
            }
        }
        
        
        /// MONTH
        if ( mouseOverMonth() )
        {
            if ( hasMonth == true )
            {
                global.datePopup = id;
                drawBorder("month");
                
                // LEFT CLICK
                if mouse_check_button_released(mb_left)
                {
                    global.selected = id;
                    selectedField = "month";
                    
                    keyboard_CURSOR.field = 2;
                    cursor_update_borders();
               } 
               
                // RIGHT CLICK
                if mouse_check_button_released(mb_right)
                {    
                    global.selected = id;
                    selectedField = "month";
                    keyboard_CURSOR.field = 2;
                    cursor_update_borders();
                    
                    activateContextMenu(id,"month",true);
                    itemContextMenu.itemID = item;                  // pass the ITEM to the Context Menu
                    /*
                    instance_activate_object(itemContextMenu);      // activate the context menu object
                    itemContextMenu.alarm[0] = 1;                   // reposition the menu
                    global.menuSelected = itemContextMenu.id;       // only allow this GUI menu item to show
                    itemContextMenu.itemID = global.selected;       // pass the ITEM to the Context Menu
                    //global.selected     = itemContextMenu.id;       // disable the ITEM underneath
                    itemContextMenu.selectedField = "month"         // pass the field to the Context Menu
                    */
                }
            }
            else // if (hasMonth == false) select the whole item instead
            {
                if ( mouse_check_button_released(mb_left) )
                {
                    global.selected = id;
                    selectedField = "whole item";
                        
                    keyboard_CURSOR.field = 0;
                    cursor_update_borders();
                }
            }
        }
        
        /// DAY
        if  ( mouseOverDay() )
        and ( hasDay == true )
        and ( global.datePopup == id )
        {
            drawBorder("day");
            
            // LEFT CLICK
            if (mouse_check_button_released(mb_left))
            {
                global.selected = id;
                selectedField = "day";
                
                keyboard_CURSOR.field = 3;
                cursor_update_borders();
           } 
           
            // RIGHT CLICK
            if mouse_check_button_released(mb_right)
            {
                global.selected = id;
                selectedField = "day";
                keyboard_CURSOR.field = 3;
                cursor_update_borders();
                
                activateContextMenu(id,"day",true);
                itemContextMenu.itemID = item;                  // pass the ITEM to the Context Menu
                /*
                instance_activate_object(itemContextMenu);      // activate the context menu object
                itemContextMenu.alarm[0] = 1;                   // reposition the menu
                global.menuSelected = itemContextMenu.id;       // only allow this GUI menu item to show
                itemContextMenu.itemID = global.selected;       // pass the ITEM to the Context Menu
                //global.selected     = itemContextMenu.id;       // disable the ITEM underneath
                itemContextMenu.selectedField = "day"           // pass the field to the Context Menu
                */
            }
        }
        
        
    }
    
    
    
    
    
    /// TOGGLE ITEM COUNT
    if  ( mouseOverItemNo() )
    {
        if ( canToggleItemNumber == true )
        {
            drawBorder("item number");
    
            // LEFT CLICK
            if mouse_check_button_released(mb_left) {
                global.selected = id;
                selectedField = "item number";
                
                keyboard_CURSOR.field = 4;
                cursor_update_borders();
            }
            
            
            // RIGHT CLICK
            if mouse_check_button_released(mb_right)
            {
                global.selected = id;
                selectedField = "item number";
                keyboard_CURSOR.field = 4;
                cursor_update_borders();
                
                activateContextMenu(id,"item number",true);
                itemContextMenu.itemID = item;                  // pass the ITEM to the Context Menu
                /*
                instance_activate_object(itemContextMenu);      // activate the context menu object
                itemContextMenu.alarm[0] = 1;                   // reposition the menu
                global.menuSelected = itemContextMenu.id;       // only allow this GUI menu item to show
                itemContextMenu.itemID = global.selected;       // pass the ITEM to the Context Menu
                //global.selected     = itemContextMenu.id;       // disable the ITEM underneath
                itemContextMenu.selectedField = "item number"   // pass the field to the Context Menu
                */
            }
        }
        else // if (canToggleItemNumber == false) select the whole item instead
        {
            if ( mouse_check_button_released(mb_left) )
            {
                global.selected = id;
                selectedField = "whole item";
                    
                keyboard_CURSOR.field = 0;
                cursor_update_borders();
            }
        }
    }

    // DESCRIPTION
    if  ( mouseOverDescription() )
    {
        if ( hasDescription )
        {
            if (object_index == INSTRUCTIONS_FEE_ITEM) then drawBorder("instructionsFeeItem");
            else drawBorder("description");
            
            if  (global.CURSOR_TOOL == "split")
            and (canSplit == true)
            {
                // highlight the specific character
                workingString = getDescription();
                selectedField = "";
                get_cursor_position_from_mouse();
                getCursorPositionFromStringPosition();
                
                draw_set_color(c_red);
                draw_rectangle(cursor_xx-1,cursor_yy,cursor_xx+1,cursor_yy+rowHeight,false);
                
                
                var outlayColumnX       = global.outlayColumnX;
                var descriptionColumnX  = global.descriptionColumnX;
                
                // draw a red line on the current row
                var irow = getRowFromY(mouse_y);
                var rowy = ( ((irow) * global.rowHeight) + global.pageStart );
                
                draw_rectangle(descriptionColumnX,rowy-1,outlayColumnX,rowy+1,false);
                
                if ( mouse_check_button_released(mb_left) )
                {
                    startChar = stringPosition;
                    endChar   = stringPosition;
                    
                    split_item_at_char(id, description, stringPosition)
                }
                
                reset_text();
            }
            
            
            if (global.CURSOR_TOOL == "normal")
            {
                // LEFT CLICK
                if ( mouse_check_button_released(mb_left) )
                {
                    global.selected = id;
                    selectedField = "description";
                    
                    /// added here for highlighting text issues
                    if (global.textHighlightable == true)
                    {
                        ds_list_copy(tempDescriptionList,descriptionList);      
                        remove_extra_spaces(tempDescriptionList);                                       // remove starting spaces
                        workingString  = getTempDescription(tempDescriptionList);                  // convert the list to a string
                        stringPosition = string_length(workingString);
                        getCursorPositionFromStringPosition();
                    }
                    ///////////
                    
                    keyboard_CURSOR.field = 5;
                    cursor_update_borders();
                    
                    if (object_index == INSTRUCTIONS_FEE_ITEM)
                    {
                        unlink_instructions_fee_check();
                    }
                    
                    getDescription();
                }
            
            
                // RIGHT CLICK
                if (mouse_check_button_released(mb_right))
                {
                    global.selected = id;
                    selectedField = "description";
                    keyboard_CURSOR.field = 5;
                    cursor_update_borders();
                    
                    activateContextMenu(id,"description",true);
                    itemContextMenu.itemID = item;                  // pass the ITEM to the Context Menu
                    /*
                    instance_activate_object(itemContextMenu);      // activate the context menu object
                    itemContextMenu.alarm[0] = 1;                   // reposition the menu
                    global.menuSelected = itemContextMenu.id;       // only allow this GUI menu item to show
                    itemContextMenu.itemID = global.selected;       // pass the ITEM to the Context Menu
                    //global.selected     = itemContextMenu.id;       // disable the ITEM underneath
                    itemContextMenu.selectedField = "description"   // pass the field to the Context Menu
                    */
                }
            }
            
        } // hasDescription end
        
        else // if hasDescription is false, select the whole item instead
        {
            if ( mouse_check_button_released(mb_left) )
            {
                global.selected = id;
                selectedField = "whole item";
                    
                keyboard_CURSOR.field = 0;
                cursor_update_borders();
            }
        }
        
    } // description end
    
    
    
    if ( mouseOverOutlay() )
    {
        if (hasOutlay)
        {
            drawBorder("outlay");
    
            
            // LEFT CLICK
            if mouse_check_button_released(mb_left) {
                global.selected = id;                           // this ITEM object's id.
                selectedField = "outlay";
                
                keyboard_CURSOR.field = 6;
                cursor_update_borders();
            }
            
            
            // RIGHT CLICK
            if mouse_check_button_released(mb_right)
            {
                global.selected = id;
                selectedField = "outlay";
                keyboard_CURSOR.field = 6;
                cursor_update_borders();
                
                activateContextMenu(id,"outlay",true);
                itemContextMenu.itemID = item;                  // pass the ITEM to the Context Menu
                /*
                instance_activate_object(itemContextMenu);      // activate the context menu object
                itemContextMenu.alarm[0] = 1;                   // reposition the menu
                global.menuSelected = itemContextMenu.id;       // only allow this GUI menu item to show
                itemContextMenu.itemID = global.selected;       // pass the ITEM to the Context Menu
                //global.selected     = itemContextMenu.id;       // disable the ITEM underneath
                itemContextMenu.selectedField = "outlay"        // pass the field to the Context Menu
                */
            }
        }
        else // if (hasOutlay == false) select the whole item instead
        {
            if ( mouse_check_button_released(mb_left) )
            {
                global.selected = id;
                selectedField = "whole item";
                    
                keyboard_CURSOR.field = 0;
                cursor_update_borders();
            }
        }
    }
    
    
    if  ( mouseOverProfessional() )
    {
        if ( hasProfessional )
        {
            drawBorder("professional");
    
            
            // LEFT CLICK
            if ( mouse_check_button_released(mb_left) )
            {
                global.selected = id;                           // this ITEM object's id.
                selectedField = "professional";
                
                keyboard_CURSOR.field = 7;
                cursor_update_borders();
            }
            
            
            // RIGHT CLICK
            if ( mouse_check_button_released(mb_right) )
            {
                global.selected = id;
                selectedField = "professional";
                keyboard_CURSOR.field = 7;
                cursor_update_borders();
                
                activateContextMenu(id, "professional", true);
                itemContextMenu.itemID = item;                  // pass the ITEM to the Context Menu
                /*
                instance_activate_object(itemContextMenu);      // activate the context menu object
                itemContextMenu.alarm[0] = 1;                   // reposition the menu
                global.menuSelected = itemContextMenu.id;       // only allow this GUI menu item to show
                itemContextMenu.itemID = global.selected;       // pass the ITEM to the Context Menu
                //global.selected     = itemContextMenu.id;       // disable the ITEM underneath
                itemContextMenu.selectedField = "professional"  // pass the field to the Context Menu
                */
            }
        }
        else // if (hasProfessional == false) select the whole item instead
        {
            if ( mouse_check_button_released(mb_left) )
            {
                global.selected = id;
                selectedField = "whole item";
                    
                keyboard_CURSOR.field = 0;
                cursor_update_borders();
            }
        }
    }
    
} // end of mouse_over_document_area
