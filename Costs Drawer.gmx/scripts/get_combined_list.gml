/// get_combined_list(list to copy to)

var combinedList = argument0;
ds_list_copy(combinedList, global.listOfItems);

var list2   = global.LAST_PAGE_ITEMS;
size        = ds_list_size(list2);

for(var i=0; i<size; i++)
{
    var lastPageItem = ds_list_find_value(combinedList,i)
    
    ds_list_add(combinedList,lastPageItem);
}

return combinedList;
