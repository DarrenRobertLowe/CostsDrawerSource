/// get_right_column_text_width(ds_list)
// FIND THE WIDTH OF THE LONGEST ITEM
var list        = argument0
var size        = ds_list_size(list);
var maxWidth    = 0;
var maxLength   = 0;

var width  = 0;
var length = 0;
var a = "";

for(i=0; i<size; i++)   // iterate through every item
{
    a = "";
    
    if (object_index = witnesses_SCROLLBAR_H) // witnesses are done differently
    {
        var witness = ds_list_find_value(list,i);
        if !is_undefined(witness) then a = witness.name;
    }
    else a = ds_list_find_value(list,i);
    
    width  = string_width(a);
    length = string_length(a);
    
    //if (object_index = plaintiffs_SCROLLBAR_H) then width += 75; // add space for buttons
    //if (object_index = defendants_SCROLLBAR_H) then width += 75; // add space for buttons
    //if (object_index = witnesses_SCROLLBAR_H)  then width += 75; // add space for buttons
    
    if (width  > maxWidth)  then maxWidth  = width;
    if (length > maxLength) then maxLength = length;
}

textWidth  = (maxWidth)//  + 75);
textLength = (maxLength + 5);

