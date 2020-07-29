/// reorder_lastPage_list()
/* Organises the global.LAST_PAGE_ITEMS based
 * on the item rows order.
*/


// SETUP //
var listCopy2 = ds_list_create();
ds_list_copy(listCopy2,global.LAST_PAGE_ITEMS);
ds_list_clear(global.LAST_PAGE_ITEMS);

var listSize2 = ds_list_size(listCopy2);
var itemIsLowestRow = false;



/* We create a copy of the global.LAST_PAGE_ITEMS
 * We treat the first item as the lowest item (row) and check
 * every other item to see if they're lower.
 * If the comparison item is lower, we move item 0 to the end
 * of the list, and move onto the next item (now item 0)
*/

// THE LOOP //
while ds_list_size(listCopy2) > 1 {                      // while the list is greater than 1...
    var item1n = ds_list_find_value(listCopy2,0);                 // we're always working with index 0
    
    for(var i=1; i<(listSize2); i++) {                           // compare index 0 to 1++ (every other index)
        var item2n = ds_list_find_value(listCopy2,i);             // i+1 is the index to compare with
        
        if is_lower(item1n.row,item2n.row) {                      // if item.row is lower than next item's row
            itemIsLowestRow = true;                             // we MIGHT be the lowest row
        }
        else if (item1n.row == item2n.row) {
            /* We need a way to decide who should be lower on 
             * the list or the program freezes. It doesn't really 
             * matter as things get positioned properly later. */
            //show_message(string(item1n) + " is the same row as " +string(item2n) + "!"); // DEBUG MESSAGE
            if is_lower(item2n,item1n) then itemIsLowestRow = true;   // compare the ID's, lower numbers are usually earlier.
        }
        else {
            itemIsLowestRow = false;                            // it's not the lowest row so we'll need to check the next item
            ds_list_delete(listCopy2,0);                         // delete index 0 from the listCopy2
            ds_list_add(listCopy2,item1n);                        // readd it to the end instead
            listSize2 = ds_list_size(listCopy2);
            i = listSize2;                                       // end the loop because we need to start on the next item
        }
    }
    if itemIsLowestRow {
        // NOW we know we're the lowest row...
        ds_list_add(global.listOfItems,item1n);                  // add this item back to the list of items
        ds_list_delete(listCopy2,0);                             // we're always working with index 0
        listSize2 = ds_list_size(listCopy2);
    }
}

// else... After the looping and we're on the last item...
if ds_list_size(listCopy2) == 1 {
    item1n = ds_list_find_value(listCopy2,0);                     // we're always working with index 0
    ds_list_delete(listCopy2,0);                                 // we're always working with index 0
    ds_list_add(global.LAST_PAGE_ITEMS,item1n);                      // add this item back to the list of items
}

ds_list_destroy(listCopy2);
