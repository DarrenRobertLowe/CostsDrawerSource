///clear_old_update_files();
/* Deletes oldExe and self_updater_UPDATE
 *
 * If it can't delete them it renames them instead,
 * allowing for the creation of new files of the
 * same name. 
*/

var targetPath          = (program_directory +"\");
var oldFile             = (string(targetPath) + "oldExe");
var localappdataFolder  = PROGRAM_APPDATA;  ////(string(appdata) + localappdata_program_name)
var batchFile           = "";
var batchFullPath       = "";


// get datetime in case we need it
var cSecond  = date_get_second(date_current_datetime());
var cMinute  = date_get_minute(date_current_datetime());
var cHour    = date_get_hour(date_current_datetime());
var cDay     = date_get_day(date_current_datetime()); 
var cMonth   = date_get_month(date_current_datetime());
var cYear    = date_get_year(date_current_datetime());
var datetime = round(date_create_datetime(cYear, cMonth, cDay, cHour, cMinute, cSecond));


/// delete old self_updater_UPDATE file
var oldUpdateFile = TEMP_UPDATE_FILENAME; //e.g. "update.exe"


if ( file_exists(oldUpdateFile) )
{
    file_delete(oldUpdateFile);
    show_debug_message("Old self update file found, delete attempted.");
    write_log("Old self update file found, delete attempted.")
    
    if ( file_exists(oldUpdateFile) )
    {
        show_debug_message("Could not delete old update file");
        write_log("Could not delete old update file");
        
        /// try renaming
        if file_exists("rnouf.bat") then file_delete("rnouf.bat")
        
        batchFile = file_text_open_write("rnouf.bat");
        
        file_text_write_string(batchFile, "@echo off");
        file_text_writeln(batchFile);
        file_text_write_string(batchFile, 'cd "' +string(localappdataFolder) +'"');
        file_text_writeln(batchFile);
        file_text_write_string(batchFile, 'ren '+string(oldUpdateFile)+' "oldUpdate' +string(datetime) +'"');
        file_text_close(batchFile);
        
        
        batchFullPath = (localappdataFolder + "\rnouf.bat");
        if file_exists("rnouf.bat")
        then shell_execute(batchFullPath, 0);
    }
    else
    {
        show_debug_message("Old update file deleted!");
        write_log("Successfully deleted old update file!");
    }
}
else show_debug_message("No previous update files found, no need to delete anything.");



// DELETE oldExe file
batchFullPath = (localappdataFolder + "\del.bat");

timeLimit = ( (get_timer()/1000) + 3000);
while file_exists("del.bat")
{
    file_delete("del.bat");
    
    if ( (get_timer()/1000) > timeLimit)
    {
        show_debug_message("Cannot delete batch files; Access Denied!");
        write_log("Cannot delete batch files; Access Denied!");
        exit;
    }
    
    show_debug_message("Ran batch file to delete old del.bat file.");
    write_log("Ran batch file to delete old del.bat file.");
}

if !(file_exists(batchFullPath))
{
    batchFile = file_text_open_write("del.bat");
    
    file_text_write_string(batchFile, "@echo off");
    file_text_writeln(batchFile);
    file_text_write_string(batchFile, 'cd "' +string(targetPath) +'"');
    file_text_writeln(batchFile);
    file_text_write_string(batchFile, 'del /q "oldExe"');
    file_text_close(batchFile);
}
else show_debug_message("del.bat already exists. Continuing...");


timeLimit = ( (get_timer()/1000) + 3000);
while !(file_exists("del.bat"))
{
    if ( (get_timer()/1000) > timeLimit )
    {
        show_debug_message(string(batchFullPath) + " NOT FOUND!");
        write_log(string(batchFullPath) + " NOT FOUND!");
        exit;
    }
}


if file_exists(batchFullPath)
{
    shell_execute(batchFullPath, 0);
    show_debug_message("Ran batch file to delete oldExe file.");
    write_log("Ran batch file to delete oldExe file.");
    // check if the file still exists
    if file_exists( oldFile )
    {
        /// if it does, try to rename it instead
        if file_exists("ren.bat") then file_delete("ren.bat")
        
        batchFile = file_text_open_write("ren.bat");
        
        file_text_write_string(batchFile, "@echo off");
        file_text_writeln(batchFile);
        file_text_write_string(batchFile, 'cd "' +string(targetPath) +'"');
        file_text_writeln(batchFile);
        file_text_write_string(batchFile, 'ren "oldExe" "oldExe' +string(datetime) +'"');
        file_text_close(batchFile);
        
        
        timeLimit = ( (get_timer()/1000) + 3000 );
        while !(file_exists("ren.bat"))
        {
            if ((get_timer()/1000) > timeLimit)
            {
                show_debug_message("Cannot find ren.bat file; Access Denied?");
                write_log("Cannot find ren.bat file; Access Denied?");
                exit;
            }
        }
        
        if file_exists("ren.bat")
        {
            batchFullPath = (localappdataFolder + "\ren.bat");
            shell_execute(batchFullPath,0);
            show_debug_message("Ran batch file to rename oldExe file.");
            write_log("Ran batch file to rename oldExe file.");
        }
    }
}
else show_message(string(batchFullPath) + " NOT FOUND!");


//show_message("batchFullPath: "+string(batchFullPath));
