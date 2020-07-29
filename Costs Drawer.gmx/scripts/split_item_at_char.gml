/// split_item_at_char(item id, description, stringPos);
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
var str  = argument1;               // the string
var pos  = argument2;               // the string position we're splitting on

var strA = string_copy(str, 0, pos-1);
var strB = string_copy(str, pos, string_length(str));

item.description = strA;

with (item)
{
    confirmDescription(strA);
}


//show_debug_message("strA is "+string(strA));
//show_debug_message("strB is "+string(strB));


// CREATE ITEM AND GIVE IT strB AS DESCRIPTION
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
        newItem.description = strB;
        
        // we must confirm the description so shownDescription gets updated.
        with (newItem)
        {
            confirmDescription(strB);
        }
    }
}


// cleanup
global.CURSOR_TOOL = "normal";

