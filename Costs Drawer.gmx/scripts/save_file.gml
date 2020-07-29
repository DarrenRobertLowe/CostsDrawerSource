/* Due to sandboxing, get_save_filename_ext() must be called before 
 * "Save" will work.
 * This is of course, absolutely stupid. It means that even if the
 * user navigates to OPEN a file manually, they're still not allowed
 * save it without explicit SAVE permission. We might consider using 
 * that external DLL file to get around this, but for the moment we'll
 * simply require the user to have saved with "Save As..." first.
 */

if  (global.USER_FILENAME != "")
and (global.SAVED_AS = true)
{
    writeFile(global.USER_FILENAME);
    update_recent_files(global.USER_FILENAME);          // add to recent files list
}

else save_file_as();
