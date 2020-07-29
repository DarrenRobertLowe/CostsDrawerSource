if      mouse_x > global.dateColumnX
    and mouse_x < global.itemNoColumnX
    and mouse_y > borderStartY+(global.rowHeight*2)
    and mouse_y < borderStartY+(global.rowHeight*3)
        {
        return 1;
        }
