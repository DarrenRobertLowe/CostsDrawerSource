/// items_editor_edit_description(description, index)

// get the new description
var description = argument0;
var index       = argument1;

var preStr      = description;
var str         = get_string("Enter a description:", description);

if (str != "")
{
    str = text_remove_special_chars_lite(str);
    str = removeTrailingSpaces(str);
    str = string_copy(str, 1, global.maxDescriptionChars); // trim to the max char count;
    
    // set the value
    if (str != description) // as long as string has changed...
    {
        description = str;
        array[index, customDescriptionIndex] = description;
        event_user(2);      // tell Save Button to become visible/clickable
    }
}
