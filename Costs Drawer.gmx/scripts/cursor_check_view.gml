/// cursor_check_view()
/* Repositions the view when the cursor goes off screen,
 * centering it on the cursor.
 */
 
with keyboard_CURSOR
{
    var item = global.selected;

    var yy = (y1 + ( (item.lines * global.rowHeight)/2 ));
    var miny = (view_yview[0] + global.pageStart);
    var maxy = (view_yview[0] + (view_hview[0] - global.rowHeight));

    // if any part of cursor is offscreen
    if (y1 < miny)
    or (y2 > maxy)
    {
        view_yview[0] = ( yy - (view_hview[0] /2) );
    }
    
    
    //var xx = (x1 + ( (item.lines * global.rowHeight)/2 ));
    var minx = (view_xview[0]);
    var maxx = (view_xview[0] + global.page_area_width);//view_wview[0]);

    // if any part of cursor is offscreen
    if (x2 > maxx)//(x1+(x2-1))/2 )
    {
        view_xview[0] = (x2 - global.page_area_width);
    }
    
    if (x1 < minx) //(x1+(x2-1))/2 )
    {
        view_xview[0] = x1;
    }
    
    
}

