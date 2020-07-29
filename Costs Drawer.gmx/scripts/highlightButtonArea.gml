/// highlightButtonArea(x1,y1,x2,y2)

var col1 = global.buttonOverColour1;
var col2 = global.buttonOverColour2;

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

draw_set_alpha(global.buttonOverAlpha);
draw_rectangle_colour(x1,y1,x2,y2,col1,col1,col2,col2,0); // diagonal gradient

draw_set_color(global.buttonOverBorderColor);
draw_rectangle(x1,y1,x2,y2,1);                    // border

window_set_cursor(cr_handpoint);
if (room = WINDOW)
  then MASTER.alarm[8] = 2;   // returns pointer to normal
  else OPENING_SCREEN_MASTER.alarm[8] = 2;



reset_text();
