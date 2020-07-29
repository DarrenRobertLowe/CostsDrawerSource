/// tooltip(str)
if ( TOOLTIPS.previousTooltipsString != argument0)  // if the string has changed
or ( TOOLTIPS.targetID != id)                       // or the item has changed
{
    TOOLTIPS.hoverTime = tooltip_start_timer();     // update the timer
    TOOLTIPS.targetID = id;                         // update the item id
}

TOOLTIPS.target = argument0;
TOOLTIPS.active = true;
TOOLTIPS.alarm[0] = 1;

TOOLTIPS.previousTooltipsString = argument0;

with (TOOLTIPS)
{
    ds_list_clear(descriptionList);
    ds_list_add(descriptionList,  string(argument0));
}
