/// mouseClickOutsideArea(x1,y1,x2,y2)
/* Checks to see if the user has clicked OUTSIDE of
 * the given area.
 *
 * Returns true/false
 * 
 * Condition:
 * Used by USER_ITEM to escape editing a description by clicking
 * outside of the description field.
*/

x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3; // wtf! this originally said (y1 = argument3)!!


if mouse_check_button(mb_left)
{
    if mouse_x > x2
    or mouse_x < x1
    or mouse_y > y2
    or mouse_y < y1
    {
        return true;
    }
    else return false;
}
else return false;
