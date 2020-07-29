/// combine_lists(list1, list2)
// returns list1
/* WARNING: This script appends list2 to list1.
 * It RETURNS the ORIGINAL list, modified!
 * NOT A COPY!
*/

var list1 = argument0;
var list2 = argument1;

var size = ds_list_size(list2);

for(var i=0; i<size; i++)
{
    var litem = ds_list_find_value(list2,i);
    
    ds_list_add(list1,litem);
}

return(list1);
