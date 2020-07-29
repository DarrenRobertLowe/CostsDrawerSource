///delete_old_dictionary_txt();
/* Deletes the old dictionary.txt file.
*/

var batchFile       = "";
var batchFullPath   = "";

/// if it does, try to rename it instead
var batchFileName = "delDict.bat";
if file_exists("delDict.bat") then file_delete("delDict.bat")

var batchFile = file_text_open_write("delDict.bat");

file_text_write_string(batchFile, "@echo off");
file_text_writeln(batchFile);
file_text_write_string(batchFile, 'cd "' +string(program_directory) +'"');
file_text_writeln(batchFile);
file_text_write_string(batchFile, 'del /q "dictionary.txt"');
file_text_close(batchFile);


var timeLimit = ( (get_timer()/1000) + 3000 );
while !file_exists(batchFileName)
{
    if ((get_timer()/1000) > timeLimit)
    {
        show_debug_message("Cannot find "+string(batchFileName) +" file; Access Denied?");
        write_log("Cannot find "+string(batchFileName) +" file; Access Denied?");
        exit;
    }
}

if file_exists(batchFileName)
{
    batchFullPath = (PROGRAM_APPDATA +"\" +string(batchFileName));
    shell_execute(batchFullPath, 0);
    show_debug_message("Ran batch file to delete old dictionary.txt");
    write_log("Ran batch file to delete old dictionary.txt");
}

