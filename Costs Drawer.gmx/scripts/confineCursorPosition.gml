/// confineCursorPosition(list,cursorLine);

var lis = ds_list_create();         // create an empty list
    ds_list_copy(lis,argument0);    // copy the contents of argument0's list to it
    remove_extra_spaces(lis);       // remove the spaces
var cL = argument1;


var tempString      = ds_list_find_value(lis,cL);

if !is_undefined(tempString) {      // weird bug where sometimes tempString is undefined causing a crash
    if cursorPosition   > string_length(tempString)
        then cursorPosition = string_length(tempString);
}

    
if cursorPosition < 0 then cursorPosition = 0;
if cursorLine > 0 and cursorPosition < 1
{
    cursorPosition = 1;
}


ds_list_destroy(lis);
