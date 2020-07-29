/// get_last_row_of_last_item()

// find the last item that isn't a page_number or totals...
var list = global.listOfItems;
var size = ds_list_size(list);

// get the row + lines of that item...
for(i=(size-1); i>0; i--)
{
    var item = ds_list_find_value(list,i);
    if is_undefined(item)
    {
        show_message("ITEM Undefined when trying to find last row!");
    }
    
    if  (item.object_index != PAGE_NUMBER)
    and (item.object_index != TOTALS)
    {
                                                    //show_message("ITEM IS " +string(object_get_name(item.object_index))); // DEBUG
        return (item.row + item.lines);
        exit;
    }
}
