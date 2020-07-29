/// getRowFromY(y pos)
/* Returns INT
 *
 * argument0 = a y position
 *
 * Calculates the row from the given y position
 * e.g. row = getRowFromY(quantumYPosition)
 * 
 * Used by find_warnings()
*/

/// WARNING! THIS DOES NOT WORK CORRECTLY! THE MATH IS WRONG!!
/// NEEDS TO INCORPORATE global.scale BY THE LOOKS OF IT?

var     row = floor( ( (argument0-global.pageStart) / global.rowHeight) );
return  row +1;
