///items_editor_edit_outlay(outlay, index);

// get the new outlay
var outlay = argument0;
var index  = argument1;

var preStr  = string(outlay);
var str     = get_string("Enter value for Outlay:", outlay);

if (str != "")
{
    var enteredValue = formatQuantum(str);
    
    // set the value
    enteredValue = real(enteredValue);
    if (enteredValue != outlay)
    {
        outlay = real(enteredValue);
        array[index, outlayValueFieldIndex] = outlay;
        customItemsArray = array;
        event_user(2); // tell Save Button to become visible/clickable
    }
}
