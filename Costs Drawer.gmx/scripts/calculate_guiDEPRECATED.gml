/// calculate_gui()

if (view_xview[0] != old_xview)
or (view_yview[0] != old_yview)
or (view_wview[0] != old_wview)
or (view_hview[0] != old_hview)
or (right_column_x != old_right_column_x)
{
    viewX        = view_xview[0];
    viewY        = view_yview[0];
    viewW        = view_wview[0];
    viewH        = view_hview[0];
    guiEndX      = (viewX + page_area_width);
    rightColEndX = (viewX + windowWidth);
    windowEndY   = (viewY + windowHeight);
    footerY      = (viewY + (windowHeight - guiFooterHeight));
    
    old_xview = viewX;
    old_yview = viewY;
    old_wview = viewW;
    old_hview = viewH;
    old_right_column_x = right_column_x;
}
