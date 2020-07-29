/// cursor_update_borders()
var selected = global.selected;

if  !is_undefined(selected)
and (selected > -1)
and instance_exists(selected)
{
    with (keyboard_CURSOR)
    {
        // whole item (and other)
        if (field == 0)
        {
                x1 = global.rowNumberX;
                y1 = selected.borderStartY;
                x2 = global.hColumnX;
                y2 = selected.borderEndY;
                fieldString = "whole item";
            
            if (selected.selectedField == "costsPursuantLine3")
            {
                x1 = global.descriptionColumnX;
                x2 = global.outlayColumnX;
                y1 = (selected.borderStartY + (global.rowHeight*2));
                y2 = (selected.borderStartY + (global.rowHeight*3));
            }
            
            if (selected.selectedField == "costsPursuantLine4")
            {
                x1 = global.descriptionColumnX;
                x2 = global.outlayColumnX;
                y1 = (selected.borderStartY + (global.rowHeight*3));
                y2 = (selected.borderStartY + (global.rowHeight*4));
            }
            
            if (selected.selectedField == "addressLine1")
            {
                x1 = global.descriptionColumnX;
                x2 = global.outlayColumnX;
                y1 = (selected.borderStartY);
                y2 = (selected.borderStartY + global.rowHeight);
            }
            
            if (selected.selectedField == "addressLine2")
            {
                x1 = global.descriptionColumnX;
                x2 = global.outlayColumnX;
                y1 = (selected.borderStartY + global.rowHeight);
                y2 = (selected.borderStartY + (global.rowHeight*2));
            }
            
            if (selected.selectedField == "addressLine3")
            {
                x1 = global.descriptionColumnX;
                x2 = global.outlayColumnX;
                y1 = (selected.borderStartY + (global.rowHeight*2));
                y2 = (selected.borderStartY + (global.rowHeight*3));
            }
            
            if (selected.selectedField == "addressLine4")
            {
                x1 = global.descriptionColumnX;
                x2 = global.outlayColumnX;
                y1 = (selected.borderStartY + (global.rowHeight*3));
                y2 = (selected.borderStartY + (global.rowHeight*4));
            }
            
            if (selected.selectedField == "addressLine5")
            {
                x1 = global.descriptionColumnX;
                x2 = global.outlayColumnX;
                y1 = (selected.borderStartY + (global.rowHeight*4));
                y2 = (selected.borderStartY + (global.rowHeight*5));
            }
            
            if (selected.selectedField == "addressLine6")
            {
                x1 = global.descriptionColumnX;
                x2 = global.outlayColumnX;
                y1 = (selected.borderStartY + (global.rowHeight*5));
                y2 = (selected.borderStartY + (global.rowHeight*6));
            }
            
            if (selected.selectedField == "addressLine7")
            {
                x1 = global.descriptionColumnX;
                x2 = global.outlayColumnX;
                y1 = (selected.borderStartY + (global.rowHeight*6));
                y2 = (selected.borderStartY + (global.rowHeight*7));
            }
            
            if (selected.selectedField == "addressLine8")
            {
                x1 = global.descriptionColumnX;
                x2 = global.outlayColumnX;
                y1 = (selected.borderStartY + (global.rowHeight*7));
                y2 = (selected.borderStartY + (global.rowHeight*8));
            }
            
            
            if (selected.selectedField == "solicitorVATNo")
            {
                x1 = global.descriptionColumnX;
                x2 = global.outlayColumnX;
                y1 = (selected.textPosY - selected.rowHeight);
                y2 = selected.textPosY;
            }
            
            if (selected.selectedField == "seniorVATNo")
            {
                x1 = global.descriptionColumnX;
                x2 = global.outlayColumnX;
                y1 = selected.textPosY;
                y2 = (selected.textPosY + selected.rowHeight);
            }
            
            if (selected.selectedField == "juniorVATNo")
            {
                x1 = global.descriptionColumnX;
                x2 = global.outlayColumnX;
                y1 = (selected.textPosY + (selected.rowHeight*2));
                y2 = (selected.textPosY + (selected.rowHeight*3));
            }
        }
        
        
        
        
        // year
        if (field == 1)
        {
                x1 = global.dateColumnX;
                y1 = selected.borderStartY;
                x2 = global.itemNoColumnX;
                y2 = (selected.borderStartY) + (global.rowHeight);
                fieldString = "year";
        }
        
        // month
        if (field == 2)
        { 
                x1 = global.dateColumnX;
                y1 = (selected.borderStartY) + (global.rowHeight);
                x2 = global.itemNoColumnX;
                y2 = (selected.borderStartY) + (global.rowHeight*2);
                fieldString = "month";
        }
        
        
        // day
        if (field == 3)
        {
                x1 = global.dateColumnX;
                y1 = (selected.borderStartY) + (global.rowHeight*2);
                x2 = global.itemNoColumnX;
                y2 = (selected.borderStartY) + (global.rowHeight*3);
                fieldString = "day";
        }
        
        
        // item no
        if (field == 4)
        { 
            x1 = global.itemNoColumnX;
            y1 = selected.borderStartY;
            x2 = global.cColumnX;
            y2 = selected.borderStartY+global.rowHeight;
            fieldString = "item number";
        }
        
        
        // description
        if (field == 5)
        {
            var lanes = ds_list_size(selected.descriptionList);
            if (lanes < 1) then lanes = 1;
            
            // default
            x1 = global.descriptionColumnX;
            y1 = selected.borderStartY;
            x2 = global.outlayColumnX;
            y2 = selected.borderStartY + (lanes * global.rowHeight); //selected.borderEndY;
            fieldString = "description";
                
            
            if (selected.object_index == WITNESS_FEE)
            {
                x1 = global.descriptionColumnX;
                y1 = selected.borderStartY;
                x2 = global.outlayColumnX;
                y2 = selected.borderStartY + ( ds_list_size(selected.shownDescriptionList) * global.rowHeight );
                fieldString = "description";
            }
            
            if (selected.object_index == PLAINTIFF)
            or (selected.object_index == DEFENDANT)
            {
                x1 = global.descriptionColumnX;
                y1 = (selected.borderStartY + (selected.showingAndText * global.rowHeight) );
                x2 = global.outlayColumnX;
                y2 = ( y1 + (lanes * global.rowHeight) ) ;
                fieldString = "description";
            }
            
        }
        
        
        // outlay
        if (field == 6)
        { 
            x1 = global.outlayColumnX;
            y1 = (selected.quantumPositionY - global.rowHeight);
            x2 = global.fColumnX;
            y2 = (selected.quantumPositionY);
            fieldString = "outlay";
        }
        
        
        // professional
        if (field == 7)
        {
            if  (selected.object_index == lastPage_drawingCostsAndCopy)
            and (global.BILL_COURT == "Highcourt")
            {
                x1 = global.professionalColumnX;
                y1 = (selected.quantumPositionY);
                x2 = global.hColumnX;
                y2 = (selected.quantumPositionY + global.rowHeight);
                fieldString = "professional";
            }
            else
            {
                x1 = global.professionalColumnX;
                y1 = (selected.quantumPositionY - global.rowHeight);
                x2 = global.hColumnX;
                y2 = (selected.quantumPositionY);
                fieldString = "professional";
            }
        }
        
        
   }
    
}
