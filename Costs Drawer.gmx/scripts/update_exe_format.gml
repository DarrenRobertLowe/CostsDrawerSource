/// update_exe_format()
/* DO NOT USE! WE MUST USE INSTALLER EXCLUSIVELY, DUE TO
 * INCLUDED FILES SUCH AS TEMPLATES AND VBS SCRIPT!
*/

debug_message("Finished downloading update.");

reset_download_transferSpeed_array();

var downloadedExe   = ds_map_find_value(async_load, "result"); // note: should be (appdataFolder + TEMP_UPDATE_FILENAME)
var appdataFolder   = PROGRAM_APPDATA;

if (file_exists(downloadedExe))
{
    debug_message("UPDATING: stage 1");
    
    var programFolder   = program_directory;
    var originalExe     = (string(programFolder) + "\" + EXE_NAME_EXT);
    
    
        debug_message("creating ren.bat file");
        var batchFile = file_text_open_write("ren.bat");
        
        file_text_write_string(batchFile, "@echo off");
        file_text_writeln(batchFile);
        file_text_write_string(batchFile, 'cd "' +string(programFolder) +'"');
        file_text_writeln(batchFile);
        file_text_write_string(batchFile, 'ren "'+string(EXE_NAME_EXT) +' "oldExe"');
        file_text_close(batchFile);
        
        
        // wait for the file to exist...
        timeLimit = ( (get_timer()/1000) + 3000 );
        var batchFullPath = (appdataFolder + "\ren.bat");
        
        while !(file_exists("ren.bat"))
        {
            if ( (get_timer()/1000) > timeLimit )
            {
                write_log("Failed to find "+string(batchFullPath)+".  Abandoning update!");
                updateStatus = 0;
                exit;
            }
        }
        
        if ( file_exists("ren.bat") )
        {
            debug_message("running ren.bat");
            shell_execute(batchFullPath, "");
        }
        
        
        var oldExe = (string(programFolder) + "\oldExe");

        
        /// COPY DOWNLOADED EXE FILE TO PROGRAM DIRECTORY AND CALL IT "costs drawer.exe"
        debug_message("UPDATING: stage 2");
            debug_message("Successfully renamed the file to oldExe");
            debug_message("Attempting to copy "+string(downloadedExe) +" to "+string(originalExe));
            debug_message("creating moveUpdate.bat file");
            
            
            var batchFile = file_text_open_write("moveUpdate.bat");
            file_text_write_string(batchFile, "@echo off");
            file_text_writeln(batchFile);
            file_text_write_string(batchFile,'xcopy /I /Y "'+string(downloadedExe)+'" "'+string(originalExe)+'*"');
            file_text_close(batchFile);
            
            
            // wait for the file to exist...
            var batchFullPath = (appdataFolder + "\moveUpdate.bat");
            timeLimit = ( (get_timer()/1000) + 3000 );
            
            while !(file_exists("moveUpdate.bat"))
            {
                if ( (get_timer()/1000) > timeLimit )
                {
                    write_log("Failed to find "+string(batchFullPath)+".  Abandoning update!");
                    updateStatus = 0;
                    exit;
                }
            }
            
            if ( file_exists("moveUpdate.bat") )
            {
                debug_message("running moveUpdate.bat");
                shell_execute(batchFullPath, "");
            }
            
            
            if (file_exists(originalExe))
            {
                debug_message("UPDATE SUCCESSFUL! Costs Drawer needs to be restarted for changes to take effect.");
                write_log("UPDATE SUCCESSFUL! Costs Drawer needs to be restarted for changes to take effect.");
                exit;
            }
}
else
{
    show_message( "downloaded file not found with result: "+string(downloadedExe) );
}
