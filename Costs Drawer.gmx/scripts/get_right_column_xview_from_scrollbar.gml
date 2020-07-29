///get_right_column_xview_from_scrollbar()

// find how far along the bar is in percent
var scrollableDistance  = (scrollAreaWidth - width);                // e.g. scrollable distance is 450 if the bar itself is 100 pixels and the area is 550.
var pixelPosition       = (x - scrollAreaStartX);
var percentagePosition  = (pixelPosition / scrollableDistance);

// translate the percentage to the character
var charWidth           = global.estimatedCharacterWidth;           // the width of a single character (estimated)
var maxChars            = (scrollAreaWidth / charWidth)
var adjustedLength      = (textLength - (maxChars-2));              // otherwise we get a window's worth of whitespace at the end.

return round(adjustedLength * percentagePosition);
