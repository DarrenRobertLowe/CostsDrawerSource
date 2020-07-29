/// this calc is needed now because of paragraph items

if      mouse_x > global.itemNoColumnX
    and mouse_x < global.cColumnX
    and mouse_y > borderStartY
    and mouse_y < borderStartY + global.rowHeight
        {
        return 1;
        }
