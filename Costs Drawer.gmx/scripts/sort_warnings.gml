/// sort_warnings(list);
/// argument0 = global.WARNINGS or global.CAUTIONS;

if (ds_exists(argument0,ds_type_list))
{
    if (ds_list_size(argument0) > 0)
    {
        var listCopy = ds_list_create();
        ds_list_copy(listCopy, argument0);
        var size = ds_list_size(listCopy);
        
        var sortedList = ds_list_create();
        ds_list_add(sortedList,ds_list_find_value(listCopy,0));
        var sortedListSize = ds_list_size(sortedList);
        
        for(var i=0; i<size; i++)
        {
            var warning = ds_list_find_value(listCopy,i);
            var pos  = string_pos(":",warning);
            var row  = real( string_digits(string_copy(warning,0,pos) ));
            
            /// find the position to slot it into
            for(var j=(sortedListSize-1); j>=0; j--) // iterate backwards through new listCopy
            {
                var compareWarning = ds_list_find_value(sortedList,j);
                var pos  = string_pos(":",compareWarning);
                var row2 = string_digits(string_copy(compareWarning,0,pos));
                row2 = real(row2);
                
                
                if (row >= row2)
                or (j <= 0)
                {
                    ds_list_insert(sortedList,j+1,warning);
                    j = 0; /// end the loop
                }
            }
            
            sortedListSize = ds_list_size(sortedList); // reset the sorted listCopy size
        }
        
        
        ds_list_clear(argument0);
        size = ds_list_size(sortedList);
        for(var i=1; i<size; i++)
        {
            var item = ds_list_find_value(sortedList,i);
            ds_list_add(argument0,item);
        }
        
        
        ds_list_destroy(listCopy);
        ds_list_destroy(sortedList);
    
    }
}
