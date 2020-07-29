if      mouse_x > global.hColumnX
    and mouse_x < global.hColumnX + 32
    and mouse_y > borderStartY
    and mouse_y < (borderStartY + rowHeight)
        {
        return 1;
        }
