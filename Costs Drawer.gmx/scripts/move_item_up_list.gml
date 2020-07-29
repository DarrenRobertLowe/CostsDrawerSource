/// move_item_up_list(list, item id)
var list = argument0;
var item = argument1;

var pos = ds_list_find_index(list,item);

var size = ds_list_size(list);

for(i=(pos-1); i>=0; i--)
{
    var prevItem = ds_list_find_value(list,i);
    
    if  !(is_undefined(prevItem))
    and (instance_exists(prevItem))
    and (prevItem.object_index != TOTALS)
    and (prevItem.object_index != PAGE_NUMBER)
    and (item.moveable == true)
    {
        if (prevItem.object_index == item_caseDetails)          // list items can't move past case details
        or (prevItem.object_index == GENERAL_INSTRUCTIONS_FEE)  // last page items can't move past instructions fee
        {
            exit;
        }
        else
        {
            ds_list_insert(list,i,item); // place us in that position instead
            ds_list_delete(list,pos+1);  // +1 because we've added an item to the list
            set_unsaved();
            
            // update totals?
            var oldRow = getPageNumberFromRow(item.row);
            var newRow = getPageNumberFromRow(prevItem.row);
            if (oldRow != newRow) then DOC_ORGANIZER.updateTotals = true;
            else DOC_ORGANIZER.updateTotals = false;
                
            DOC_ORGANIZER.startFrom = id;
            DOC_ORGANIZER.alarm[0] = 1;
            exit;
        }
    }
}
