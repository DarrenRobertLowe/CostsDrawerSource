if (global.SHOW_WARNINGS == true)
{
    var list = global.CAUTIONS;
    
    // highlight rows on cautionRowList
    if (ds_list_size(cautionRowList) > 0)
    {
        var size = ds_list_size(cautionRowList);
        
        for (i=0; i<size; i++)
        {
            var row = ds_list_find_value(cautionRowList,i);
            
            if (rowIsVisible(row))
            {
                var x1 = global.rowNumberX;
                var x2 = global.hColumnX;
                var y1 = getYFromRow(row);
                var y2 = (y1 + global.rowHeight);
                
                draw_set_alpha(.4);
                draw_set_color(c_orange);
                draw_rectangle(x1,y1,x2,y2,0);
            }
        }
    }
}
