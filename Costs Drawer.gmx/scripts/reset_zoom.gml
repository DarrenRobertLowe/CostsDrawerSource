var center      = ( view_yview[0] + (view_hview[0]/2) );
var currentRow  = getRowFromY(center);

global.scale = 1;

with (MASTER)
{
    set_relative_positions();
}

/* reposition the scrollbar*/
with(SCROLLBAR_H)
{
    x = scrollAreaStartX;
    get_view_x_from_scrollbar();
}

view_jump_to_row(currentRow);
