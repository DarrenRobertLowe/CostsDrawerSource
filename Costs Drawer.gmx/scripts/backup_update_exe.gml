///update_backup_exe()
/* returns void
 *
 * Creates a new backup file after deleting any old one.
 * Note that the backup file gets created in the 
 * "%localappdata%\costs_drawer\" folder, not in the
 * source folder.
*/

var filepathBackup      = (PROGRAM_APPDATA + "\backup");
var filepathOriginal    = (program_directory + EXE_NAME_EXT)


/// delete any existing backup file first so we can move a new one in
write_log("Looking for existing backup file at "+string(filepathBackup));
if (file_exists(filepathBackup))
{
    write_log("Attempting to delete old backup exe file at "+string(filepathBackup) +"...");
    
    file_delete(filepathBackup);
    
    if (file_exists(filepathBackup))
    {
        write_log("Failed to delete old backup exe file at "+string(filepathBackup) +"...");
    }
    else
    {
        write_log("Backup file deleted successfully!");
    }
}
else
{
    write_log("No backup file found.");
}


/// create a new backup
write_log("Looking for existing exe at "+string(filepathOriginal));

if (file_exists(filepathOriginal))
{
    file_copy_win(filepathOriginal, filepathBackup);
    write_log("Created a copy of "+string(filepathBackup)+" as backup");
}
else
{
    write_log("No original exe found!");
}
