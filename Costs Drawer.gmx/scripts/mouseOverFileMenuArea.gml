/// mouseOverFileMenuArea(x1,y1,x2,y2);
/*
 *
*/
if (global.popup == 0)
{
    var guix = window_mouse_get_x();//mouse_x;//        // takes the x position from the gui layer and translates it to mouse_x
    var guiy = window_mouse_get_y();//mouse_y;//        // takes the y position from the gui layer and translates it to mouse_y
    
    if      guix > argument0
        and guiy > argument1
        and guix < argument2
        and guiy < argument3
            {
            return true;
            }
}
