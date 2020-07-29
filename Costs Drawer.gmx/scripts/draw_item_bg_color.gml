/// draw_item_bg_color()
minLines = ds_list_size(descriptionList)-1;

if (object_index != USER_ITEM)
and (global.PRINT_VIEW == false)
{
    draw_set_alpha(.3);
    draw_set_color( global.preProgrammedItemBGColor );
    draw_rectangle(global.dateColumnX, textPosY-rowHeight, global.hColumnX, textPosY + (minLines*rowHeight), false)
    draw_set_alpha(1);
}
