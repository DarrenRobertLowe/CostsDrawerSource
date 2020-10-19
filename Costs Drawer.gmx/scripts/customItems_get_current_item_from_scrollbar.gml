/// customItems_get_current_item_from_scrollbar()

var scrollableDistance  = (scrollAreaHeight - height);  // height being the height of the draggable bit
var pixelPosition       = (y - scrollAreaStartY);
var percentagePosition  = (pixelPosition / scrollableDistance);

return round(editor.listSize * percentagePosition);
