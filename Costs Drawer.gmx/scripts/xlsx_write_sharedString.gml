/// xlsx_write_sharedString(str)
var str = string(argument0);
if (str == "") then str = " ";


// see if we can find the str
var li = ds_list_find_index(sharedStringsList,str);

if (li > -1)    // if we can find the str on the list...
{
    return li;  // simply return that index
    show_debug_message(string(argument0) +" was already there as "+string(li));
}
else            // otherwise this is a new string so write it to the sharedStrings file...
{
    file_text_write_string(sharedStrings,'<si>');
    file_text_writeln(sharedStrings);
    
    file_text_write_string(sharedStrings,'<t xml:space="preserve">' +str +'</t>');
    file_text_writeln(sharedStrings);
    
    file_text_write_string(sharedStrings,'</si>');
    file_text_writeln(sharedStrings);
    
    ds_list_add(sharedStringsList,str);
    
    show_debug_message(string(argument0) +" entered as a new string "+string(( ds_list_find_index(sharedStringsList,str) )));
    return ( ds_list_find_index(sharedStringsList,str) ) // return the new index
}
