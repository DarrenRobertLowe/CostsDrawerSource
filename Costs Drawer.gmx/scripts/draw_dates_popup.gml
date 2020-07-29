/// draw_dates_popup()


var x1 = (global.dateColumnX - (textMargin*3));
var y1 = textPosY - (rowHeight);
var x2 = (global.itemNoColumnX + (textMargin));
var y2 = y1;

// set the background end y
if (hasDay == false)
 then y2 = (textPosY + rowHeight);
 else y2 = (textPosY + (rowHeight*2));


// draw popup background
draw_set_color(global.popupColor);
draw_rectangle(x1,y1,x2,y2,0);

// draw popup outline
draw_set_color(global.popupOutlineColor);
draw_rectangle(x1,y1,x2,y2,1);
