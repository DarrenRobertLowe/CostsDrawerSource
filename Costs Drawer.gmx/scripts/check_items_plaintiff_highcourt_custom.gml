/// check_items_plaintiff_highcourt_custom()
/*
 * Here we add the custom items to the list.
 *
 * See also:
 * create_COMMON_ITEM()
*/

var array = global.arrayOfHighCourtCustomItemValues;
var size  = array_height_2d(array);

for (var i=0; i<size; i++)
{
    var name = array[i,0];
    ds_list_add(global.COMMON_ITEMS, name);
}
