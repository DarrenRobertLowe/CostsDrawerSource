/// separate_list_lines(list,italics multiplier,maxWidth,font)
/* Returns ds_list "listCopy"
 * 
 * Separates a list so that if any one line goes over the 
 * given width, it will separate that line and add it back
 * to the listCopy as a new entry.
*/

draw_set_font(argument3);

var listCopy            = ds_list_create();                 // create a blank list
ds_list_copy(listCopy,argument0);                           // copy the contents of the list we're working on
var listSize            = ds_list_size(listCopy);           // get the size of that list

var italicsMultiplier   = argument1;
var maxWidth            = argument2;



for(var i=0; i<listSize; i++)
{
    var item  = ds_list_find_value(listCopy,i);             
    var width = (string_width(item) *italicsMultiplier);    // get the true width of the item
    
    
    if (width >= maxWidth)
    {
        var str1     = "";
        var str2     = "";
        var strWidth = 0;
        
        // add 1 letter at a time
        for(var n=0; (strWidth < maxWidth); n++)
        {
            str1 = string_copy(item,0,n);
            str2 = string_copy(item,n+1,string_length(item));
            strWidth = (string_width(str1) * italicsMultiplier);
        }
        
        // find a space to break on...
        for(var n=string_length(str1); n>0; n--)            // iterate backwards through str1
        {
            var char = string_char_at(str1,n);
            if char = " "
            or char = "-"
            or char = "_"
            {
                var lastWord = string_copy(str1,n+1,string_length(str1));
                str1 = string_copy(str1,0,n);
                str2 = (lastWord + str2);
                
                n = 0;                                      // stop this loop
            }
        }
        
        
        // replace the long item with 2 separate lines
        ds_list_delete(listCopy,i);
        ds_list_insert(listCopy,i,str2);
        ds_list_insert(listCopy,i,str1);
        
        listSize = ds_list_size(listCopy);                  // reset the listCopy size
    }
}

argument0 = ds_list_copy(argument0,listCopy);

return argument0;
