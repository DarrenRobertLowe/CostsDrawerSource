/// check_view_changed()
if (view_xview[0] != old_xview)
or (view_yview[0] != old_yview)
or (view_wview[0] != old_wview)
or (view_hview[0] != old_hview)
{
    old_xview = view_xview[0];
    old_yview = view_yview[0];
    old_wview = view_wview[0];
    old_hview = view_hview[0];
    event_user(0);
}
