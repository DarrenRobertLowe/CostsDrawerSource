guix = window_mouse_get_x();        // takes the x position from the gui layer and translates it to mouse_x
guiy = window_mouse_get_y();        // takes the y position from the gui layer and translates it to mouse_y


if      guix > 0
    and guix < room_width
    and guiy > window_get_height()-global.guiFooterHeight
    and guiy < window_get_height()
        {
        return true
        }
