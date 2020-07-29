/*** 
 *       draw_rows()
 * This script draws the row
 * horizontal ruler lines
 *
 * It also draws the row numbers in
 * the same loop, handling some font
 * stuff as it does.
 ***/

/// draw row number background at left of page
//  var docHeight = pageStart + (global.totalRows*rowHeight)
if (global.PRINT_VIEW == true) then exit;

//var yy              = (view_yview[0] - pageStart);
//var startRow        = floor(yy / rowHeight);
//var rowsPerScreen   = ceil((window_get_height()) / (rowHeight)); // depends on resolution/window size
//var maxRow          = (draw_startRow + rowsPerScreen);

draw_set_font_scaled("rowNumbers");
draw_set_halign(fa_right);              // horizontal align right
draw_set_valign(fa_center);             // vertical align centre


/// DRAW THE ROW NUMBER BACKGROUND
draw_set_color(guiColor);
//draw_rectangle(rowNumberX, view_yview[0]+pageStart, dateColumnX, view_yview[0]+view_hview[0] ,0);
draw_rectangle(rowNumberX, pageStartPlusBuffer, dateColumnX, rowsEndY, 0);


/// DRAW THE ROW LINES
for (var i=draw_startRow; i<=maxRow; i++)
{
    // DRAW THE LINES
    draw_set_color(rowColor);
    draw_line(
        rowNumberX,//dateColumnX,
        pageStart + (i*rowHeight),
        hColumnX,
        pageStart + (i*rowHeight)                
        )
    
    // DRAW HORIZONTAL LINES UNDER EACH LINE NUMBER (LEFT HAND SIDE)
    draw_set_color(lineNoLineColor);
    draw_line(
        rowNumberX,                         // x1
        pageStart + (i*rowHeight),          // y1
        dateColumnX,                        // x2
        pageStart + (i*rowHeight)           // y2
        )
    
    
    // DRAW THE ROW COUNT (LEFT HAND NUMBER)
    //draw_set_color(lineNoTextColour);         // reset the draw colour to black
    draw_text(
        dateColumnX,                        // x
        pageStart                           // y
            - (rowHeight/2)                 // ..
            + (i*rowHeight),                // ..
        i);                                 // string
}

reset_text();
