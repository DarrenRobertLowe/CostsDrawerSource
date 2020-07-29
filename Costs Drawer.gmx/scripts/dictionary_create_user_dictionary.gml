///dictionary_create_user_dictionary();
/* Creates a list of user words from user_dictionary.txt
 * so that we can add them to the active dictionary.
*/
var dictionaryFile  = USER_DICTIONARY_FILE;
var dictionary      = global.USER_DICTIONARY;


if ( file_exists(string(dictionaryFile) ) )
{
    var file = file_text_open_read(dictionaryFile);
    
    while ( !file_text_eof(file) )
    {
        var wrd = file_text_read_string(file);
        ds_list_add_exclusive(dictionary, wrd);
        file_text_readln(file);
        //file_text_open_write(file);
    }
    
    file_text_close(file);
}
else
{
    show_debug_message("User dictionary not found.");
    write_log("User dictionary not found.");
}
