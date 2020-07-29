/// highlightButton();

var col1 = global.buttonOverColour1;
var col2 = global.buttonOverColour2;

var x1 = x - 5;
var y1 = y - 5;
var x2 = x + sprite_width  + 5;
var y2 = y + sprite_height + 5;

window_set_cursor(cr_handpoint);
MASTER.alarm[8] = 2;   // returns pointer to normal

draw_set_alpha(global.buttonOverAlpha);
draw_rectangle_colour(x1,y1,x2,y2,col1,col1,col2,col2,0); // diagonal gradient

draw_set_color(global.buttonOverBorderColor);
draw_rectangle(x1,y1,x2,y2,1);                    // border

reset_text();
