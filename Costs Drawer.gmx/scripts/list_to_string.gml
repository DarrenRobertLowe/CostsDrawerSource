/// list_to_string(list)
/* returns string
 *
 * Used by firstPage_Address draw event
*/

var list = argument0;

var size = ds_list_size(list);

var str = "";

for(i=0; i<size; i++)
{
    str += ds_list_find_value(list,i);  // copy the value
    str += "#";                         // add a new line
}

return str;
