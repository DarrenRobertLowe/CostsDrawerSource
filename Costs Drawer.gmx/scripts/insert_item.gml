/// insert_item(item to insert, list position);
/* RETURNS new item id
 *
 * argument0 = the type of item to be created
 * argument1 = item currently in the position we want
 *
 * Description:
 * This script inserts (instance_create) a new ITEM object 
 * at the given list position.
 *
*/

var object      = argument0;
var listPos     = argument1;
var list        = global.listOfItems;

if (listPos == -1)
 then listPos   = ds_list_find_index(list, BUTTON_CreateNewItem.id);

var currentItem = ds_list_find_value(list,listPos);

var row         = currentItem.row;
var newItem     = instance_create(0,0,object);              // create the new item


newItem.row     = row;
//show_message("newItem.row = " +string(row));



ds_list_insert(list,listPos,newItem);                   // insert the new item in its place
DOC_ORGANIZER.alarm[0] = 1;


view_jump_to_row(newItem.row);

// Make it so that we're editing the item already...
if  (newItem.object_index == USER_ITEM)
and (newItem.object_index != item_WHITESPACE)
{
    global.selected = newItem;
    
    if (newItem.hasDescription == true)
    {
        newItem.selectedField = "description";
        keyboard_CURSOR.field = 5;
        fieldString = "description";
    }
    else
    {
        newItem.selectedField = "none";
        keyboard_CURSOR.field = 0;
        fieldString = "whole item";
    }
    
}




//show_debug_message("Item " +string(newItem) +" Created");
set_unsaved();
return newItem;
