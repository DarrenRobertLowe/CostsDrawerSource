if      mouse_x > global.dateColumnX
    and mouse_x < global.itemNoColumnX
    and mouse_y > borderStartY+(global.rowHeight*1)
    and mouse_y < borderStartY+(global.rowHeight*2)
        {
        return 1;
        }
