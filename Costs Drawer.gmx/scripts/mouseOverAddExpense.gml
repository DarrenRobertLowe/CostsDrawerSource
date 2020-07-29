var lanes = ds_list_size(descriptionList);

if (lanes < 1) then lanes = 1;

if      mouse_x > global.descriptionColumnX
    and mouse_x < global.outlayColumnX
    and mouse_y > borderStartY + (lanes*global.rowHeight)
    and mouse_y < borderStartY + (lanes*global.rowHeight) + global.rowHeight//borderEndY
        {
        return 1;
        }
