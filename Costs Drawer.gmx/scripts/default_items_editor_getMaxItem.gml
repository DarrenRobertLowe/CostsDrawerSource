// default_items_editor_getMaxItem();
//var array = argument0;
var size            = array_height_2d(array);
var lastItemTarget  = (startingIndex + maxItemsShowable);
var maxItem         = min(lastItemTarget, size);

return maxItem;
