/// default_items_editor_edit_description()
//var i = argument0;

if (fieldSelected != descriptionFieldIndex) then exit;  // keyboard controls
                    
// get the new description
var str = get_string("Enter a description:", shownDescription);

//validate desc ?
//...

// set the value
newDesc = str;
arrayOfHighCourtItemValues[currentIndex, newDescIndex] = newDesc;
array = arrayOfHighCourtItemValues;

// SO: then when we click "SAVE", it will change global.arrayOfHighCourtItemValues
// to match arrayOfHighCourtItemValues, and then all we have to do is write
// those values to a file, which will then be loaded at startup to get the values.
// NOTE: Not all items should/will be changeable.
