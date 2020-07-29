/// docOrg_valid_prevItem(id)
var item = argument0;


if ( is_undefined(item) )
or !(instance_exists(item))
or ( item.object_index == TOTALS )
or ( item.object_index == PAGE_NUMBER )
then return false;
else return true;
