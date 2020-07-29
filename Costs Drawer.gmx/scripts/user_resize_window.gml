/// user_resize_window()

// Window resizing
/* Allow the program window to be resized 
 * We use max() here in order to keep it at a minimum size
 * of 1x1. This prevents the program from crashing when the
 * screen is minimized, since that makes the program window
 * dimensions 0x0 which is invalid for a surface.
*/

// setup right column position
if (window_get_width()  != old_window_width)
or (window_get_height() != old_window_height)
{
    if (window_get_width() > 0)
    {
        perecentageWidth = (global.right_column_width / old_window_width); // used for position right column
        
        view_xview[0] = 0; // fixes a bug where right column is offscreen after resizing and view_xview > 0
        
        windowWidth   = max(1, window_get_width());
        windowHeight  = max(1, window_get_height());
        
        windowWidth  = round(windowWidth);
        windowHeight = round(windowHeight);
        
        /*if (windowWidth < WINDOW_MIN_WIDTH)
        {
            windowWidth     = WINDOW_MIN_WIDTH;
            windowHeight    = WINDOW_MIN_HEIGHT;
            window_set_size(WINDOW_MIN_WIDTH, WINDOW_MIN_HEIGHT);
        }*/
        
        
        /* store the window values so can tell if the window has been resized later*/
        /// scale the view
        view_wview[0] = (wview * scale)
        view_hview[0] = (hview * scale)
        
        view_xview[0] = round(view_xview[0]);
        view_yview[0] = round(view_yview[0]);
        
        old_wview = view_wview[0];
        old_hview = view_hview[0];
        
        
        /* resize the ports etc */
        view_wport[0] = windowWidth;
        view_hport[0] = windowHeight;
        view_wview[0] = windowWidth;
        view_hview[0] = windowHeight;
        
        
        /* Resize the surface so it fits the window size 
         * Only affects document area */
        if ( view_wport[0] != surface_get_width(application_surface) || view_hport[0] != surface_get_height(application_surface) )
        {
            surface_resize(application_surface, view_wport[0],view_hport[0]);
        }
        
        //current_percentage  = (right_column_x / windowWidth);
        
        
        
        set_relative_positions();
        
        
        colNamesY = view_yview[0]+92;   // used in draw event
        
        /* reposition the view if we have resized the window */
        with(SCROLLBAR_H) {
            x = scrollAreaStartX;
            get_view_x_from_scrollbar();
        }
        
        with(SCROLLBAR){
            get_view_y_from_scrollbar();
        }
        
        global.WINDOW_WIDTH  = window_get_width();
        global.WINDOW_HEIGHT = window_get_height();
        
        old_window_width  = window_get_width();
        old_window_height = window_get_height();
        
        // constrain the view
        var size = ds_list_size(global.COMMON_ITEMS);
        if (global.currentItemNumber > size) then global.currentItemNumber = size;
        
        right_column_x = (( view_xview[0] + view_wview[0] ) - ( windowWidth * perecentageWidth ));
        right_column_width = (windowWidth - right_column_x);
        
        //show_debug_message("trying to set right_column_x to " +string(right_column_x));
        
        constrain_view();
        items_SCROLLBAR.alarm[7] = 2; // updates the right column colors
        
        // RESIZE GUI LAYER
        display_set_gui_size(global.WINDOW_WIDTH,global.WINDOW_HEIGHT); // resize the gui layer to our window size
        //view_hview[0] = global.WINDOW_HEIGHT;
        //view_wview[0] = global.WINDOW_WIDTH;
        surface_resize(application_surface,view_wview,view_hview);
        
        event_user(0);
    }
}
