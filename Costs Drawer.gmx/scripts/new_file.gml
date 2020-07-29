/// REBUILD DOCUMENT
/* Deletes all items, including page numbers and totals.
 * Sets the page number back to 1.
 * Sets the total rows to 1 page's worth.
*/


// Make a new document

MASTER.BILL_STARTED = false;
global.RESTARTING = true;
//window_set_size(648,529);
write_window_session();
clear_file();
instance_destroy(MASTER,true);
room_goto(OPENING_SCREEN);
//game_restart();
