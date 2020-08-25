/// default_items_editor_logic()

draw_set_font(font_GUI);

// draw popup window
default_items_editor_draw_popupWindow();



/* TO DO:
 * We'll need a scrollbar and scroll buttons.
 *
 * We want to trim the description if it's longer
 * than the descriptionTextWidth.
 * 
 */

// ...DRAW AND EDIT...
// default items
default_items_editor_logic_defaultItems();

// custom items
default_items_editor_logic_customItems();

