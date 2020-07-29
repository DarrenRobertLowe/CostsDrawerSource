/// user_resize_right_column()

var mouseX      = window_mouse_get_x();        // takes the x position from the gui layer and translates it to mouse_x
var mouseY      = window_mouse_get_y();        // takes the y position from the gui layer and translates it to mouse_y
var windowWidth = window_get_width();
var viewX       = view_xview[0];
var mouseIsOver = false;


if ( mouseIsOverRightColumnDivider(mouseX, mouseY) )
then mouseIsOver = true;


if (mouseIsOver)
{
    window_set_cursor(cr_size_we);
    MASTER.alarm[8] = 2;   // returns pointer to normal
    
    if (mouse_check_button_pressed(mb_left))
    {
        global.dragging_right_column = true;
    }
}


// dragging
if (global.dragging_right_column == true)
{
    MASTER.alarm[8] = 2;   // returns pointer to normal
    
    right_column_x           = (mouse_x - viewX);
    items_SCROLLBAR.alarm[7] = 2;
    set_relative_positions();
    
    // finish dragging
    if !(mouse_check_button(mb_left))
    {
        global.dragging_right_column = false;
        
        with (PARENT_rightColumnHScrollbars)
        {
            scrollbarPosition = 0;
            alarm[0] = 1;
        }
    }
}






/*
/// user_resize_right_column()
var mouseX = window_mouse_get_x();        // takes the x position from the gui layer and translates it to mouse_x
var mouseY = window_mouse_get_y();        // takes the y position from the gui layer and translates it to mouse_y
var windowWidth = window_get_width();
var viewX = view_xview[0];


if (global.vertical_scrollbar_dragging == false)
{
    if (dragging_right_column == false)
    {
        global.dragging_right_column = false;
        
        // check if mouse is over the divider
        var mouseIsOver = false;
        if mouseIsOverRightColumnDivider(mouseX, mouseY)
         then mouseIsOver = true;
        
        // set the appropriate cursor
        if (mouseIsOver == true)
        {
            window_set_cursor(cr_size_we);
            
            if (mouse_check_button_pressed(mb_left))
            {
                dragging_right_column = true;
            }
        }
        else
        {
            // if mouse is inside the main window (otherwise the cursor doesn't change when trying to resize the window)
            if ( mouseInsideWindow(mouseX, mouseY, windowWidth) )
            {
                window_set_cursor(cr_default);
            }
        }
    }
}



// Manually resizing right column
if (dragging_right_column == true)
{
    global.scale = 1; // HACK! Not ideal but sort of fixes a bug where the right column freaks out when being resized and scale isn't 1.
    //view_xview[0] = 0;
    global.dragging_right_column = true;
    
    window_set_cursor(cr_size_we);
    right_column_customized = true;
    right_column_x          = (mouse_x - viewX);
    
    right_column_percentage = (right_column_x / windowWidth);
    
    
    // maximum size
    if (right_column_percentage > 0.9)
    {
        right_column_percentage = 0.9;
        right_column_x = ( windowWidth * right_column_percentage );
    }
    
    
    // minimum size
    if (right_column_percentage < 0.3)
    {
        right_column_percentage = 0.3;
        right_column_x = ( windowWidth * right_column_percentage );
    }
    
    var targX = (global.counselX1 + global.counselWidth);
    if (right_column_x < targX) then right_column_x = targX;
    
    
    // keep the right column wide enough...
    var maxX        = (windowWidth - right_column_min_width);
    right_column_x  = (windowWidth * right_column_percentage);
    if (right_column_x > maxX) then right_column_x = maxX;
    
    
    if (mouse_check_button(mb_left) == false)
    {
        //window_set_cursor(cr_default);
        dragging_right_column = false;
    }
    
    with (PARENT_rightColumnHScrollbars)
    {
        scrollbarPosition = 0;
        alarm[0] = 1;
    }
    
   // show_debug_message("right column x is now " +string(right_column_x));
    
    items_SCROLLBAR.alarm[7] = 2; // updates the right column colors
    set_relative_positions();
}

