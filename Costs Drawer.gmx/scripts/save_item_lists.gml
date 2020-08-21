///save_item_lists()

var fileName = "default_items.txt";


if !(file_exists(fileName))
{
    file = file_text_open_write(fileName);
    file_text_close(file);
}


if ( file_exists(fileName) )
{
    file = file_text_open_write(fileName);
    
}
