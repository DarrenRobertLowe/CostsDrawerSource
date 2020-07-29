//if  (global.selected == id)
if (global.datePopup == id)
if (hasDate == true)
{
    var endY        = 0;
    var linesTemp   = lines;
    if  (linesTemp < 3) then linesTemp = 3;
    
    
    var minEndY = (borderStartY + (global.rowHeight * linesTemp));
    if (borderEndY >= minEndY) then endY = borderEndY;
    else endY = minEndY;
    
    var y2;
    if (hasDay == false) then y2 = (borderStartY + (global.rowHeight*2));
    if (hasDay == true) then y2 = (borderStartY + (global.rowHeight*3));
    
    
    if      (mouse_x > global.dateColumnX)
        and (mouse_x < global.itemNoColumnX)
        and (mouse_y > borderStartY)
        and (mouse_y < y2) //endY
        {
            //global.popup = id;
            //global.datePopup = id;
            return 1;
        }
        else return 0;
}
else return 0;
