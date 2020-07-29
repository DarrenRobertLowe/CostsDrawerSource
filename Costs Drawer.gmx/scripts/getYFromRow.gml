/// getYFromRow(row)
/* Returns INT
 *
 * argument0 = a row number
 *
 * Calculates the Y position of the given row.
 * 
*/

if !(is_undefined(argument0))
and is_real(argument0)
{
    var yy;
    yy = global.pageStart + (global.rowHeight*(argument0-1)); // -1 because everything is drawn from the top down.... or something.
    return yy;
}
else
{
    return 0;
}
