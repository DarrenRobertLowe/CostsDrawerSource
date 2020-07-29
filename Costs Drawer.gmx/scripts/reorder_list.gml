/// reorderList(listOfItems);
/* Organises the list (arg0) based
 * on the item rows order.
*/

// SETUP //
var listCopy = ds_list_create();
ds_list_copy(listCopy,argument0);                                   // e.g. global.listOfItems
ds_list_clear(argument0);

var listSize = ds_list_size(listCopy);
var itemIsLowestRow = false;



/* We create a copy of the argument0
 * We treat the first item as the lowest item (row) and check
 * every other item to see if they're lower.
 * If the comparison item is lower, we move item 0 to the end
 * of the list, and move onto the next item (now item 0)
*/

// THE LOOP //
while (ds_list_size(listCopy) > 1)                                  // while the list is greater than 1...
{
    var item1 = ds_list_find_value(listCopy,0);                     // we're always working with index 0
    
    for(var i=1; i<(listSize); i++)                                 // compare index 0 to 1++ (every other index)
    {
        var item2 = ds_list_find_value(listCopy,i);                 // i+1 is the index to compare with
        
        if is_lower(item1.row,item2.row)                            // if item.row is lower than next item's row
        {
            itemIsLowestRow = true;                                 // we MIGHT be the lowest row
        }
        else if (item1.row == item2.row)
        {
            /* We need a way to decide who should be lower on 
             * the list or the program freezes. It doesn't really 
             * matter as things get positioned properly later.
             */
            
            //show_message(string(item1) + " is the same row as " +string(item2) + "!"); // DEBUG MESSAGE
            if is_lower(item2,item1) then itemIsLowestRow = true;   // compare the ID's, lower numbers are usually earlier.
        }
        else
        {
            itemIsLowestRow = false;                                // it's not the lowest row so we'll need to check the next item
            ds_list_delete(listCopy,0);                             // delete index 0 from the listCopy
            ds_list_add(listCopy,item1);                            // readd it to the end instead
            listSize = ds_list_size(listCopy);
            i = listSize;                                           // end the loop because we need to start on the next item
        }
    }
    if itemIsLowestRow
    {
        // NOW we know we're the lowest row...
        ds_list_add(argument0,item1);                               // add this item back to the list of items
        ds_list_delete(listCopy,0);                                 // we're always working with index 0
        listSize = ds_list_size(listCopy);
    }
}

// else... After the looping and we're on the last item...
if (ds_list_size(listCopy) == 1)
{
    item1 = ds_list_find_value(listCopy,0);                     // we're always working with index 0
    ds_list_delete(listCopy,0);                                 // we're always working with index 0
    ds_list_add(argument0,item1);                                   // add this item back to the list of items
}

ds_list_destroy(listCopy);
