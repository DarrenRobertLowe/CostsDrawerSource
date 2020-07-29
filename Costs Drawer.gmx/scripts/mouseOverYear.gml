if      mouse_x > global.dateColumnX
    and mouse_x < global.itemNoColumnX
    and mouse_y > borderStartY
    and mouse_y < borderStartY+global.rowHeight
        {
        return 1;
        }
