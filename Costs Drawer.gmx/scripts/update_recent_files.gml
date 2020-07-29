///update_recent_files(file path)
filename = argument0;
//show_message("global.user_filename = " +string(global.USER_FILENAME));
var list = MASTER.recentFiles;
var file;


if file_exists("recent_files.txt")
{
    // read the .txt to a list to check if we already have the file
    file = file_text_open_read(working_directory + "\recent_files.txt");
    
    
    /// copy the recent_files.txt to a list
    ds_list_clear(list);
    while !(file_text_eof(file))
    {
        var str;
        str = file_text_read_string(file);
        ds_list_add(list,str);
        file_text_readln(file);
    }
}

// delete the recent_files.txt, we'll recreate it at the end.
if file_exists(file) then file_delete("recent_files.txt");



/// check for the file in the existing recent files list...
var value;

for(var i=0; i<ds_list_size(list); i++)
{
    // remove the file from the list if it's in there
    value = ds_list_find_value(list,i);
    if (value == filename) then ds_list_delete(list,i);
}


if (filename != "start") then ds_list_insert(list,0,filename); // add our filename to the TOP of the list


/// write the list of file paths to a new recent_files.txt
file = file_text_open_write(working_directory + "\recent_files.txt");

for(var i=0; i<ds_list_size(list); i++)
{
    value = ds_list_find_value(list,i);
    file_text_write_string(file,value);
    file_text_writeln(file);
}

/// close the file.
file_text_close(file);
