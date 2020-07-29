/// split_item(item id, row);
/* 
 * Takes the row the user clicked on (will split above that row)
 * Finds row on descriptionList A and copies all remaining descriptionList lines to a temp list B.
 *
 * Deletes those rows from descriptionList A.
 *
 * Inserts a new blank item.
 * Adds list B to that new item's descriptionList.
 *
 * Note: DOC_ORG is called by insert_item();
*/

var item = argument0;               // the id of the item we're splitting into two
var row  = argument1;               // the row we're splitting on

var list = item.descriptionList;
var newList = ds_list_create();     // create the newList

var line = (row - item.row);        // equates to the line of descriptionList (but not shownDescriptionList, could cause issues??)



if (line > 0)
{
    var size = ds_list_size(list);
    
    for (var i=line; i<size; i++)
    {
        var litem = ds_list_find_value(list,i); // find the nth row...
        ds_list_add(newList,litem);             // and add it to newList...
    }
    
    
    // remove same lines from original description
    for(var i=line; i<size; i++)
    {
        ds_list_delete(item.descriptionList,line);
    }
    with (item)
    {
        var idescription = getDescription();
        confirmDescription(idescription);
    }
    
    
    
    // find our position on the list
    var itemList = find_list(id);                   // find which list we're on
    var pos = -1;
    
    if (itemList == global.listOfItems)
    or (itemList == global.LAST_PAGE_ITEMS)
      then pos = ds_list_find_index(itemList,id);
    
    

    // CREATE THE NEW ITEM
    if (pos > -1)
    {
        var newItem = -1;
        
        if (itemList == global.listOfItems)     then newItem = insert_item(USER_ITEM,pos+1)
        if (itemList == global.LAST_PAGE_ITEMS) then newItem = insert_lastPage_item(GENERAL_INSTRUCTIONS_DETAILS,pos+1)
        
        if exists(newItem)
        {
            // add the copied sentences one at a time to newItem's descriptionList.
            var isize = ds_list_size(newList);
            for (var i=0; i<isize; i++)
            {
                var litem = ds_list_find_value(newList,i);
                ds_list_add(newItem.descriptionList,litem);
            }
            
            // we must confirm the description so shownDescription gets updated.
            with (newItem)
            {
                var tempDesc = getDescription();   // changes descriptionList into a string
                confirmDescription(tempDesc);
            }
        }
    }
}


// cleanup
if ds_exists(newList,ds_type_list)
  then ds_list_destroy(newList);
  
global.CURSOR_TOOL = "normal";
