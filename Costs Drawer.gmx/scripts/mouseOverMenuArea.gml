/// mouseOverMenuArea();
// NOTE: see Master for global.menuEndX, etc

guix = window_mouse_get_x();        // takes the x position from the gui layer and translates it to mouse_x
guiy = window_mouse_get_y();        // takes the y position from the gui layer and translates it to mouse_y


if      guix > global.fileMenuX
    and guix < global.endMenuX
    and guiy > global.menuY - global.menuTextHeight
    and guiy < global.menuY
        {
        return true
        }
