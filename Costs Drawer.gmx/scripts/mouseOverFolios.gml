if (mouseOverAnyGUI())
{
    return false;
    exit;
}

if (folios > 0)
{
    if      mouse_x > global.descriptionColumnX
        and mouse_x < textPosX + string_width(folios)
        and mouse_y > (borderStartY + global.rowHeight)
        and mouse_y < (borderEndY)
        {
            return 1;
        }
    }
else
{
    if      mouse_x > global.descriptionColumnX
        and mouse_x < global.descriptionColumnX + string_width("Enter ")
        and mouse_y > (borderStartY + global.rowHeight)
        and mouse_y < (borderEndY)
        {
            return 1;
        }
}    
