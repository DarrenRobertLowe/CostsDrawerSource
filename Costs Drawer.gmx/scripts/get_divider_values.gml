///get_divider_values()

if (old_guiScale != global.GUI_SCALE)
{
    viewY = 0;
    current_guiScale = global.GUI_SCALE; // de-globalize for speed
    //show_debug_message("RUNNING GUI CHANGE SCRIPT! " +string(current_time));
    menu_buttons_x_limit = ( right_column_x );//window_get_width() + view_xview[0];//+(right_column_x);
    menu_vertical_spacer_line_y1 = (viewY + 34);
    
    if (current_guiScale == 1)
    {
        // y positions
        menu_vertical_spacer_line_y2 = (viewY + 50);
        
        // x positions
        menu_vertical_spacer_line1   = (95);
        menu_vertical_spacer_line2   = (135);
        menu_vertical_spacer_line3   = (235);
        menu_vertical_spacer_line4   = (305);
        menu_vertical_spacer_line5   = (375);
        menu_vertical_spacer_line6   = (415);
    }
    
    
    if (current_guiScale == 1.5)
    {
        // y positions
        menu_vertical_spacer_line_y2 = (viewY + 61);
        
        // x positions
        menu_vertical_spacer_line1   = (130);
        menu_vertical_spacer_line2   = (188);
        menu_vertical_spacer_line3   = (325);
        menu_vertical_spacer_line4   = (416);
        menu_vertical_spacer_line5   = (508);
        menu_vertical_spacer_line6   = (557);
    }
    
    // setup for next check
    old_xview = viewX;
    old_yview = viewY;
    old_guiScale = current_guiScale;
}

