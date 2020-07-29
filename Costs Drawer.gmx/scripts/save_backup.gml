/// save_backup()
global.SAVING = 1;

var file;

var dd  = string(date_get_day   (date_current_datetime()));
var mm  = string(date_get_month (date_current_datetime()));
var yy  = string(date_get_year  (date_current_datetime()));
var hh  = string(date_get_hour  (date_current_datetime()));
var mn  = string(date_get_minute(date_current_datetime()));
var ss  = string(date_get_second(date_current_datetime()));

// remove the extension
var substr = ".cdf"
var FILENAME = string_replace(global.FILENAME,substr,"");

// create the filename
var fname = string(FILENAME) +"_" +dd+"-" +mm+"-" +yy+"-" +hh+"-" +mn+"-" +ss +string(".bak");



// create the file
writeFile(working_directory +"backups\" +fname);

/*
file = file_text_open_write(fname);
        {
            for(var i=0; i<ds_list_size(global.listOfItems); i++)           // iterate through the list of items
            {
            
                var a = ds_list_find_value(global.listOfItems,i);
                var index = object_get_name(a.object_index)
                
                if  index != "PAGE_NUMBER"
                and index != "TOTALS"
                and index != "TOTALS_TOP"
                {
                    //var n = a.object_index;
                    file_text_write_string(file,string(index));
                    file_text_write_string(file,"^");                       // separator for each field
                    file_text_write_real(  file,a.row);
                    file_text_write_string(file,"^");
                    file_text_write_real(  file,a.dateYear);
                    file_text_write_string(file,"^");
                    
                    
                    // month text
                    if a.dateMonth != "" then {
                        file_text_write_string(file, a.dateMonth);
                    }
                    else {
                        file_text_write_string(file, " ");                  // make sure something gets written
                    }
                    
                    
                    // dates
                    file_text_write_string(file,"^");
                    file_text_write_real(file,a.dateDay);
                    file_text_write_string(file,"^");
                    file_text_write_real(file,a.showYear);
                    file_text_write_string(file,"^");
                    file_text_write_real(file,a.showMonth);
                    file_text_write_string(file,"^");
                    file_text_write_real(file,a.showDay);
                    file_text_write_string(file,"^");
                    
                    // item count?
                    file_text_write_real(file,a.countMyItemNumber);
                    file_text_write_string(file,"^");
                    
                    
                    // description text
                    if a.description != "" {
                        file_text_write_string(file,a.description);
                    }
                    else {
                        file_text_write_string(file, " ");                  // make sure something gets written
                    }
                    file_text_write_string(file,"^");
                    
                    // lines count
                    file_text_write_real(file,a.lines);
                    file_text_write_string(file,"^");
                    
                    
                    // ourlayText
                    if a.outlayText != "" {
                        file_text_write_string(file,a.outlayText);
                    }
                    else {
                        file_text_write_string(file, " ");                  // make sure something gets written
                    }
                    file_text_write_string(file,"^");
                    
                    
                    // professionalText
                    if a.professionalText != "" {
                        file_text_write_string(file,a.professionalText);
                    }
                    else {
                        file_text_write_string(file, " ");                  // make sure something gets written
                    }
                    
                    
                    file_text_write_string(file,";");                       // marks the end of a line/item
                    file_text_writeln(file);
                }
            }
            file_text_close(file);
        }
*/

// FINISH UP
//if file_exists(file) then file_text_close(file);
global.UNSAVED = 0;
global.SAVING = 0;
window_set_cursor(cr_default);      // reset the mouse pointer
