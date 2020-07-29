///spellcheck_addword(suggested string);
/* @Return null
 * Adds a string to the user dictionary file.
 * Note: The way this works is that, if "givenString"
 * is blank, the user will be prompted to type a word.
 * If "givenString" contains text, then that word will
 * be added without prompting the user.
*/

var fname       = USER_DICTIONARY_FILE;
var file        = -1;
var givenString = string_lower(argument0);


if !file_exists(fname)
{
    show_debug_message("User dictionary not found! We'll create it.");
    write_log("User dictionary not found! We'll create it.");
    file = file_text_open_write(fname);
    file_text_close(file);
}


if ( file_exists(fname) )
{
    if (givenString != "") // if we already know the word we're adding...
    {
        var word = string_lower(remove_punctuation(givenString));
        if (word != "")
        {
            var file = file_text_open_append(fname);
            file_text_writeln(file);
            file_text_write_string(file, word);
            file_text_close(file);
            
            //update_dictionary();
            ds_list_clear(global.USER_DICTIONARY);
            dictionary_create_user_dictionary();
        }
    }
    
    if (givenString == "") // if we DON'T know the word we're adding...
    {
        var word = get_string("Type the word to be added:", "");

        if (word != "")
        {
            word = remove_punctuation(word);
            word = string_lower(word);
        }
        
        if (word != "")
        {
            var file = file_text_open_append(fname);
            file_text_writeln(file);
            file_text_write_string(file, word);
            file_text_close(file);
            
            //update_dictionary();
            ds_list_clear(global.USER_DICTIONARY);
            dictionary_create_user_dictionary();
        }
    }
}
else
{
    show_message("User dictionary could not be created, please ensure disk is not write protected!");
    exit;
}
