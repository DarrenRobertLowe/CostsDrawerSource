/// find_list(item id)
/* RETURNS INT
 * Finds and returns the id of the list our item
 * is on, or returns -1 if not found at all.
*/

var targetItem = argument0;

// find the correct list
var list = -1;

//show_debug_message("looking for item on lists");
var pos = -1;

for(var i=0; i<ds_list_size(global.listOfItems); i++)
{
    var item = ds_list_find_value(global.listOfItems,i)
    if (item == targetItem)
    {
        list = global.listOfItems;
        i = ds_list_size(global.listOfItems);
    }
}

if (list == -1) // item not found on global.listOfItems
{
    for(var i=0; i<ds_list_size(global.LAST_PAGE_ITEMS); i++)
    {
        var item = ds_list_find_value(global.LAST_PAGE_ITEMS,i)
        if (item == targetItem)
        {
            list = global.LAST_PAGE_ITEMS;
            i = ds_list_size(global.LAST_PAGE_ITEMS);
        }
    }
}

if (list == -1) // item not found on global.listOfItems
{
    show_debug_message(string(get_timer()/1000)+": failed to find "+string(targetItem) +" on either list!!");
}

return list;
