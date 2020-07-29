var center = ( view_yview[0] + (view_hview[0]/2) );
currentRow = getRowFromY(center);


if (global.scale > 1)       then global.scale -= .5;
else if (global.scale > .5) then global.scale -= .25;


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

view_yview[0] = floor(view_yview[0]);
