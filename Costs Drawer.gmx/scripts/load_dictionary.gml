///load_dictionary(directory)
var directory = string(argument0);

var filename = get_open_filename_ext("*.txt", "", directory, "Choose a dictionary to load");

if (filename != "")
{
    if file_exists(filename)
    {
        // CREATE A BACKUP DICTIONARY
        dictionary_create_backup();
        
        
        // CLEAR USER DICTIONARY
        var dictionary = global.USER_DICTIONARY;
        ds_list_clear(dictionary);
        
        
        // EXTRACT FILE CONTENTS TO global.USER_DICTIONARY
        var file = file_text_open_read(filename);
        
        while ( !file_text_eof(file) )
        {
            ds_list_add(dictionary,file_text_read_string(file));
            file_text_readln(file);
        }
        file_text_close(file);
        
        
        // OVERWRITE USER_DICTIONARY WITH OUR LOADED ONE
        var dictionaryFile = USER_DICTIONARY_FILE;
        
        // delete existing
        if file_exists(dictionaryFile)
        {
            file_delete(dictionaryFile);
        }
        
        // open for writing...
        file = file_text_open_write(dictionaryFile);
        // write to the file
        var size = ds_list_size(dictionary);
        for(var i=0; i<size; i++)
        {
            var wrd = ds_list_find_value(dictionary,i);
            file_text_write_string(file,wrd);
            file_text_writeln(file);
        }
        // close the file
        file_text_close(file);
        
        
        // RELOAD ALL THE DICTIONARIES
        populate_dictionary();
    }
}
