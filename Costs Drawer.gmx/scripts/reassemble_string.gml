/// reassemble_string(str, visibleIndex, list, carriedOver?)

var visibleIndex    = argument1;
var list            = argument2;
var carriedOver     = argument3;    // the iteration direction
var size            = ds_list_size(list);
var newString       = "";


if (carriedOver == false) // we're looking south for lines...
{
    //show_debug_message("     we're looking down the list...");
    newString = argument0;                                          // the string we started with
    for (var i=visibleIndex; i<size; i++)
    {
        // we need to get the full string
        var nextStr = ds_list_find_value(list,i+1);
        
        if !( is_undefined(nextStr) )
        and ( string_count(";",nextStr) > 0 )
        {
            nextStr    = string_replace_all(nextStr,";","");        // delete the ";"
            newString  = (newString + nextStr);                     // stitch these string together     
        }
        else // we have the full string so finish up
        { 
            i =  size;  // end the loop
        }
    }
}


if (carriedOver == true)   // we're looking north for lines...
{
    //show_debug_message("     we're looking up the list...");
    for (var i=visibleIndex; i>0; i--)
    {
        // we need to get the full string
        var prevStr = ds_list_find_value(list,i);
        
        if !( is_undefined(prevStr) )
        and ( string_count(";",prevStr) > 0 )
        {
            prevStr    = string_replace_all(prevStr,";","");    // delete the ";"
            newString = (prevStr + newString);                  // stitch these string together     
        }
        else // we have the full string so finish up
        {
            newString = (prevStr + newString);                  // stitch these string together     
            i = 0;                                              // end the loop
        }
    }
}






return newString;
//show_debug_message("reassemble_string failed and returns " +string(newString));
