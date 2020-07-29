/// remove_extra_spaces(list);

list = argument0;
size = ds_list_size(list);

for(i=0; i<size; i++) {                                 // iterate through list

    var tempString = ds_list_find_value(list,i);    
        if string_length(tempString) = 0 {continue};    // don't loop on a line of only spaces
    
    
    
    // REMOVE ALL beginning spaces (we add 2 back later)
    char = string_char_at(tempString,1);
    
    while char      = " " {
        tempString  = string_delete(tempString,1,1)
        char        = string_char_at(tempString,1);
    }
    

    
    // REMOVE ALL trailing spaces
    /* Note: strings count their index from 1, not 0. */
    if i < size-1 {                                     // if not the last line...
        var len     = string_length(tempString);
        var char    = string_char_at(tempString,len)
        
        while char  = " " {
            tempString  = string_delete(tempString,len,1)   // delete last char
            len         = string_length(tempString);        // get the length
            char        = string_char_at(tempString,len)    // get the last char
        }
    }
    
    
    // ADD 2 beginning spaces
    /*
    if i > 0 {                                          // if not the first line...
        tempString = "  "+tempString;                   // ...add 2 spaces
    }
    */
    
    
    // ADD 1 space at end because lines separate on spaces
    // so there are technically 3 spaces in sequence every line.
    if i < size-1 {                                     // if not the last line...
        tempString += " ";                              // ...add a space to the end.
    }
    
    
    
    // REPLACE the list item with our newly formatted string
    ds_list_delete(list,i);
    ds_list_insert(list,i,tempString);
}

return list;
