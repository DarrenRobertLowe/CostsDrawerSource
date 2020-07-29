/// write_user_dictionary();
var file = USER_DICTIONARY_FILE;

if !file_exists(file)
{
    show_debug_message("user_dictionary does not exist, nothing to delete!");
}
else
{    
    file_delete(file);
    show_debug_message("deleting user dictionary so we can replace it");
}


file = file_text_open_write(USER_DICTIONARY_FILE);

var list     = global.USER_DICTIONARY;
var size     = ds_list_size(list);
var lastItem = (size-1);
for (var i=0; i<size; i++)
{
    var word = ds_list_find_value(list,i);
    file_text_write_string(file, word);
    if (i < lastItem) then file_text_writeln(file); // don't write a new line on the last item
}

file_text_close(file);
