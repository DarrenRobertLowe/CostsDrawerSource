///restore_window_state()
if (file_exists("preferences.ini"))
{
    //show_message("restoring window state");
    ini_open("preferences.ini")
    
    var section = "SESSION";
    
    var winWnow = old_window_width;
    var winHnow = old_window_height;
    var winW = ini_read_real( section, 'width', winWnow );
    var winH = ini_read_real( section, 'height', winHnow );
    
    window_set_size(winW,winH);
    
    var winXnow = window_get_x();
    var winYnow = window_get_y();
    var winX = ini_read_real( section, 'winX',  winXnow );
    var winY = ini_read_real( section, 'winY',  winYnow );
    
    window_set_position(winX,winY);
    
    
    right_column_x = ini_read_real( section, 'right_column_x',  window_get_width()-100);
    right_column_customized = true;
    
    display_set_gui_size(winW,winH); // resize the gui layer to our window size
    
    ini_close();
}
