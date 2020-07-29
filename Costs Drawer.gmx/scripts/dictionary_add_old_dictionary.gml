///dictionary_add_old_dictionary();
/* Creates a list of user words from user_dictionary.txt
 * so that we can add them to the user_dictionary if they
 * don't already exist in the hardcoded dictionary.
 * It also removes any bad words found that were accidentally
 * still in there.
*/
var dictionaryFile  = "dictionary.txt";
var userDict        = global.USER_DICTIONARY;

window_set_cursor(cr_hourglass);

var size = 0;

if ( file_exists(string(dictionaryFile)) )
{
    // ADD DICTIONARY.TXT WORDS TO USER_DICTIONARY
    show_debug_message("Adding dictionary.txt words to user_dictionary list");
    write_log("Adding dictionary.txt words to user_dictionary list");
    
    var file = file_text_open_read(dictionaryFile);
    
    while ( !file_text_eof(file) )
    {
        var wrd = file_text_read_string(file);
        ds_list_add_exclusive(userDict, wrd);
        file_text_readln(file);
    }
    file_text_close(file);
    
    
    // CREATE A BACKUP OF ALL THESE OLD WORDS JUST IN CASE
    show_debug_message("Creating a backup of old dictionary words just in case...");
    write_log("Creating a backup of old dictionary words just in case...");
    
    //if ( dictionary_backup_needed() )
    //{
        dictionary_create_backup();
    //}
    
    
    // DELETE PROFANITY
    show_debug_message("Checking for and deleting any profanity found...");
    write_log("Checking for and deleting any profanity found...");
    size = ds_list_size(userDict)
    list = global.PROFANITY_DICTIONARY;
    for (var i=0; i<size; i++)
    {
        if (i < ds_list_size(userDict))
        {
            var wrd = ds_list_find_value(userDict,i); // take the lower case of the word
            
            if  !(is_undefined(wrd))
            and (string_length(wrd) > 0)
            {
                wrd = string_lower(wrd);
            }
            
            if (ds_list_find_index(list,wrd) > -1)
            {
                show_debug_message("Word '" +string(wrd) +"' found, it will be deleted.");
                write_log("Word '" +string(wrd) +"' found, it will be deleted.");
                
                ds_list_delete(userDict,i);
                i=0; // we've removed an index so start again
            }
        }
    }
    
    
    
    // DELETE HARDCODED WORDS FROM USER_DICTIONARY
    show_debug_message("DELETING HARDCODED WORDS FROM USER_DICTIONARY");
     write_log("DELETING HARDCODED WORDS FROM USER_DICTIONARY");
     
    size = ds_list_size(userDict);
    
    for(var i=0; i<size; i++)
    {
        var wrd = ds_list_find_value(userDict, i);
        
        if !(is_undefined(wrd))
        {
            var char    = string_char_at(wrd, 1);
            var hcDict  = -1;
            
            // find the corresponding dictionary
            if ( char == "a") or ( char == "A") then hcDict = global.DICTIONARY_A;
            if ( char == "b") or ( char == "B") then hcDict = global.DICTIONARY_B;
            if ( char == "c") or ( char == "C") then hcDict = global.DICTIONARY_C;
            if ( char == "d") or ( char == "D") then hcDict = global.DICTIONARY_D;
            if ( char == "e") or ( char == "E") then hcDict = global.DICTIONARY_E;
            if ( char == "f") or ( char == "F") then hcDict = global.DICTIONARY_F;
            if ( char == "g") or ( char == "G") then hcDict = global.DICTIONARY_G;
            if ( char == "h") or ( char == "H") then hcDict = global.DICTIONARY_H;
            if ( char == "i") or ( char == "I") then hcDict = global.DICTIONARY_I;
            if ( char == "j") or ( char == "J") then hcDict = global.DICTIONARY_J;
            if ( char == "k") or ( char == "K") then hcDict = global.DICTIONARY_K;
            if ( char == "l") or ( char == "L") then hcDict = global.DICTIONARY_L;
            if ( char == "m") or ( char == "M") then hcDict = global.DICTIONARY_M;
            if ( char == "n") or ( char == "N") then hcDict = global.DICTIONARY_N;
            if ( char == "o") or ( char == "O") then hcDict = global.DICTIONARY_O;
            if ( char == "p") or ( char == "P") then hcDict = global.DICTIONARY_P;
            if ( char == "q") or ( char == "Q") then hcDict = global.DICTIONARY_Q;
            if ( char == "r") or ( char == "R") then hcDict = global.DICTIONARY_R;
            if ( char == "s") or ( char == "S") then hcDict = global.DICTIONARY_S;
            if ( char == "t") or ( char == "T") then hcDict = global.DICTIONARY_T;
            if ( char == "u") or ( char == "U") then hcDict = global.DICTIONARY_U;
            if ( char == "v") or ( char == "V") then hcDict = global.DICTIONARY_V;
            if ( char == "w") or ( char == "W") then hcDict = global.DICTIONARY_W;
            if ( char == "x") or ( char == "X") then hcDict = global.DICTIONARY_X;
            if ( char == "y") or ( char == "Y") then hcDict = global.DICTIONARY_Y;
            if ( char == "z") or ( char == "Z") then hcDict = global.DICTIONARY_Z;
            
            // check the corresponding hardcoded dictionary for the word
            if (hcDict != -1)
            {
                show_debug_message("checking hcDict of "+string(char) +" for "+string(wrd));
                
                wrd     = string_lower(wrd);   
                wrdCaps = string_delete(wrd,1,1);
                wrdCaps = ( string_upper(char) + wrdCaps );

                var pos = ds_list_find_index(hcDict, wrd);
                if (pos == -1) then pos = ds_list_find_index(hcDict, wrdCaps);
                
                if (pos > -1)                                   // if the word is found...
                {
                    ds_list_delete(userDict, i);                 // delete the word
                    i--;                                        // we deleted an index so we must reduce i too
                }
            }
        }
    }
}
else
{
    show_debug_message("Old Dictionary.txt not found.");
    write_log("Old Dictionary.txt not found.");
}






window_set_cursor(cr_default);

