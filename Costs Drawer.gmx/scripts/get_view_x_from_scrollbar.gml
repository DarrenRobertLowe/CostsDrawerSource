///get_view_x_from_scrollbar()

// find how far along the bar is in percent
var scrollableDistance  = (scrollAreaWidth - width);                    // e.g. scrollable distance is 450 if the bar itself is 100 pixels and the area is 550.
var pixelPosition       = (x - scrollAreaStartX);
var percentagePosition  = (pixelPosition / scrollableDistance);

//var rightColumn = (view_wview[0] - scrollAreaWidth) // this works best even though it's wrong.

var adjustedView = (view_wview[0] - global.right_column_width);
var adjustedDocumentWidth = ((documentWidth*global.scale)-adjustedView);

view_xview[0] = round(adjustedDocumentWidth * percentagePosition);  // otherwise we get a window's worth of whitespace at the end.

