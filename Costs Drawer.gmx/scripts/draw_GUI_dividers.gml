///draw_GUI_separators()
get_divider_values();

// draw the lines
draw_set_color(global.guiDividerColor)

if (menu_buttons_x_limit > menu_vertical_spacer_line1) then draw_line(menu_vertical_spacer_line1, menu_vertical_spacer_line_y1, menu_vertical_spacer_line1, menu_vertical_spacer_line_y2);
if (menu_buttons_x_limit > menu_vertical_spacer_line2) then draw_line(menu_vertical_spacer_line2, menu_vertical_spacer_line_y1, menu_vertical_spacer_line2, menu_vertical_spacer_line_y2);
if (menu_buttons_x_limit > menu_vertical_spacer_line3) then draw_line(menu_vertical_spacer_line3, menu_vertical_spacer_line_y1, menu_vertical_spacer_line3, menu_vertical_spacer_line_y2);
if (menu_buttons_x_limit > menu_vertical_spacer_line4) then draw_line(menu_vertical_spacer_line4, menu_vertical_spacer_line_y1, menu_vertical_spacer_line4, menu_vertical_spacer_line_y2);
if (menu_buttons_x_limit > menu_vertical_spacer_line5) then draw_line(menu_vertical_spacer_line5, menu_vertical_spacer_line_y1, menu_vertical_spacer_line5, menu_vertical_spacer_line_y2);
if (menu_buttons_x_limit > menu_vertical_spacer_line6) then draw_line(menu_vertical_spacer_line6, menu_vertical_spacer_line_y1, menu_vertical_spacer_line6, menu_vertical_spacer_line_y2);
