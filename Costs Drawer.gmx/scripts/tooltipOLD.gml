/// tooltip(string,gui?)
with (TOOLTIPS)
{
    global.tooltipString = argument0;   // e.g. "Hello I am a description"
    var stringChanged = false;
    
    
    if ( global.tooltipCheck != (argument0 + string(id)) )
    {
        stringChanged = true;
    }
    else 
    {
        stringChanged = false;
    }
    
    
    if (stringChanged == true)
    {
        global.tooltipCounter = global.tooltipCounterTime;  // reset the counter
        global.tooltipCheck   = (argument0 + string(id));   // update the string
    }
    else
    {
        global.tooltipCounter --;
        
        if (global.tooltipCounter <= 0)
        {
            global.tooltipCounter = 0;
            
            draw_set_alpha(1);
            draw_set_font(font_GUI);
            draw_set_valign(fa_bottom);
            draw_set_halign(fa_left);
            
        
            str = global.tooltipString;
            var guix = 0;
            var guiy = 0;
            var x1 = 0;
            var x2 = 0;
            var y1 = 0;
            var y2 = 0;
            
            
            if (argument1 == true)  // GUI tool tip
            {
                guix = window_mouse_get_x();            // takes the x position from the gui layer and translates it to mouse_x
                guiy = window_mouse_get_y();            // takes the y position from the gui layer and translates it to mouse_y
    
                x1  = (guix + 10);
                x2  = (x1 + string_width(str));
                y1  = (guiy - string_height(str));
                y2  = (guiy);
                
                draw_set_color(global.tooltipsBackgroundColor); // background
                draw_rectangle(x1-1,y1-1,x2+1,y2+1,false);
            
                draw_set_color(global.tooltipsTextColor);       // border
                draw_rectangle(x1-1,y1-1,x2+1,y2+1,true);
            
                draw_set_color(global.tooltipsTextColor);
                draw_text(x1,y2,str);
            }
            else    // main content tool tip
            {
                x1  = (mouse_x + 10);
                x2  = (x1 + string_width(str));
                y1  = (mouse_y - string_height(str));
                y2  = (mouse_y);
                
                draw_set_color(global.tooltipsBackgroundColor); // background
                draw_rectangle(x1-1,y1-1,x2+1,y2+1,false);
            
                draw_set_color(global.tooltipsTextColor);       // border
                draw_rectangle(x1-1,y1-1,x2+1,y2+1,true);
            
                draw_set_color(global.tooltipsTextColor);
                draw_text(x1,y2,str);
            }
            
            
            
            reset_text();
        }
    }
}
