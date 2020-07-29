/// getPageNumberFromRow(row);
/* argument0 : the row number to convert to a pageNumber
 *
 * Returns INT
*/

var row = argument0;
return ceil(row / global.rowsPerPage)
