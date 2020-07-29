/// generate_default_dictionary_b()

global.DICTIONARY_B = ds_list_create();

var list = global.DICTIONARY_B;


var fileName = "dictionaries\default\B.txt";

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
