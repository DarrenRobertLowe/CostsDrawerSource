///items_editor_edit_professional();

// get the new professional
var professional = argument0;
var index  = argument1;

var preStr          = string(professional);
var str             = get_string("Enter value for Professional:", professional);

if (str != "")
{    
    var enteredValue    = formatQuantum(str);
    
    // set the value
    enteredValue = real(enteredValue);
    if (enteredValue != professional)
    {
        professional = enteredValue;
        array[index, professionalValueFieldIndex] = professional;
        customItemsArray = array;
        event_user(2); // tell Save Button to become visible/clickable
    }
}
