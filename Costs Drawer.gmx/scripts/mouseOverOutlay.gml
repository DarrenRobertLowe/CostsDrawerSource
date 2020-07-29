
var yy = quantumPositionY;//y 
        //+((ds_list_size(descriptionList)-1)
        //* global.rowHeight);


        
if      (mouse_x > global.outlayColumnX)
    and (mouse_x < global.fColumnX)
    and (mouse_y > (yy - global.rowHeight))
    and (mouse_y < yy)
        {
        return 1;
        }
