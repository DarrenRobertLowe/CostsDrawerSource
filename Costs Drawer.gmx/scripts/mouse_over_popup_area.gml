/// mouse_over_popup_area(x1,y1,x2,y2);
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

var guix = window_mouse_get_x();        // takes the x position from the gui layer and translates it to mouse_x
var guiy = window_mouse_get_y();        // takes the y position from the gui layer and translates it to mouse_y

if  (guix > x1)
and (guiy > y1)
and (guix < x2)
and (guiy < y2)
{
    return true;
}
return false;
