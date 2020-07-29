/// clear_dictionary_backups();
/* @Return void
 * Deletes dictionary backups older than a given date.
*/

var file;

var dd  = string(date_get_day   (date_current_datetime()));
var mm  = string(date_get_month (date_current_datetime()));
var yy  = string(date_get_year  (date_current_datetime()));
var hh  = string(date_get_hour  (date_current_datetime()));
var mn  = string(date_get_minute(date_current_datetime()));
var ss  = string(date_get_second(date_current_datetime()));

var currentDate = date_create_datetime(yy,mm,dd,hh,mm,ss);

var appdata = get_appdata_folder();

// Go through every file in the folder and add their names to the list
var fileList    = ds_list_create();
var file        = "";
var fileCount   = 0;
var folder      = (appdata +"\dictionaries\backups\");
var cutoffDays  = 7;                            // delete files older than this many days


// add the first file
if directory_exists(appdata +"\dictionaries\backups")
{
    file = file_find_first(folder + "*.txt", 0);

    if (file == "")
    {
        show_debug_message("no backup dictionaries found!");
        write_log("No backup dictionaries found!");
    }
    else
    {
        ds_list_add(fileList,folder + file);
        fileCount++;
    }
}
else 
{
    show_debug_message("dictionaries folder not found!");
    write_log("dictionaries folder not found!");
}
    


// add the rest of the files
while (file != "")
{
    file = file_find_next();
    
    if (file != "")
    {
        ds_list_add(fileList,string(folder) + string(file));
        fileCount++;
    }
}


show_debug_message("No more dictionary backup files found. Count is " +string(fileCount));
write_log("No more dictionary backup files found. Count is " +string(fileCount));

/* SORT the list and remove the first entry, 
 * as that should be the newest backup file.
*/
ds_list_sort(fileList, false);

var leave = ds_list_find_value(fileList, 0);
show_debug_message("We'll keep "+string(leave) +", as it's the most recent");


ds_list_delete(fileList,0);


// DELETION
if (fileCount > 1)
{
    // get the name of each file, and if it's too old, delete that file.
    var startText   = "backup_dictionary_";
    var endText     = ".txt";
    var list = fileList;
    var size = ds_list_size(list);
    
    for (var i=0; i<size; i++)
    {
        var item = ds_list_find_value(list, i);
        
        show_debug_message("target dictionary backup filename is "+string(item));
        
        if ( file_exists(item) )
        {
            // trim the name down to just the date
            var dateStr = string_replace(item,folder,"");
            var dateStr = string_replace(dateStr,startText,"");
            dateStr = string_replace(dateStr,endText,"");
            
            
            // extract the dates
            var c = 0;
            //show_message("dateStr is now "+string(dateStr));
            c = string_pos("-",dateStr);
            var fYY = string_copy(dateStr,1,c);
            fYY = real(string_digits(fYY));
            dateStr = string_delete(dateStr,1,c);
            //show_message("fYY extracted as "+string(fYY));
            
            
            //show_message("dateStr is now "+string(dateStr));
            c = string_pos("-",dateStr);
            var fMN = string_copy(dateStr,1,c);
            fMN = real(string_digits(fMN));
            dateStr = string_delete(dateStr,1,c);
            //show_message("fMN extracted as "+string(fMN));
            
            
            //show_message("dateStr is now "+string(dateStr));
            c = string_pos("-",dateStr);
            var fDD = string_copy(dateStr,1,c);
            fDD = real(string_digits(fDD));
            dateStr = string_delete(dateStr,1,c);
            //show_message("fDD extracted as "+string(fDD));
            
            
            //show_message("dateStr is now "+string(dateStr));
            c = string_pos("-",dateStr);
            var fHH = string_copy(dateStr,1,c);
            fHH = real(string_digits(fHH));
            dateStr = string_delete(dateStr,1,c);
            //show_message("fHH extracted as "+string(fHH));
            
            
            //show_message("dateStr is now "+string(dateStr));
            c = string_pos("-",dateStr);
            var fMM = string_copy(dateStr,1,c);
            fMM = real(string_digits(fMM));
            dateStr = string_delete(dateStr,1,c);
            //show_message("fMM extracted as "+string(fMM));
            
            
            //show_message("dateStr is now "+string(dateStr));
            var fSS = string_copy(dateStr,1,string_length(dateStr));
            fSS = real(string_digits(fSS));
            //show_message("fSS extracted as "+string(fSS));
            
            
            // create a dateTime
            if (fYY > 2018) // 2018 is early than the program's initial release, so there should be no files from before then.
            {
                var fDate = date_create_datetime(fYY,fMN,fDD,fHH,fMM,fSS);
                
                // delete?
                var days  = (date_day_span(currentDate,fDate));
                if (days > cutoffDays)
                {
                    file_delete(item);
                    show_debug_message("deleted backup dictionary file "+string(item));
                }
            }
            else
            {
                show_debug_message("Can't determine when backup file was made. We'll leave it alone.");
                write_log("Can't determine when backup file was made. We'll leave it alone.");
            }
        }
        else
        {
            show_debug_message("we somehow added a non-existing file to our fileList.");
            write_log("we somehow added a non-existing file to our fileList.");
        }
    }
}


// CLEAN UP
file_find_close();
if ( ds_exists(fileList, ds_type_list) ) then ds_list_destroy(fileList);
