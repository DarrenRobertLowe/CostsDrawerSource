/// xlsx_item_description_is_irregular()


var item = argument0;

if (item.object_index == BUTTON_CreateNewItem)
or (item.object_index == lastPage_drawingCostsAndCopy)
or (item.object_index == WITNESS)
or (item.object_index == lastPage_SUBTOTAL)             // item should not show a description
or (item.object_index == lastPage_OutlayToTotal)        // item should not show a description
or (item.object_index == lastPage_DatedSignature)
or (item.object_index == lastPage_Address)
or (item.object_index == lastPage_VATNumbers)
or (item.object_index == lastPage_drawingCostsAndCopy)
or (item.object_index == TOTALS)
{
    return true;
}
else return false;
