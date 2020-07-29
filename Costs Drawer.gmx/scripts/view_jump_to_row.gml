/// view_jump_to_row(row)
/* Moves the view so the given row is visible on screen.
 */

with (global.selected) // why do we need to use an instance?
{
    // find the current view
    var miny = ( view_yview[0] + global.pageStart);
    var maxy = ((view_yview[0] + view_hview[0]) - (global.rowHeight*2));
    
    // find the x and y of the given row
    var targety = getYFromRow(argument0);
    var targetx = global.descriptionColumnX;
    
    // text
    if (targety < miny)
    or (targety > maxy)
    {
        view_yview[0] = (targety - (view_hview[0])/2); // center view on the screen
    }
    
    
    //var xx = (x1 + ( (item.lines * global.rowHeight)/2 ));
    var minx = (view_xview[0]);
    var maxx = (view_xview[0] + global.page_area_width);//view_wview[0]);

    var centerview = (window_get_width() - global.right_column_width);
    
    
    // if any part of cursor is offscreen
    if (targetx > maxx)
    {
        view_xview[0] = targetx - (centerview/2);
    }
    
    if (targetx < minx)
    {
        view_xview[0] = targetx - (centerview/2);
    }
    
    constrain_view();
}
