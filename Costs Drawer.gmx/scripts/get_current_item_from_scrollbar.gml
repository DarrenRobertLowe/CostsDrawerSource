/// get_current_item_from_scrollbar(H scrollbar shown?)

/* first we find what percentage the scrollbar is down the scoll area. */
var scrollbarShown      = argument0;
var scrollableDistance  = (scrollAreaHeight - height);                   // example: scrollable distance is 450 if the bar itself is 100 pixels and the area is 550.
var pixelPosition       = (y - scrollAreaStartY);
var percentagePosition  = (pixelPosition / scrollableDistance);

// translate the percentage to the number
var adjustedTotal = ((size - maxShown) + scrollbarShown);         // otherwise we get a window's worth of whitespace at the bottom of the list.
return round(adjustedTotal * percentagePosition);

