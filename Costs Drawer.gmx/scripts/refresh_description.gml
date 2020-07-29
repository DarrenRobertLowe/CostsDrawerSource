///refresh_description();

ds_list_copy(tempDescriptionList,descriptionList);      
remove_extra_spaces(tempDescriptionList);                                       // remove starting spaces
previousLines       = lines; // used to tell DOC_ORG to run or not (see confirmDescription)
var lastLine        = (ds_list_size(tempDescriptionList)-1);
cursorLine          = lastLine;

var lastString      = ds_list_find_value(tempDescriptionList,lastLine);
if !is_undefined(lastString)
{
    cursorPosition  = string_length(lastString);
    if is_undefined(lastString) then lastString = "";
}
else
{
    lastString = "";
}

//workingString       = getTempDescription(tempDescriptionList);                  // convert the list to a string

editingDescription  = true;
DOCtimer = 0;                           // variable used to tell DOC_ORGANIZER to reposition items while typing.

checkedWords = ds_list_create();
remove_extra_spaces(tempDescriptionList);                                       // remove starting spaces
previousLines       = lines; // used to tell DOC_ORG to run or not (see confirmDescription)
var lastLine        = (ds_list_size(tempDescriptionList)-1);
cursorLine          = lastLine;

var lastString      = ds_list_find_value(tempDescriptionList,lastLine);
if !is_undefined(lastString)
{
    cursorPosition  = string_length(lastString);
    if is_undefined(lastString) then lastString = "";
}
else
{
    lastString = "";
}

workingString       = getTempDescription(tempDescriptionList);                  // convert the list to a string

editingDescription  = true;
DOCtimer = 0;                           // variable used to tell DOC_ORGANIZER to reposition items while typing.

checkedWords = ds_list_create();
