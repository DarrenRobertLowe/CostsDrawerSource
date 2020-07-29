if (global.SHOW_WARNINGS == true)
{
    var x1 = global.rowNumberX;
    var x2 = global.hColumnX;
    var list = global.WARNINGS;
    
    // highlight rows on warningRowList
    if (ds_list_size(warningRowList) > 0)
    {
        var size = ds_list_size(warningRowList);
        
        for (i=0; i<size; i++)
        {
            var row     = ds_list_find_value(warningRowList,i);
            
            var warning = ds_list_find_value(list,i);
            var colPos  = string_pos(":",warning);
            var message = string_copy(warning,colPos+2,string_length(warning));
            //show_debug_message("message = " +string(message));
            
            if (message == GAP_WARNING)
            {
                    //show_debug_message("*********** Passed!");
                    var y1 = getYFromRow(row);
                    //show_debug_message("row = "+string(row));
                    
                    var pageNum = getPageNumberFromRow(row);
                    var lastRow = (pageNum * global.rowsPerPage);
                    //show_debug_message("lastRow = "+string(lastRow));
                    
                    var y2 = getYFromRow(lastRow);
                    
                    draw_set_alpha(.4);
                    draw_set_color(c_red);
                    draw_rectangle(x1,y1,x2,y2,0);
            }
            
            else
            {
                if (rowIsVisible(row))
                {
                    var y1 = getYFromRow(row);
                    var y2 = (y1 + global.rowHeight);
                    
                    draw_set_alpha(.4);
                    draw_set_color(c_red);
                    draw_rectangle(x1,y1,x2,y2,0);
                }
            }
        }
    }
}


//GAP_WARNING
