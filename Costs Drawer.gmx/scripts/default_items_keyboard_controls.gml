///default_items_keyboard_controls();

if keyboard_check_pressed(vk_up)
{
    indexSelected--;
    indexSelected = max(0, indexSelected);
}

if keyboard_check_pressed(vk_down)
{
    
    indexSelected++;
    indexSelected = min(lastIndex, indexSelected);
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


