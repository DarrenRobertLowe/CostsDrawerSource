/// insert_INSTRUCTIONS_DETAILS();
// find the current selected item
// if that item position isn't on global.LAST_PAGE_ITEMS,
// or that item position < instructions fee
// or that item position >= instructions fee total
//   then we add it before instructions fee total
//   else, we add it after the selected item position

var newItem;
var selectedPos = ds_list_find_index(global.LAST_PAGE_ITEMS,global.selected);
var minPos      = ds_list_find_index(global.LAST_PAGE_ITEMS,GENERAL_INSTRUCTIONS_FEE.id);
var maxPos      = ds_list_find_index(global.LAST_PAGE_ITEMS,INSTRUCTIONS_FEE_TOTAL.id);


if (minPos == -1)
{
    show_debug_message("Error: Can't find instructions fee")
    exit;
}
if (maxPos == -1)
{
    show_debug_message("Error: Can't find Instructions Fee Total");
    exit;
}


if  (selectedPos >= minPos)
and (selectedPos <  maxPos)
{
    //show_message( "Succeeded, so inserting at position " +string(selectedPos) );
    newItem = insert_lastPage_item(GENERAL_INSTRUCTIONS_DETAILS,selectedPos+1)
}
else
{
    //show_message( "Failed, so inserting at position " +string(maxPos) );
    newItem = insert_lastPage_item(GENERAL_INSTRUCTIONS_DETAILS,maxPos)
}


return newItem;
