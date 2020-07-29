/// set_unsaved();

//show_debug_message("called by "+string(object_index) +" " +string(object_get_name(object_index)));
global.UNSAVED = true;

window_set_caption("*" + global.FILENAME + " - Costs Drawer");

global.documentHeight = (global.totalRows * global.rowHeight);  // update the document height for scrolling


if instance_exists(WARNINGS_MASTER) then WARNINGS_MASTER.alarm[0] = 1;     // update warnings

global.allowBackup = true; // allows a backup to be created now that something has changed


/*
/// autosave every change?
if  (MASTER.saveBackup == true)
and (global.autosave_backup_every_change == true)
{
    save_backup(); // could be slow
}
*/

global.SHOW_WARNINGS = true;
global.PRINT_VIEW = false;


MASTER.alarm[10] = 10; // count_folios();

if exists(SEARCH_TEXT)
{
    with (SEARCH_TEXT)
    {
        if ds_exists(searchResults, ds_type_list)
        {
            event_user(0);
        }
    }
}
