///write_window_session()

//show_message(string(object_get_name(object_index)) +" : "+string(id) +" is running write_window_session");
var fileName = "session.ini";

if !(file_exists(fileName))
{
    file = file_text_open_write(fileName);
    file_text_close(file);
}


if ( file_exists(fileName) )
{
    ini_open(fileName);
    
    var section = "SESSION";
    
    ini_write_real( section, 'height', window_get_height() );
    ini_write_real( section, 'width',  window_get_width() );
    ini_write_real( section, 'winX',   window_get_x() );
    ini_write_real( section, 'winY',   window_get_y() );
    ini_write_real( section, 'right_column_x',   MASTER.right_column_x );
    
    ini_close();
}
