/// update_progress_bar();

surface_set_target(application_surface);

var maxWidth = 500;
var xx = 200;
var yy = 300;
var xx2 = (xx + (maxWidth * argument0));

draw_set_color(c_green);
draw_set_alpha(1);
//draw_sprite(spr_progressbar,0,xx,yy);
draw_rectangle(xx, yy, maxWidth, yy +50 ,false);
show_debug_message(string(current_time) + "scipt is running"); 

draw_surface(application_surface, 0, 0);


surface_reset_target();
