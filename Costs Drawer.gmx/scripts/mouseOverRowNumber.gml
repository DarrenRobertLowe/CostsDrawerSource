/// this calc is needed now because of paragraph items
var bEndY = calculateBorderEnd();


if      mouse_x > global.rowNumberX
    and mouse_x < global.dateColumnX
    and mouse_y > borderStartY
    and mouse_y < bEndY
        {
        return 1;
        }
