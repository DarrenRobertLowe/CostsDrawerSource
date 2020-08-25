///default_items_editor_draw_popupWindow();
var y1 = windowY1;
var y2 = windowY2;

// draw the white background
draw_set_color(c_white);
draw_rectangle(windowX1, y1, windowX2, y2, false);

// draw the popup border
draw_set_color(c_dkgray);
draw_rectangle(windowX1-1, y1, windowX2, y2, true);



// draw header and footer background rectangles
// background
draw_set_color(c_ltgray);
draw_rectangle(windowX1, y1, windowX2, headerY,       false); // header
//draw_rectangle(windowX1, (customHeaderY-rowHeight), windowX2, customHeaderY, false); // custom header
draw_rectangle(windowX1, footerY1, windowX2, footerY2, false); // footer
// border
draw_set_color(c_dkgray);
draw_rectangle((windowX1 - 1), (y1-1), (windowX2),   (headerY),          true); // header
//draw_rectangle((windowX1 - 1), (customHeaderY-(rowHeight+1)), (windowX2),   (customHeaderY),    true); // custom header
draw_rectangle((windowX1 - 1), footerY1, (windowX2),   footerY2,    true); // footer

// draw columns
draw_set_color(c_dkgray);
draw_line(newValueColumnX,      y1,   newValueColumnX,        y2);
draw_line(defaultValueColumnX,  y1,   defaultValueColumnX,    y2);


// draw headers
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
draw_set_color(c_black);
//draw_text(headerDescriptionX,   headerY, "Default Item Description");
//draw_text(headerNewValueX,      headerY, "New Value");
//draw_text(headerDefaultValueX,  headerY, "Default Value");

// custom items header
draw_text(headerDescriptionX,   customHeaderY, "Custom Made Items");
draw_text(headerNewValueX,      customHeaderY, "Outlay");
draw_text(headerDefaultValueX,  customHeaderY, "Professional");

