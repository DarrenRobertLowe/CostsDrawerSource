///mouseOverRecordNumber()

var yy = y 
        +((ds_list_size(descriptionList)-1)
        *global.rowHeight);

if      mouse_x > global.descriptionColumnX + string_width("Record No. ")
    and mouse_x < global.outlayColumnX
    and mouse_y > borderStartY
    and mouse_y < (borderStartY + global.rowHeight)
        {
        return 1;
        }
