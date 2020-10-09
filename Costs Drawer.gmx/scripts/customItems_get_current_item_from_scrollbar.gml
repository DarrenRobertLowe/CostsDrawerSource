/// customItems_get_current_item_from_scrollbar()

var scrollableDistance  = (scrollAreaHeight - height);              // example: scrollable distance is 450 if the bar itself is 100 pixels and the area is 550.
var pixelPosition       = (y - scrollAreaStartY);
var percentagePosition  = (pixelPosition / scrollableDistance);
show_debug_message("percentagePosition = " +string(percentagePosition));

// translate the percentage to the number
//var adjustedTotal = (editor.size - editor.maxItemVisible);          // otherwise we get a window's worth of whitespace at the bottom of the list.
return round(editor.size * percentagePosition);//adjustedTotal * percentagePosition);

