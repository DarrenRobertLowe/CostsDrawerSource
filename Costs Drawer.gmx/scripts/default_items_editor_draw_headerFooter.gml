///default_items_editor_draw_headerFooter();

// footer and header backgrounds
draw_set_color(c_ltgray);
draw_rectangle(windowX1, windowY1, popupWindowEndX, headerY,  false);   // header
draw_rectangle(windowX1, footerY1, popupWindowEndX, footerY2, false);  // footer


// draw headers
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
draw_set_color(c_black);

// default items headers
//draw_text(headerDescriptionX,   headerY, "Default Item Description");
//draw_text(headerNewValueX,      headerY, "New Value");
//draw_text(headerDefaultValueX,  headerY, "Default Value");

// custom items headers
draw_text(headerDescriptionX,   customHeaderY, "Custom Made Items");
draw_text(headerNewValueX,      customHeaderY, "Outlay");
draw_text(headerDefaultValueX,  customHeaderY, "Professional");
