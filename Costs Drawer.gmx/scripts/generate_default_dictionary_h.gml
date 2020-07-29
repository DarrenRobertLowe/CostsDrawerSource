/// generate_default_dictionary_h()

global.DICTIONARY_H = ds_list_create();

var list = global.DICTIONARY_H;

var fileName = "dictionaries\default\H.txt";

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
