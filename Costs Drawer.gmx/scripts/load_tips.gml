///load_tips()

var fileName = "tips";
var file = -1;
var list = global.tipsList;
show_debug_message("loading tips from last session...");

if !(file_exists(fileName))
{
    file = file_text_open_write(fileName);
    file_text_close(file);
}


if ( file_exists(fileName) )
{
    file = file_text_open_read(fileName);
    
    while !(file_text_eof(file))
    {
        var str = file_text_read_string(file);
        if (str != "")
        {
            ds_list_add(list,str);
        }
        
        file_text_readln(file);
    }
    
    file_text_close(file);
}
