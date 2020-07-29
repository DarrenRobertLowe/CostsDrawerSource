///get_previous_item(list,i)

var list = argument0;
var index = argument1;

var prevItem = -1;

for (var n=(index-1); n>0; n--) {                               // iterate backwards through item list
    prevItem = ds_list_find_value(list,n);                      // the current item (n)
    
    if  prevItem.object_index != TOTALS                         // exclude TOTALS
    and prevItem.object_index != PAGE_NUMBER {                  // exclude PAGE_NUMBERs
        n = 0;                                                  // when we find the item, end the loop
    }
}

return prevItem;


