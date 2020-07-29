/// check_for_old_backup_files();
//var appdata         = environment_get_variable("LOCALAPPDATA") + "\";
//var progam_name     = string_replace(game_display_name," ","_");
//var appdataFolder   = string(appdata) + progam_name;
//var backupsFolder   = string(appdata) + progam_name + "\backups";

var backupsFolder = (PROGRAM_APPDATA + "\backups");
var fileList = ds_list_create();

if (directory_exists(backupsFolder))
{
    file = file_find_first(string(backupsFolder) + "\*.bak", 0 );
    
    while (file != "") // see file_find_next() at end of loop
    {
        // get pos of last "_"
        var len = string_length(file);
        var pos;
        
        for (pos=len; pos > 0; pos--)
        {
            var char = string_char_at(file, pos);
            if (char == "_") then break;
        }
        
        // our date starts at pos    e.g. 20-10-2019-17-30-32
        var dateStr = string_copy(file,pos+1,len);
        var dashPos = 0;
        
        // day
        var r = 0;
        
        repeat (3)
        {
            dashPos = string_pos("-",dateStr);
            
            if (dashPos == 0) then dashPos = string_pos(".",dateStr);
            
            var str = 0;
            str = string_copy(dateStr,1,dashPos-1);
            dateStr = string_delete(dateStr,1,dashPos);
            
            if (r == 0) then dayStr     = str;
            if (r == 1) then monthStr   = str;
            if (r == 2) then yearStr    = str;
    
            r++;
        }
        
        // compare each file to current date and time
        var diff = date_day_span(date_create_datetime(yearStr, monthStr, dayStr, 1, 1, 1), date_current_datetime());
    
        if ( diff > backupFileDateLimit )
        {
            //show_message("we found : " +string(file));
            ds_list_add(fileList,file);     // add to the list for deletion
        }
    
        file = file_find_next();
    }
}
else show_message("Couldn't find backups directory!");


// DELETE THE FILES
var size = ds_list_size(fileList);
if (size > 0)
{
    if ( show_question("Backup .cdf files older than "+string(backupFileDateLimit) +" days were found.#Would you like to delete these?") )
    {
        for (i=0; i<size; i++)
        {
            var val = ds_list_find_value(fileList,i);
            val = ( string(backupsFolder) +"\" +string(val) );
            
            if file_exists(val) then file_delete(val);
        }
        /// create the new target date for prompting
        backups_create_date_for_deletion();
    }
    else // THE USER PRESSED 'NO'
    {
        /// create the new target date for prompting
        backups_create_date_for_deletion();
    }
}


// CLEAN UP
if ds_exists(fileList,ds_type_list) then ds_list_destroy(fileList);
