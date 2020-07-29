/// draw_set_font_GUI_scaled(font)
// sets the appropriate GUI font based on the scale.

if global.GUI_scale = 1     then draw_set_font(font_GUI);
if global.GUI_scale = 1.5   then draw_set_font(font_GUI_large);
