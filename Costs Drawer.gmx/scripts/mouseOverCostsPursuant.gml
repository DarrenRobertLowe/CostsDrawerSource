///mouseOverCostsPursuant(line number)

if (argument0 = 0)  // over anything
{
    if  (mouse_x > global.descriptionColumnX)
    and (mouse_x < global.outlayColumnX)
    and (mouse_y > borderStartY + (global.rowHeight*2))
    and (mouse_y < borderStartY + (global.rowHeight*4))
    {
        return 1;
    }
}

if (argument0 = 1)
{
    if  (mouse_x > global.descriptionColumnX)
    and (mouse_x < global.outlayColumnX)
    and (mouse_y > borderStartY + (global.rowHeight*2))
    and (mouse_y < borderStartY + (global.rowHeight*3))
    {
        return 1;
    }
}

if (argument0 = 2)
{
    if  (mouse_x > global.descriptionColumnX)
    and (mouse_x < global.outlayColumnX)
    and (mouse_y > borderStartY + (global.rowHeight*3))
    and (mouse_y < borderStartY + (global.rowHeight*4))
    {
        return 1;
    }
}
