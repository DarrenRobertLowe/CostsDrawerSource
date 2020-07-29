/// exists(id)
/* returns bool
 * Just a way to prevent typing repetitive checks.
*/

var item = argument0;

if  !( is_undefined(item) )
and  ( instance_exists(item) )
and  ( item > -1 )
then return true;
else return false;
