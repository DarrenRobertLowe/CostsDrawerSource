/// mouseOverArea(x1,y1,x2,y2);
/*
 *
*/
if (global.MOUSE_FREE == false) then exit;
if (global.popup != 0) then exit;


var guix = window_mouse_get_x();        // takes the x position from the gui layer and translates it to mouse_x
var guiy = window_mouse_get_y();        // takes the y position from the gui layer and translates it to mouse_y

if      guix > argument0
    and guiy > argument1
    and guix < argument2
    and guiy < argument3
        {
            return true;
        }
        else
        {
           // window_set_cursor(cr_default);
            //return false;
        }
