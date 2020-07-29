/// dictionary_delete_dictionary_txt()
/* Deletes the old dictionary.txt file which is
 * no longer used.
*/

var dictionaryFile  = "dictionary.txt";

if ( file_exists(string(dictionaryFile) ) )
{
    debug_message("Old dictionary file exists, attempting to delete...");
    delete_old_dictionary_txt();
}
else
{
    debug_message("Old dictionary.txt not found, can't delete.");
}
