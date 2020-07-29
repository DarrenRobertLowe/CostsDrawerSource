///dictionary_backup_needed()
/* @Return bool
 * Checks user_dictionary against the most recent backup and
 *   creates returns true if there's any difference.
 * 
 * Process:
 * Checks if the USER_DICTIONARY has any words. If not, exits.
 * Finds the most recent dictionary backup file (if any).
 * Creates a temporary list of the most recent backup
 * dictionary's words, and compares it to the USER_DICTIONARY.
 * If they're different sizes, then we need to backup
 * dictionary, and this function will return true.
 * Otherwise, we compare each word individually. If there's
 * any difference, then we need to create a backup and this
 * function will return true.
 * This function only returns false in the event that both
 * lists are identical.
*/

/// SETUP
//show_debug_message("Checking if dictionary needs a backup");
var appdata     = get_appdata_folder() + "\";
var folder      = (appdata +"dictionaries\backups\");
fileList    = ds_list_create();
var file        = "";


if (ds_list_size(global.USER_DICTIONARY) == 0)
{
    return false;
    //show_debug_message("Dictionary does not to be backed up.");
}



/// FIND THE MOST RECENT BACKUP FILE

// add the first file to the file list
if directory_exists(appdata +"dictionaries")
{
    file = file_find_first(folder + "*.txt", 0);

    if (file == "")
    {
        show_debug_message("no backup dictionaries found!");
        write_log("No backup dictionaries found!");
        return true;
    }
    else
    {
        ds_list_add(fileList, string(folder) + string(file));
        //show_debug_message("added " +string(folder) + string(file));
    }
}
else 
{
    show_debug_message("dictionaries folder not found!");
    write_log("dictionaries folder not found!");
    directory_create(appdata +"dictionaries")
}

// Add the rest of the files to the file list
while (file != "")
{
    file = file_find_next();
    
    if (file != "")
    {
        ds_list_add(fileList, string(folder) + string(file));
    }
}


if (ds_list_size(fileList) == 0)
{
    //show_debug_message("no dictionary backups found, we'll create one");
    return true;
}


// sort the list and get the most recent file
ds_list_sort(fileList, true);
var tFileName = ds_list_find_value(fileList, 0);
show_debug_message("Most recent dictionary backup file is "+string(tFileName));
write_log("Most recent dictionary backup file is "+string(tFileName));

if (tFileName == "")
{
    //show_debug_message("no dictionary backups found, we'll create one");
    return true;
}


// EXTRACT WORDS TO TEMP LIST
oldWordList = ds_list_create();

file = file_text_open_read(tFileName);

while !( file_text_eof(file) )
{
    var word = file_text_read_string(file);
    ds_list_add(oldWordList,word);
    file_text_readln(file);
}
file_text_close(file);




// PERFORM THE COMPARISON
// if the lists are not the same size, we can skip comparing individual words
if ( ds_list_size(oldWordList) != ds_list_size(global.USER_DICTIONARY) )
{
    show_debug_message("The lists are different sizes! Dictionary needs to be backed up.");
    write_log("The lists are different sizes! Dictionary needs to be backed up.");
    return true;
}

/* Otherwise, we want to search for each word of our user dictionary
 * against the tempList. Any difference means we need to back up the
 * dictionary.
*/
var list = global.USER_DICTIONARY;
var size = ds_list_size(list);
for (var i=0; i<size; i++)
{
    var word = ds_list_find_value(list, i);
    var pos  = ds_list_find_index(oldWordList, word);
    
    if (pos == -1) // if the word is NOT found
    {
        show_debug_message("A word : "+string(word) +" was not fount! Dictionary needs to be backed up.");
        write_log("A word : "+string(word) +" was not fount! Dictionary needs to be backed up.");
        return true; // then we need to create a back up
    }
}



// CLEAN UP
ds_list_destroy(fileList);
ds_list_destroy(oldWordList);

//show_debug_message("Dictionary does not to be backed up.");
return false;
