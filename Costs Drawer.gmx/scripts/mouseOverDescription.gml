//var lines = ds_list_size(descriptionList);
/// this calc is needed now because of paragraph items
if ( mouseOverAnyGUI() )
{
    return false;
    exit;
}

var bEndY = calculateBorderEnd();

if      mouse_x > global.descriptionColumnX
    and mouse_x < global.outlayColumnX
    and mouse_y > borderStartY
    and mouse_y < bEndY
    {
        return 1;
    }

