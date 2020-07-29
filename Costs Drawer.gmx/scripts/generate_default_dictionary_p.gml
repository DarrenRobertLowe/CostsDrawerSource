/// generate_default_dictionary_p()

global.DICTIONARY_P = ds_list_create();

var list = global.DICTIONARY_P;

var fileName = "dictionaries\default\P.txt";

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
