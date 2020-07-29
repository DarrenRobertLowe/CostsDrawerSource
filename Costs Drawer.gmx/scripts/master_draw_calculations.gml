///master_draw_calculations();

// draw_paper
paperEndY       = (view_yview[0] + view_hview[0]);

//draw_columns
columns_startY  = (view_yview[0] + pageStart);

//draw_pageBreaks
var yy          = (view_yview[0] - pageStart);
draw_startRow   = floor(yy / rowHeight);
draw_maxRow     = ((draw_startRow + rowsPerPage)+1);


//draw_rows
rowsPerScreen   = ceil((window_get_height()) / (rowHeight)); // depends on resolution/window size
maxRow          = (draw_startRow + rowsPerScreen);
rowsEndY        = (paperEndY + 640); // was + 64
pageStartPlusBuffer = (columns_startY - 500); // was columns_startY
