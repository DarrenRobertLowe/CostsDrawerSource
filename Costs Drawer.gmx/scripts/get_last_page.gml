/// get_last_page();

// Find the last item's row
var myPage  = 0;
var listz   = DOC_ORGANIZER.completeList;   //global.LAST_PAGE_ITEMS;
var size    = ds_list_size(listz);

for(var i=(size-1); i>0; i--)
{
    var item = ds_list_find_value(listz,i);
    
    if  !is_undefined(item)
    and instance_exists(item)
    {
        myPage = getPageNumberFromRow(item.row);
        i = 0;  // we found the last item so end the loop
    }
}

return myPage;
