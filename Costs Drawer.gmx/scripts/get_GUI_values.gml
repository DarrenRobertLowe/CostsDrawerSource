///get_GUI_values()
// setup
/*current_guiScale = global.GUI_SCALE; // de-globalize for speed
viewX = view_xview[0];
viewY = view_yview[0];


// check
if (old_guiScale != current_guiScale)
if (old_xview    != viewX)
or (old_yview    != viewY)
{*/
    show_debug_message("RUNNING GUI CHANGE SCRIPT! " +string(current_time));
    menu_buttons_x_limit   = (viewX + right_column_x);
    
    
    if (current_guiScale == 1)
    {
        // y positions
        menu_vertical_spacer_line_y1 = (viewY + 34);
        menu_vertical_spacer_line_y2 = (viewY + 50);
        
        // x positions
        menu_vertical_spacer_line1   = (viewX + 95);
        menu_vertical_spacer_line2   = (viewX + 135);
        menu_vertical_spacer_line3   = (viewX + 235);
        menu_vertical_spacer_line4   = (viewX + 305);
        menu_vertical_spacer_line5   = (viewX + 375);
        menu_vertical_spacer_line6   = (viewX + 415);
    }
    
    
    if (current_guiScale == 1.5)
    {
        // y positions
        menu_vertical_spacer_line_y1 = (viewY + 34);
        menu_vertical_spacer_line_y2 = (viewY + 50);
        
        // x positions
        menu_vertical_spacer_line1   = (viewX + 95);
        menu_vertical_spacer_line2   = (viewX + 135);
        menu_vertical_spacer_line3   = (viewX + 235);
        menu_vertical_spacer_line4   = (viewX + 305);
        menu_vertical_spacer_line5   = (viewX + 375);
        menu_vertical_spacer_line6   = (viewX + 415);
    }
    
    /*
    // setup for next check
    old_guiScale = current_guiScale;
    old_xview = viewX;
    old_yview = viewY;
}

