/// setup_recentFile();

// GET AROUND SANDBOXING BY COPYING FILE TO APPDATA AS "temp"
// delete old temp file just in case
var filePath = (appdataFolder + "\temp");
if (file_exists(filePath))
  then file_delete(filePath);


/* if the file exists in any directory (including program directory), we'll copy
 * it to filePath (i.e. "temp" file in appdata folder) 
 * So if the file existed in the root directory, it also exists now as filePath.
 * Or if it didn't exist, filePath will remain blank.
 */
if ( file_exists(fileFromList) )
  then file_copy_win(fileFromList, filePath);


// HOTFIX: get's around "file not found" issue when a file was saved to program directory (21-Jun-2020)
fileFromList = recentFiles_change_filepath_if_programDirectory(fileFromList);

// replace "temp" file if the target file is found in the appdata folder
if ( file_exists(fileFromList) )
  then file_copy_win(fileFromList, filePath);



// Waiting for file to load...
while !(file_exists(filePath)) // while !(file_exists(filePath))
{
    window_set_cursor(cr_hourglass);
    recentFilesTimer--;                                                 // wait a few seconds for the file to exist
    
    if (recentFilesTimer <= 0) // file not found at location
    {
        window_set_cursor(cr_default)
    
        // FILE NOT FOUND
        if (show_question("FILE NOT FOUND! Remove from list?"))
        {
            // if the user chooses to remove the file from the list...
            ds_list_delete(list,i);                                     // delete the list entry
            
            var filePath = (appdataFolder + "\recent_files.txt");       // find the recent_files.txt
            if file_exists(filePath) then file_delete(filePath);        // delete it
            
            var fileR;
            fileR = file_text_open_write(working_directory+"\recent_files.txt");           // create a new recent_files.txt
            for(var n=0; n<ds_list_size(list); n++)                     // iterate through our list
            {
                var value = ds_list_find_value(list,n);
                file_text_write_string(fileR,value);                    // write each filePath to the recent_files.txt
                file_text_writeln(fileR);
            }
            file_text_close(fileR);
        }
        
        recentFilesTimer = recentFilesTimerDefault;
        exit;
    }
}
