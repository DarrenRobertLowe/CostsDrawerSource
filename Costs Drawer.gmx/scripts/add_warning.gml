/// add_warning(string,row);
/* returns void
 * Adds the given warning to the global.WARNINGS list 
 * IF AND ONLY IF it is not already on it.
*/

errStr  = "";
var row = argument1;

if  (row != 0)
  then errStr = ( "Row " +string(row) +" : " +argument0 );
  else errStr = argument0;


if (ds_list_find_index(global.WARNINGS, errStr) = -1)   // if you don't find the error in the list already...
{
    ds_list_add(global.WARNINGS, errStr);               // add the error
}


get_width_warnings();                                   // reevaluate the width
