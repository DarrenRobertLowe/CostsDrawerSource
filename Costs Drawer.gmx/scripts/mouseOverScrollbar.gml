if global.MOUSE_FREE == false then exit;

guix = window_mouse_get_x();    // takes the x position from the gui layer and translates it to mouse_x
guiy = window_mouse_get_y();    // takes the y position from the gui layer and translates it to mouse_y


if      guix > x
    and guix < x + width
    and guiy > y
    and guiy < y + height
    {
        return true;
    }
