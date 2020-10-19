///default_items_editor_check_addRow();
/*
var currentIndex = (size - 1);
var nextIndex    = (size);


// if we're the last index, make [i,1] and [i,2] = 0 (because otherwise they're undefined)
//if (array_height_2d(array) <= currentIndex)
if (currentIndex >= 0)
{
    if (array_length_2d(array, currentIndex) < 3)
    {
        //show_message("array length 2d is :" +string(array_length_2d(array,currentIndex)) );
        
        array[currentIndex, 1] = 0; // outlay
        array[currentIndex, 2] = 0; // professional
    }
    
    
    
    // add a new blank row?
    if (array[currentIndex,0] != "")
    or (array[currentIndex,1] != 0)
    or (array[currentIndex,2] != 0)
    {
        array[nextIndex,0] = "Double-click here to add new item";
        array[nextIndex,1] = 0;
        array[nextIndex,2] = 0;  
        
        size          = array_height_2d(array);
        lastIndex     = (size-1);
    }
}
*/
// update the list size and such
maxItem = default_items_editor_getMaxItem();
