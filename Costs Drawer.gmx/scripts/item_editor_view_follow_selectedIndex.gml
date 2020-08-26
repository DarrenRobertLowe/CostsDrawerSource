///item_editor_view_follow_selectedIndex();

if (indexSelected < startingIndex)
  then startingIndex = indexSelected;
  
if (indexSelected >= (startingIndex + maxItemsShowable))
  then startingIndex++;
