/// search_item_text(0 or 1 where 0=prev 1=next);

var direct = argument0;

if (searchString == "") // prevents crashing due to null string
{
    exit;
}

//show_debug_message("searching for next string "+string(searchString));

/// create a combined list of all items
var list1 = ds_list_create();
var list2 = ds_list_create();
ds_list_copy(list1,global.listOfItems);
ds_list_copy(list2,global.LAST_PAGE_ITEMS);
var combinedList = combine_lists(list1,list2);
var size = ds_list_size(combinedList);


// clear the search results list if anything changes (NOTE: set_unsaved() also does this)
if (searchString != oldString)
{
    ds_list_clear(searchResults);
    searchIndex = -1;
}


// CATALOGUE THE ITEMS THAT CONTAIN THE SEARCH TERMS
var str = string_lower(searchString);
if  (str != "")
and (searchString != oldString) // we only want to catalogue the items when the search criteria changes
{
    for(var item=0; item<size; item++)
    {
        var itemTarg = ds_list_find_value(combinedList,item);
        var itemText = string_lower(itemTarg.shownDescription);
            //show_debug_message("checking item "+string(itemTarg) +" index:"+string(item));
        
        var strPos = string_pos(str,itemText);
        
        if (strPos > 0) then ds_list_add(searchResults,itemTarg); // add this item to the seach results
    }
}


/// jump view to next result
if (ds_list_size(searchResults) > 0)
{
    if (direct == 0) then searchIndex--;
                     else searchIndex++;
    
    // loop through results
    if ( searchIndex >= ds_list_size(searchResults) )
     then searchIndex = 0;
    if ( searchIndex < 0 )
     then searchIndex = (ds_list_size(searchResults)-1);
    
    
    var item = ds_list_find_value(searchResults,searchIndex);
    if (exists(item))
    {
        view_jump_to_row(item.row);
        view_xview[0] = 0;
            //show_debug_message("str found on item row "+string(item.row));
            
        var nList = item.shownDescriptionList;
        var nSize = ds_list_size(nList);
            
        // find the exact row
        for (var n=0; n<nSize; n++)
        {
            var nStr = string_lower(ds_list_find_value(nList,n));
            if (string_pos(str,nStr) > 0)
            {
                highlightX1 = global.descriptionColumnX;
                highlightX2 = global.outlayColumnX;
                highlightY1 = getYFromRow(item.row+n);
                highlightY2 = highlightY1+global.rowHeight;
            }
        }
    }
}
else
{
    searchIndex = -1;
    show_message("Text not found!");
}


oldString = searchString; // so we can tell when the search has changed



// clean up
ds_list_destroy(list1);
ds_list_destroy(list2);
ds_list_destroy(combinedList);
