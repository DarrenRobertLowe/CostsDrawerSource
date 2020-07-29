/// generate_default_dictionary_l()

global.DICTIONARY_L = ds_list_create();

var list = global.DICTIONARY_L;

var fileName = "dictionaries\default\L.txt";

/// add words
if ( file_exists(fileName) )
{
    var file = file_text_open_read(fileName);
    
    while !( file_text_eof(file) )
    {
        var word = file_text_read_string(file);
        ds_list_add(list, word);
        file_text_readln(file);
    }
    file_text_close(file);
}
