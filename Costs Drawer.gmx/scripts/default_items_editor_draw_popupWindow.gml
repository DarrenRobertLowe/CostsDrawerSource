///default_items_editor_draw_popupWindow();
var y1 = windowY1;

// draw the white background
draw_set_color(background_color);
draw_rectangle(windowX1,       y1, popupWindowEndX, footerY2, false);

// draw the popup border
draw_set_color(c_dkgray);
draw_rectangle((windowX1 - 1), y1, popupWindowEndX, footerY2, true);
