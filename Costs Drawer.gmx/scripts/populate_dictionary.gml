#define populate_dictionary
/// populate_dictionary();
/* reads all words from dictionary.txt
 * and adds them to dictionary
 */
 
// POPULATE THE DEFAULT HARDCODED DICTIONARY
//generate_default_dictionary();
generate_default_dictionary_a();
generate_default_dictionary_b();
generate_default_dictionary_c();
generate_default_dictionary_d();
generate_default_dictionary_e();
generate_default_dictionary_f();
generate_default_dictionary_g();
generate_default_dictionary_h();
generate_default_dictionary_i();
generate_default_dictionary_j();
generate_default_dictionary_k();
generate_default_dictionary_l();
generate_default_dictionary_m();
generate_default_dictionary_n();
generate_default_dictionary_o();
generate_default_dictionary_p();
generate_default_dictionary_q();
generate_default_dictionary_r();
generate_default_dictionary_s();
generate_default_dictionary_t();
generate_default_dictionary_u();
generate_default_dictionary_v();
generate_default_dictionary_w();
generate_default_dictionary_x();
generate_default_dictionary_y();
generate_default_dictionary_z();



// COPY DEFAULT WORDS TO ACTIVE DICTIONARY
ds_list_clear(global.DICTIONARY);
ds_list_copy(global.DICTIONARY, global.DEFAULT_DICTIONARY);


// ADD OLD DICTIONARY.TXT WORDS to USER DICTIONARY
dictionary_add_old_dictionary();


// ADD USER DICTIONARY WORDS TO USER DICTIONARY
dictionary_create_user_dictionary();


// COPY USER DICTIONARY WORDS TO ACTIVE DICTIONARY
/*
var fromList = global.USER_DICTIONARY;
var size     = ds_list_size(fromList);
var toList   = global.DICTIONARY;
for(var i=0; i<size; i++)
{
    var wrd = ds_list_find_value(fromList,i);
    ds_list_add_exclusive(toList,wrd);
}
*/

// SAVE THE USER DICTIONARY
write_user_dictionary();


// CREATE A BACKUP OF THE USER_DICTIONARY (but only if something is different)
//if ( dictionary_backup_needed() )
//then dictionary_create_backup_dated();
dictionary_create_backup();


// DELETE OLD DICTIONARY.TXT FILE
dictionary_delete_dictionary_txt();

#define dictionary_create_backup
/// dictionary_create_backup()
/* @Return file id or -1
 * Creates a backup file of the current global.USER_DICTIONARY
 * with a timestamp in the name.
*/

var appdata     = get_appdata_folder();
var folder      = (appdata +"\dictionaries\backups\");
var fileList    = ds_list_create();
var file        = -1;
var fileCount   = 0;
var cutoffDays  = 7; // delete files older than this many days


/// CREATE A BACKUP
show_debug_message("Creating a backup of dictionary");
write_log("Creating a backup of dictionary");

// create the filename
var fname = string("backup_dictionary.txt");

// create the file
file = file_text_open_write(working_directory +"dictionaries\backups\" +fname);
file_text_close(file);


// COPY USER WORDS TO FILE
var filePath = (working_directory +"dictionaries\backups\" +fname);
if file_exists(filePath)
{
    file = file_text_open_write(filePath);
    
    var list     = global.USER_DICTIONARY;
    var size     = ds_list_size(list);
    var lastItem = (size-1);
    for(var i=0; i<size; i++)
    {
        var wrd = ds_list_find_value(list,i);
        file_text_write_string(file,wrd);
        if (i < lastItem) then file_text_writeln(file); // don't write a new line on the last item
    }
    
    file_text_close(file);
}
else
{
    show_debug_message("dictionary_create_backup() says file does not exist!");
    write_log("dictionary_create_backup() says file does not exist!");
}


// CLEAN UP
ds_list_destroy(fileList);

return file;