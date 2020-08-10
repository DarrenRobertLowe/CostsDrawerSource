/// reset_clickTime();
/* Gets the current time so we can later compare:
 * if global.TIMER <= (clickTime + doubleClickTime)
 * If that happens, it's a double-click.
 *
 * See: double_clicked();
 * See: setup_clickTimer();
*/

clickTime = (get_timer() / 1000); // less than this is a double-click
