///item_editor_view_follow_selectedIndex();

if (indexSelected < startingIndex)
  then startingIndex = indexSelected;
  
if (indexSelected >= maxItemVisible)
  then startingIndex = indexSelected;
