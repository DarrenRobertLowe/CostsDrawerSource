/// history_create_item(STACK,item id);

var stack = argument0;
var item  = argument1;
var list  = global.listOfItems;
var pos   = ds_list_find_index(list,item)                        // get the TOTALS id

if (pos == -1)
{
    //show_message("Could not find item on list");
    exit;
    //list = global.LAST_PAGE_ITEM;
    //pos = ds_list_find_index(global.LAST_PAGE_ITEMS,item)
}

if (pos > -1)
{
    //show_message("Item found on list, pushing create item");
    var event = (
        "Create Item;"
        + string(item.object_index)
        + ";"
        + string(item.row)
        + ";"
        + string(item.myID)
        + ";"
        + string(list)
        + ";"
        + string(pos)
        + ";"
        + string(item.description)
        + ";"
        + string(item.seeFeeLater)
        + ";"
        + string(item.countMyItemNumber)
        + ";"
        + string(item.outlayText)
        + ";"
        + string(item.professionalText)
        + ";"
        + string(item.dateYear)
        + ";"
        + string(item.dateMonth)
        + ";"
        + string(item.dateDay)
        + ";"
        + string(item.master)
        + ";"
        + string(item.myFee)
        + ";"
        + string(item.myVAT)
        + ";"
        + string(item.myStamp)
        + ";"
    );
    
    ds_stack_push(stack,event);
}
