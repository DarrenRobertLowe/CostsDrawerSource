///default_items_keyboard_controls();

if keyboard_check_pressed(vk_up)
{
    indexSelected--;
    indexSelected = max(0, indexSelected);
    
    if (indexSelected < startingIndex)
    then startingIndex = indexSelected;
}


if keyboard_check_pressed(vk_down)
{
    indexSelected++;
    indexSelected = min(lastIndex, indexSelected);
    
    if (indexSelected >= (startingIndex + maxItemsShowable))
    then startingIndex++;
}


if keyboard_check_pressed(vk_left)
{
    fieldSelected--;
    fieldSelected = max(0, fieldSelected);
}

if keyboard_check_pressed(vk_right)
{
    fieldSelected++;
    fieldSelected = min(lastField, fieldSelected);
}


