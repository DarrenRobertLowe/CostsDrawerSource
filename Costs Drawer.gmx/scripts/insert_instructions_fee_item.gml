/// insert_instructions_fee_item(item to insert,list position);
/* RETURNS new item id
 *
 * argument0 = the type of item to be created
 * argument1 = item currently in the position we want
 *
 * Description:
 * This script inserts a new ITEM object at the given 
 * list position.
 *
*/

var object  = argument0;
var listPos = argument1;


var list    = global.LAST_PAGE_ITEMS;
var currentItem = ds_list_find_value(list,listPos);

var row     = currentItem.row;
var newItem = instance_create(0,0,object);              // create the new item
newItem.row = row;

ds_list_insert(list,listPos,newItem);                   // insert the new item in its place


// Make it so that we're editing the item already...
if (newItem.object_index == INSTRUCTIONS_FEE_ITEM)
{
    global.selected = newItem;
    newItem.selectedField = "description";
    
    keyboard_CURSOR.field = 5;
    fieldString = "description";
}


//show_debug_message("Item " +string(newItem) +" Created");
set_unsaved();
DOC_ORGANIZER.alarm[0] = 1;
return newItem;
