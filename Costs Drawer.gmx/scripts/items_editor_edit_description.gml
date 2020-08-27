/// items_editor_edit_description(description, index)

// get the new description
var description = argument0;
var index   = argument1;

var preStr  = description;
var str     = get_string("Enter a description:", description);

if (str != "")
{
    // set the value
    if (str != description)
    {
        description = str;
        
        array[index, customDescriptionIndex] = description;
        
        //hcCustomArray = array; // should this happen when we press save or now??
        
        event_user(2);  // tell Save Button to become visible/clickable
    }
}
