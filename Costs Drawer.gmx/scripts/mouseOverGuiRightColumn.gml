/// mouseOverGuiRightColumn()

guix = window_mouse_get_x();        // takes the x position from the gui layer and translates it to mouse_x
guiy = window_mouse_get_y();        // takes the y position from the gui layer and translates it to mouse_y


if      guix > SCROLLBAR.x
    and guix < window_get_width()
        {
        return true
        }
