guix = window_mouse_get_x();    // takes the x position from the gui layer and translates it to mouse_x
guiy = window_mouse_get_y();    // takes the y position from the gui layer and translates it to mouse_y


if      (guix > x)              // scrollbarX1
    and (guix < x + width)      // scrollbarX2
    and (guiy > y)              // scrollbarY1
    and (guiy < y + height)     // scrollbarY2
    {
        return true;
    }
