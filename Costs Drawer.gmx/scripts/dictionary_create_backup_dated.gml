/// dictionary_create_backup_dated()
/* @Return file id or -1
 * Creates a backup file of the current global.USER_DICTIONARY
 * with a timestamp in the name.
*/

var appdata     = get_appdata_folder();
var folder      = (appdata +"\dictionaries\backups\");
var fileList    = ds_list_create();
var file        = -1;
var fileCount   = 0;
var cutoffDays  = 7; // delete files older than this many days



/// CREATE A BACKUP
show_debug_message("Creating a backup of dictionary");
var dd  = string(date_get_day   (date_current_datetime()));
var mm  = string(date_get_month (date_current_datetime()));
var yy  = string(date_get_year  (date_current_datetime()));
var hh  = string(date_get_hour  (date_current_datetime()));
var mn  = string(date_get_minute(date_current_datetime()));
var ss  = string(date_get_second(date_current_datetime()));


// create the filename
var fname = string("backup_dictionary_" +yy+"-" +mm+"-" +dd+"-" +hh+"-" +mn+"-" +ss +string(".txt"));

// create the file
file = file_text_open_write(working_directory +"dictionaries\backups\" +fname);
file_text_close(file);


// COPY USER WORDS TO FILE
var filePath = (working_directory +"dictionaries\backups\" +fname);
if file_exists(filePath)
{
    file = file_text_open_write(filePath);
    
    var list = global.USER_DICTIONARY;
    var size = ds_list_size(list);
    var lastItem = (size-1);
    for(var i=0; i<size; i++)
    {
        var wrd = ds_list_find_value(list,i);
        file_text_write_string(file,wrd);
        if (i < lastItem) then file_text_writeln(file); // don't write a new line on the last item
    }
    
    file_text_close(file);
}
else
{
    show_debug_message("dictionary_create_backup() says file does not exist!");
}


// CLEAN UP
ds_list_destroy(fileList);

return file;
