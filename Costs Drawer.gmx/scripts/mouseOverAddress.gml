///mouseOverAddress(line number)
if  (mouse_x > global.descriptionColumnX)   // these never change
and (mouse_x < global.outlayColumnX)        // these never change
{

    if (argument0 = 0)  // over anything
    {
        if  (mouse_y > borderStartY)
        and (mouse_y < borderStartY + (global.rowHeight*8))
        {
            return 1;
        }
    }
    
    if (argument0 = 1) // over line 1, etc..
    {
        if  (mouse_y > borderStartY)
        and (mouse_y < borderStartY + global.rowHeight)
        {
            return 1;
        }
    }
    
    if (argument0 = 2)
    {
        if  (mouse_y > borderStartY + global.rowHeight)
        and (mouse_y < borderStartY + (global.rowHeight*2))
        {
            return 1;
        }
    }
    
    if (argument0 = 3)
    {
        if  (mouse_y > borderStartY + (global.rowHeight*2))
        and (mouse_y < borderStartY + (global.rowHeight*3))
        {
            return 1;
        }
    }
    
    if (argument0 = 4)
    {
        if  (mouse_y > borderStartY + (global.rowHeight*3))
        and (mouse_y < borderStartY + (global.rowHeight*4))
        {
            return 1;
        }
    }
    
    if (argument0 = 5)
    {  
        if  (mouse_y > borderStartY + (global.rowHeight*4))
        and (mouse_y < borderStartY + (global.rowHeight*5))
        {
            return 1;
        }
    }
    
    if (argument0 = 6)
    {
        if  (mouse_y > borderStartY + (global.rowHeight*5))
        and (mouse_y < borderStartY + (global.rowHeight*6))
        {
            return 1;
        }
    }
    
    if (argument0 = 7)
    {
        if  (mouse_y > borderStartY + (global.rowHeight*6))
        and (mouse_y < borderStartY + (global.rowHeight*7))
        {
            return 1;
        }
    }
    
    if (argument0 = 8)
    {
        if  (mouse_y > borderStartY + (global.rowHeight*7))
        and (mouse_y < borderStartY + (global.rowHeight*8))
        {
            return 1;
        }
    }
}
