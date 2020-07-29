/// seeFeeLaterCheck2()

seeFeeLater = true;

var list  = global.listOfItems;
var index = ds_list_find_index(list,id)

var nextItem = ds_list_find_value(list,index+1)

if (exists(nextItem))
{
    if (nextItem.object_index == TOTALS)
    then nextItem = ds_list_find_value(list,index+3);
    
    if (nextItem.object_index == PAGE_NUMBER)
    then nextItem = ds_list_find_value(list,index+2);
    
    // This is so paragraphed items don't draw "see fee later"
    if  (nextItem.object_index != BUTTON_CreateNewItem)
    and (nextItem.countMyItemNumber == false)
    {
        if (nextItem.object_index != item_WHITESPACE) // an exception for whitespace as they act like paragraphed items
        then seeFeeLater = false;
    }
}


if (outlay > 0)
or (professional > 0)
or (outlayText = "-.--")
or (professionalText = "-.--")
or (instructionsFee == false)
{
    seeFeeLater = false;
}
