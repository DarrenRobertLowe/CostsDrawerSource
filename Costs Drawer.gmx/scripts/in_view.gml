/// in_view()
if is_real(row)
{
    ymin = (getYFromRow(row));
    ymax = (ymin + (lines*rowHeight));
    
    if (ymax < view_yview[0])
    or (ymin > (view_yview[0] + view_hview[0]))
    {
        //show_debug_message(string(id) + " is no longer on screen");
        return false;
    }
    else return true;
}
