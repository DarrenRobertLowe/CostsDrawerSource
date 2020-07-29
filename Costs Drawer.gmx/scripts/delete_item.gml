/// delete_item(id);
/* RETURNS void
 *
 * argument0 = the specific item to be destroyed
 *
 * Description:
 * This script destroys an item and removes it from the list.
 *
*/

var item = argument0;
var list = find_list(item); // returns the id of the list our item is on, or returns -1 if not found at all.
var pos  = -1;

if (list > -1)
  then pos = ds_list_find_index(list,item); // find our position on the list

/*
if (list == global.listOfItems) then show_message("item was found on global.listOfItems");
if (list == global.LAST_PAGE_ITEMS) then show_message("item was found on global.LAST_PAGE_ITEMS");
if (list == -1) then show_message("item was NOT found on either list!");
*/

/// UNDO ///
if (pos > -1)
{
    history_delete_item(global.UNDO,item);

    // UPDATE DOCUMENT //
    var startFrom = ds_list_find_value(list,pos);
    DOC_ORGANIZER.startFrom = startFrom;
    DOC_ORGANIZER.alarm[0] = 1;
}

// DELETE INSTANCE
instance_destroy(item,true);

// select another item
var prevItem = ds_list_find_value(list,pos-1);
if exists(prevItem) then global.selected = prevItem;
else global.selected = -1;

//count_folios();
set_unsaved();
