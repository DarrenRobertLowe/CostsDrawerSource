/// give_ID(instance);
/* Sets the unique ID of the give item so that
 * we can maintain relationships (e.g. master)
 * between runs of the program.
*/

//show_message("itemID = " +string(global.itemID));
global.itemID ++;
argument0.myID = global.itemID;
