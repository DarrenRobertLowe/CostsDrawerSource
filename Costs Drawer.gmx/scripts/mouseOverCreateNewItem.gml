/// mouseOverCreateNewItem()

if      mouse_x > global.itemNoColumnX
    and mouse_x < global.hColumnX
    and mouse_y > borderStartY
    and mouse_y < borderEndY
        {
        return 1;
        }
