///load_window_session();
//show_message(string(object_get_name(object_index)) +" : "+string(id) +" is running load_window_session");
var file = "session.ini";

if ( file_exists(file) )
{
    ini_open(file);
    
    var section = "SESSION";
    var key = "";
    var value = 0;

    var width = window_get_width();
    key = "width";
    if ( ini_key_exists(section,key) )
      then width = ini_read_real(section, key, width);
      else ini_write_real(section, key, width);
    
    var height = window_get_width();
    key = "height";
    if ( ini_key_exists(section,key) )
      then height = ini_read_real(section, key, height);
      else ini_write_real(section, key, height);
    
    var winX = window_get_x();
    key = "winX";
    if ( ini_key_exists(section,key) )
      then winX = ini_read_real(section, key, winX);
      else ini_write_real(section, key, winX);
      
    var winY = window_get_y();
    key = "winY";
    if ( ini_key_exists(section,key) )
      then winY = ini_read_real(section, key, winY);
      else ini_write_real(section, key, winY);
    
    var defaultVal = right_column_x;
    key = "right_column_x";
    if ( ini_key_exists(section,key) )
    {
        right_column_x = ini_read_real(section, key, defaultVal);
        right_column_customized = true;
    }
    else ini_write_real(section, key, defaultVal);
      
    
    var defaultVal = 0; // this just means to ask immediately if we don't have a date yet
    key = "backupDeleteDate";
    if ( ini_key_exists(section,key) )
    {
        backupDeleteDate = ini_read_real(section, key, defaultVal);
    }
    else ini_write_real(section, key, defaultVal);
    
    
    /// load that data
    window_set_position(winX,winY);
    
    width--;
    height--;
    
    window_set_size(width, height);
    view_wview[0] = width;
    view_hview[0] = height;
    
    user_resize_window();
    //display_set_gui_size(width, height); // resize the gui layer to our window size
    
    //surface_resize(application_surface,window_get_width(),window_get_height());
    //room_width  = window_get_width();
    //room_height = window_get_height();
    
    
    
    ini_close();
}
