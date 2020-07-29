/// move_item_down_list(list, item id)
var list = argument0;
var item = argument1;

var pos = ds_list_find_index(list,item);

var size = ds_list_size(list);

for(i=(pos+1); i<(size-1); i++)
{
    var nextItem = ds_list_find_value(list,i);
    
    if  !(is_undefined(nextItem))
    and (instance_exists(nextItem))
    and (nextItem.object_index != TOTALS)
    and (nextItem.object_index != PAGE_NUMBER)
    and (nextItem.object_index != BUTTON_CreateNewItem)
    and (item.moveable == true)
    {
        if (nextItem.object_index == INSTRUCTIONS_FEE_TOTAL) // instructions fee details can't move beyond the fee
        {
            exit;
        }
        else
        {
            ds_list_insert(list,i+1,item);  // place us after the nextItem.
            ds_list_delete(list,pos);       // delete our original position
            set_unsaved();
            
            // update totals?
            var oldRow = getPageNumberFromRow(item.row);
            var newRow = getPageNumberFromRow(nextItem.row);
            if (oldRow != newRow) then DOC_ORGANIZER.updateTotals = true;
            else DOC_ORGANIZER.updateTotals = false;
                
            
            DOC_ORGANIZER.startFrom = id;
            DOC_ORGANIZER.alarm[0] = 1;
            exit;
        }
    }
}
