/// clean_listOfItems()
var list = argument0;
var size = ds_list_size(list);

for(var i=0;i<size;i++)
{
    var item = ds_list_find_value(list,i);   
    
    if (object_is_ancestor(item.object_index,CONSTANT_ITEM)) //(item.object_index == INSTRUCTIONS_FEE_ITEM)
    or (item.object_index == BUTTON_CreateNewItem)
    //or (object_is_ancestor(item,CONSTANT_ITEM)) //(item.object_index == GENERAL_INSTRUCTIONS_FEE)
    {
        ds_list_delete(list,i);
        i=0;                        // we removed an item so start again
        show_debug_message("removed " +string(item) +"from list");
    }
    
    size = ds_list_size(list);
}

lastUserPage = get_last_user_page();
lastPage     = get_last_page();
