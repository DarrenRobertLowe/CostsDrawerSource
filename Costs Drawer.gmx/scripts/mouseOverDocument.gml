///mouseOverDocumentArea();

guix = window_mouse_get_x();        // takes the x position from the gui layer and translates it to mouse_x
guiy = window_mouse_get_y();        // takes the y position from the gui layer and translates it to mouse_y

if (global.menuSelected > 0) then exit;

if      guix > 0
    and guix < (window_get_width() - global.right_column_width)
    and guiy > global.pageStart
    and guiy < (window_get_height() - global.guiFooterHeight)
        {
        return true
        }
