var pos = -1;


var item = global.selected;
if  (item > -1)
and (instance_exists(item))
{
    pos = ds_list_find_index(global.listOfItems,item)
    
    // is this part of a block?
    if  (pos > -1)
    and (item.isBlock == true)
    and (ds_list_size(item.blockChildList) > 0)
    {
        item = ds_list_find_value( item.blockChildList, ds_list_size(item.blockChildList)-1 ); // get the last item of the block
    }
}

pos = ds_list_find_index(global.listOfItems,item)

// default if not found
if (pos == -1)
 then pos = ds_list_find_index(global.listOfItems,BUTTON_CreateNewItem.id)-1;

return pos;
