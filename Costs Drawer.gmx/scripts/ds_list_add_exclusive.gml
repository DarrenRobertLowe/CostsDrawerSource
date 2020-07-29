///ds_list_add_exclusive(list,value)
/* returns void
 *
 * Takes the given list and searches it for the given value.
 * Then, if the value is not found, it will add it to the list.
*/


var list  = argument0;
var value = argument1;

var pos = ds_list_find_index(list,value);

if (pos == -1) then ds_list_add(list,value);
