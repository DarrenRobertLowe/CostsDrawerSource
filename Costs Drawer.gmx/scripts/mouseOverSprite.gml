/// mouseOverSprite()
/*
 *
*/

var guix = window_mouse_get_x();        // takes the x position from the gui layer and translates it to mouse_x
var guiy = window_mouse_get_y();        // takes the y position from the gui layer and translates it to mouse_y


if      guix > x
    and guiy > y
    and guix < x+sprite_width
    and guiy < y+sprite_height
        {
        return true;
        }
