var list = argument0;
var size = ds_list_size(list);

for (var i=0; i<size; i++)                                                  // iterate through every item
{
    var item = ds_list_find_value(list,i);                          // the current item (i)
    
    var index = item.object_index;
    
    if item.object_index = TOTALS                                           // remove TOTALS
    or item.object_index = PAGE_NUMBER                                      // remove PAGE_NUMBERs
    {
        ds_list_delete(list,i);
        i=0;
        size = ds_list_size(list);
    }
}
