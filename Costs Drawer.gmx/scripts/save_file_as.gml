///save_file_as()
/* Asks the user to give a save location and file name. 
 * The full filename will be used when hitting "Save".
 * The directory will be saved for future "Save File As" convenience.
*/

var oldName = global.USER_FILENAME;
global.USER_FILENAME = get_save_filename_ext("Costs Drawing File|*.cdf", global.USER_FILENAME, global.USER_DIRECTORY, "Save Costs File As...");

//show_message("global.USER_FILENAME = "+string(global.USER_FILENAME));
// do not allow saving to program_directory
if (get_directory(global.USER_FILENAME) == program_directory)
{
    show_message("Cannot save to Costs Drawer folder, please choose another directory.");
    save_file_as();
    exit;
}

if (global.USER_FILENAME != "")
{
    // get just the directory so subsequent "Save File As" runs will start in the same place.
    var char;
    for(var i=string_length(global.USER_FILENAME); i>0; i--)                    // iterate backwards through string
    {
        char = string_char_at(global.USER_FILENAME,i);
        
        if (char == "\")
        {
            global.USER_DIRECTORY = string_copy(global.USER_FILENAME,1,i);      // directoy is the string as far as the last "\"#
            var len = string_length(global.USER_FILENAME);
            global.FILENAME       = string_copy(global.USER_FILENAME,i+1,len);  // just the file name is the string after the last "\"
            i = 0;                                                              // stop looping
        }
    }
    
    
    writeFile(global.USER_FILENAME);                                                                // write to the file
    update_recent_files(global.USER_FILENAME);          // add to recent files list
    global.SAVED_AS = true;
}
else{
    // the user cancelled so revert the file name back to the old one
    global.USER_FILENAME = oldName;
}
