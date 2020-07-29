/// get_last_user_page();

// Find the last item's row
var myPage  = 0;
var list    = global.listOfItems;
var size    = ds_list_size(list);


if instance_exists(GENERAL_INSTRUCTIONS_FEE)
{
    var giRow   = GENERAL_INSTRUCTIONS_FEE.row;
    var myPage  = getPageNumberFromRow(giRow)-1;
}
else
{
    show_debug_message("NO INSTRUCTIONS FEE FOUND !!???!?");
    for(var i=size-1; i>0; i--)
    {
        var item = ds_list_find_value(list,i);
        
        if  !is_undefined(item)
        and item.object_index != TOTALS
        and item.object_index != PAGE_NUMBER
        //and !(object_is_ancestor(i,CONSTANT_ITEM))
        {
            myPage = getPageNumberFromRow(item.row);
            //show_debug_message("item = " +string(item) +" page number is " +string(myPage));
            i = 0;  // we found the last item so end the loop
        }
    }
}

return myPage;
