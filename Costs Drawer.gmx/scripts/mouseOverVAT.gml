///mouseOverVAT(y)

if (argument0 == 0)
{
    return 0;
}

if (argument0 == 1) // Solicitor VAT row
{
    if  (mouse_x > global.descriptionColumnX)
    and (mouse_x < global.outlayColumnX)
    and (mouse_y > borderStartY + (global.rowHeight*0))
    and (mouse_y < borderStartY + (global.rowHeight*1))
    {
        return 1;
    }
}

if (argument0 == 2) // Unused!
{
    if  (mouse_x > global.descriptionColumnX)
    and (mouse_x < global.outlayColumnX)
    and (mouse_y > borderStartY + (global.rowHeight*1))
    and (mouse_y < borderStartY + (global.rowHeight*2))
    {
        return 1;
    }
}

if (argument0 == 3) // S.C. VAT row (or J.C. if no S.C.)
{
    if  (mouse_x > global.descriptionColumnX)
    and (mouse_x < global.outlayColumnX)
    and (mouse_y > borderStartY + (global.rowHeight*2))
    and (mouse_y < borderStartY + (global.rowHeight*3))
    {
        return 1;
    }
}

if (argument0 == 4) // J.C. VAT row if S.C. exists
{
    if  (mouse_x > global.descriptionColumnX)
    and (mouse_x < global.outlayColumnX)
    and (mouse_y > borderStartY + (global.rowHeight*3))
    and (mouse_y < borderStartY + (global.rowHeight*4))
    {
        return 1;
    }
}
