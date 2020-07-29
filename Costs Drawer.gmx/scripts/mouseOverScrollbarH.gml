/// mouseOverScrollbarH()

if global.MOUSE_FREE == false then exit;

guix = window_mouse_get_x();    // takes the x position from the gui layer and translates it to mouse_x
guiy = window_mouse_get_y();    // takes the y position from the gui layer and translates it to mouse_y

if SCROLLBAR_H.scrollbarShown == false then return false;

if      guiy > SCROLLBAR_H.y
    and guiy < SCROLLBAR_H.y + SCROLLBAR_H.height
    {
        return true;
    }
    else return false;
