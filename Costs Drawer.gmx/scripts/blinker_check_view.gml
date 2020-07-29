/// blinker_check_view()
/* When editing a description, repositions the view when 
 * the TEXT cursor goes off screen, centering it on the
 * TEXT cursor.
 */
 
if (global.CURSOR_TOOL == "normal")
{
    var cursor_xx = argument0;
    var cursor_yy = argument1;
    
    with (global.selected)
    {
        var miny = ( view_yview[0] + global.pageStart);                         // where view starts
        var maxy = ((view_yview[0] + view_hview[0]) - (global.rowHeight*2));    // where view ends
        
        if (cursor_yy < miny)
        or (cursor_yy > maxy)
        {
            view_yview[0] = (cursor_yy - (view_hview[0])/2);                    // center yview on cursor y
        }
        
        
        //var xx = (x1 + ( (item.lines * global.rowHeight)/2 ));
        var minx = (view_xview[0]);
        var maxx = (view_xview[0] + global.page_area_width);//view_wview[0]);
    
        var centerview = (window_get_width() - global.right_column_width);
        
        
        // if any part of cursor is offscreen
        if (cursor_xx > maxx)
        {
            view_xview[0] = cursor_xx - (centerview/2);
        }
        
        if (cursor_xx < minx)
        {
            view_xview[0] = cursor_xx - (centerview/2);
        }
    }
}

