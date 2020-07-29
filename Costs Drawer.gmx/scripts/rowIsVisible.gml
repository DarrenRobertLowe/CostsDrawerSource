/// rowIsVisible(row)
var rowHeight = global.rowHeight;

var startRow    = floor(view_yview[0] / global.rowHeight);
var rows        = ( ( view_hview[0] - global.pageStart ) / rowHeight);
var endRow      = ceil(startRow + rows);


if  (argument0 >= startRow)
and (argument0 <= endRow)
{
    return true;
}
else return false;
