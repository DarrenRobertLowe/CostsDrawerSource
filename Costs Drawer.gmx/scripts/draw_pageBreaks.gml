/// draw_pageBreaks()
/* Draws a line every 42 rows to indicate
 * we're on a new page.
 *
 * Ideally we would have a view that shows
 * an actually gap between pages, that can
 * be toggled on and off.
*/

draw_set_color(pageBreakColor);
if (global.PRINT_VIEW == true) then draw_set_color(background_color);

//var yy = (view_yview[0] - pageStart);
//var startRow    = floor(yy / rowHeight);
//var maxRow      = (startRow + rowsPerPage)+1;

for (var i=0; i<=draw_maxRow; i+=rowsPerPage)
{
    var yy2 = (pageStart + (i*rowHeight));
    if (yy2 > draw_startRow * rowHeight)
    {
        draw_line
        (
            rowNumberX,                                  // x1
            yy2,                                 // y1
            hColumnX,                                    // x2
            yy2                                  // y2
        );
    }
}

reset_text();
