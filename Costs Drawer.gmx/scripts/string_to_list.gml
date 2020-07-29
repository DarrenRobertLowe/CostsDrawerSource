/// string_to_list(string,list)
/* returns ds_list
 *
*/

var str  = argument0;
var list = argument1;
ds_list_clear(list);

while (string_length(str) > 0)
{
    var val = "";
    var pos = string_pos("#",str);                          // find the first carriage return
    
    if (pos == 0) // no # found
        {
        val = str;                                          // copy the whole string
        pos = string_length(str);
        }
    else val = string_copy(str,1,pos);                      // or only copy that portion
    
    
    // delete that portion of the string
    str = string_delete(str,1,pos);

    
    // add it to the list
    val = string_replace_all(val,"#","");                   // delete the carriage return
    ds_list_add(list,val);                                  // add the string to the list
}

return list;
