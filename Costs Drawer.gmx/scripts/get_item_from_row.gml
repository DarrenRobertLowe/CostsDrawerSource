/// get_item_from_row(row);
/* Returns the ID of the item that
 * intersects the given row, or 0
 * if no item intersects that row.
*/
var success = 0;
var list = global.listOfItems;

for(var i=0; i<list; i++)
{
    var item = ds_list_find_value(list,i);
    var lines = item.lines;
    
    if  argument0 >= item.row
    and argument0 <= (item.row + item.lines)
    then success = item.id;
}

return success
