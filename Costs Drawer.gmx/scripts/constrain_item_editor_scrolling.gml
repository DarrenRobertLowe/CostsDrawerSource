/// constrain_item_editor_scrolling();

var size = array_height_2d(array);
var lastScrollableItem = ((size - maxItemsShowable) +1);

show_debug_message("lastScrollableItem = " +string(lastScrollableItem));
startingIndex = min(startingIndex, lastScrollableItem);

if (startingIndex < 0) then startingIndex = 0;
