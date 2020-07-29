/// draw_save_progress()

// draw the rectangle
var width       = 200;  // size of our progress notification area
var height      = 75;
var winWidth    = window_get_width();
var winHeight   = window_get_height();
var x1          = (winWidth /2) - (width /2)
var y1          = (winHeight /2) - (height /2)
var x2          = x1 + width;
var y2          = y1 + height;

draw_set_color(c_ltgray);
draw_rectangle(x1,y1,x2,y2,0);

draw_set_color(c_black);
//draw_set_color(c_gray);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
messageX        = x1 + (width /2);
messageY        = y1 + (height/2);
draw_text(messageX,messageY,"Saving...");


// clean up
reset_text();
