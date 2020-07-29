/* reset_text()
 *
 * Resets the draw function variables to
 * default.
 * Should be called wherever these vars
 * are changed.
*/

draw_set_font_scaled(font_Times);
draw_set_color(global.itemTextColor);

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_alpha(1);

