/// constrain_view()

// get the maximum y position scrolling should take us to
var rowHeight = global.rowHeight;
var endY      = global.pageStart;
endY += ( (global.totalRows + 1) * rowHeight );
endY -= view_hview[0];
endY += ( rowHeight * SCROLLBAR_H.scrollbarShown );


// contrain the view
if (view_yview[0] < 0)    then view_yview[0] = 0;
if (view_yview[0] > endY) then view_yview[0] = endY;

WARNINGS_MASTER.alarm[1] = 12; // update the visible rows for warnings
WARNINGS_MASTER.alarm[0] = 12; // update the warnings
