/// create_item(item,row);
/* RETURNS newItem id
 *
 * argument0 = the type of item to be created
 * argument1 = the row
 *
 * Description:
 * This script creates a new ITEM object at the given 
 * row number.
 *
*/

var object   = argument0;
var yy       = getYFromRow(argument1);
var xx       = global.dateColumnX;
var list     = global.listOfItems;
var size     = ds_list_size(global.listOfItems);

var newItem  = instance_create(xx,yy,object);               // create the new item
newItem.row  = argument1;                                   // pass the row number to the new item
give_ID(newItem);

tots = ds_list_find_value(list,size-1)                      // get the TOTALS id
ds_list_delete(list,size-1);                                // delete TOTALS from the list

ds_list_add(list,newItem);                                  // add the new item to the list
ds_list_add(list,tots);                                     // re-add the TOTALS item to the list


//global.UNSAVED = 1;                                         // Mark that the file has been changed
set_unsaved();


// Make it so that we're editing the item already...
if (newItem.object_index == USER_ITEM)
{
    global.selected = newItem;
    newItem.selectedField = "description";
    
    keyboard_CURSOR.field = 5;
    fieldString = "description";
}

/// UNDO ///
if (newItem.object_index == USER_ITEM)
then history_create_item(global.UNDO,newItem);


return newItem;
