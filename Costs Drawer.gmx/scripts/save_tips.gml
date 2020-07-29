var fileName = "tips";
var file = -1;
var list = global.tipsList;

show_debug_message("saving tips for next session...");

if file_exists(fileName)
{
    file_delete(fileName);
}


file = file_text_open_write(fileName);

for(var i=0; i<ds_list_size(list); i++)
{
    var str = ds_list_find_value(list,i);
    
    if (str != "")
    {
        file_text_write_string(file,str);
        file_text_writeln(file);
    }
}

file_text_close(file);
