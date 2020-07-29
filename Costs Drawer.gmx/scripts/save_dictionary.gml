/// save_dictionary();
window_set_cursor(cr_hourglass);                // change the mouse pointer


var dd   = string(date_get_day   (date_current_datetime()));
var mm   = string(date_get_month (date_current_datetime()));
var yy   = string(date_get_year  (date_current_datetime()));
var date = ( string(yy) + "-" +string(mm) + "-" +string(dd) );

var filename = get_save_filename_ext("Dictionary File|*.txt", "dictionary " + string(date), global.USER_DIRECTORY, "Save Dictionary File As...");

if (filename != "")
{
    var file = file_text_open_write(filename);
    // show_message("filename = "+string(filename));
    // show_message("file = "+string(file));
    file_text_close(file);
    
    var timeOut = 5000; // number of milliseconds to wait
    var targetTime = ( (get_timer()/1000) + timeOut);
    
    while !file_exists(filename)
    {
        updateTimer();
        
        if (global.TIMER >= targetTime)
        {
            if show_question("This seems to be taking a long time. Continue waiting?")
            {
                targetTime = ( (get_timer()/1000) + timeOut);   /// start waiting again
            }
            else
            {
                show_message("Error: Dictionary file failed to be created! Make sure disk is not write protected.");
                window_set_cursor(cr_default);
                exit;
            }
        }
    }
    
    
    
    
    // GET USER DICTIONARY WORDS
    var tempList = ds_list_create();
    var user_dictionary = USER_DICTIONARY_FILE;
    
    if !file_exists(user_dictionary)
    {
        var fi = file_text_open_write(user_dictionary);
        file_text_close(fi);
    }
    
    // extract all words from user_dictionary
    var fi = file_text_open_read(user_dictionary);
    while !(file_text_eof(fi))
    {
        var wrd = file_text_read_string(fi);
        ds_list_add(tempList,wrd);
        file_text_readln(fi);
    }
   
    
    if ( file_exists(filename) )
    {
        file = file_text_open_write(filename);
        var list     = tempList;
        var size     = ds_list_size(list);
        var lastItem = (size-1);
        
        for(var i=0; i<size; i++)
        {
            var word = ds_list_find_value(list,i);
            
            file_text_write_string(file,word);
            if (i < lastItem) then file_text_writeln(file);
        }
        
        file_text_close(file);
    }
    else
    {
        show_message("Could not create file! Make sure disk is not write protected!");
        write_log("Could not save user_dictionary file even though it should exist!");
    }
    
    
    if ds_exists(tempList,ds_type_list)
    then ds_list_destroy(tempList);
}


window_set_cursor(cr_default);                // change the mouse pointer
