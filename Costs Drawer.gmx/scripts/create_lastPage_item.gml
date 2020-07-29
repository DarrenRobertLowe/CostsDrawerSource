/// create_lastPage_item(item,row);
/* RETURNS void
 *
 * argument0 = the type of item to be created
 * argument1 = the row
 *
 * Description:
 * This script creates a new ITEM object at the given 
 * row number.
 *
*/

var object = argument0;
var yy = getYFromRow(argument1);
var xx = global.dateColumnX;
var listzz = global.LAST_PAGE_ITEMS;
var size = ds_list_size(listzz);


var newItemz = instance_create(xx,yy,object);                // create the new item
newItemz.row = argument1;                                    // pass the row number to the new item


tots = ds_list_find_value(listzz,size-1)                      // get the TOTALS id
ds_list_delete(listzz,size-1);                                // delete TOTALS from the listzz

ds_list_add(listzz,newItemz);                                  // add the new item to the listzz
ds_list_add(listzz,tots);                                     // re-add the TOTALS item to the listzz

//reorder_list();

global.UNSAVED = 1;                                         // Mark that the file has been changed


// Make it so that we're editing the item already...
/*
if (newItemz.object_index == USER_ITEM) {
    global.selected = newItemz;
    newItemz.selectedField = "description";
    
    keyboard_CURSOR.field = 5;
    fieldString = "description";
}
*/

return newItemz;
