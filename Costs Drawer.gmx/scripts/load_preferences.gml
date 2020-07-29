///load_preferences()

var fileName = "preferences.ini";

if !(file_exists(fileName))
{
    file = file_text_open_write(fileName);
    file_text_close(file);
}


if ( file_exists(fileName) )
{
    ini_open(fileName);
    
    var section = "PREFERENCES";
    var key = "";
    var defaultVal = 0;
    
    
    defaultVal = global.XLSX_Timout;
    key = "XLSX_Timout";
    if ( ini_key_exists(section,key) )
      then global.XLSX_Timout = ini_read_real(section, key, defaultVal);
      else ini_write_real(section, key, defaultVal);
    
    defaultVal = global.PRINT_WAIT;
    key = "PRINT_WAIT";
    if ( ini_key_exists(section,key) )
      then global.PRINT_WAIT = ini_read_real(section, key, defaultVal);
      else ini_write_real(section, key, defaultVal);

    defaultVal = global.tooltipsDelay;
    key = "tooltipsDelay";
    if ( ini_key_exists(section,key) )
      then global.tooltipsDelay = ini_read_real(section, key, defaultVal);
      else ini_write_real(section, key, defaultVal);
    
    defaultVal = global.doubleClickTime;                                    // <- value
    key = "doubleClickTime";                                                // <- value
    if ( ini_key_exists(section,key) )
      then global.doubleClickTime = ini_read_real(section, key, defaultVal);// <- value
      else ini_write_real(section, key, defaultVal);
    
    defaultVal = backupFrequency;                                           // <- value
    key = "backupFrequency";                                                // <- value
    if ( ini_key_exists(section,key) )
      then backupFrequency = ini_read_real(section, key, defaultVal);
      else ini_write_real(section, key, defaultVal);                        // <- value
    
    defaultVal = global.GUI_SCALE;
    key = "GUI_SCALE";
    if ( ini_key_exists(section,key) )
      then global.GUI_SCALE = ini_read_real(section, key, defaultVal);
      else ini_write_real(section, key, defaultVal);
    
    defaultVal = global.scale;
    key = "zoom";
    if ( ini_key_exists(section,key) )
      then global.scale = ini_read_real(section, key, defaultVal);
      else ini_write_real(section, key, defaultVal);
      
      
    // TIP number
    var defaultVal = 0;
    key = "tip";
    if ( ini_key_exists(section,key) )
      then global.currentTip = ini_read_real(section, key, defaultVal);
      else ini_write_real(section, key, defaultVal);
      
    // Display tips?
    defaultVal = global.DISPLAY_TIPS;
    key = "displayTipOfTheDay";
    if ( ini_key_exists(section,key) )
      then global.DISPLAY_TIPS = ini_read_real(section, key, defaultVal);
      else ini_write_real(section, key, defaultVal);
    
    // get the backupDeleteDate  
    defaultVal = backupDeleteDate;
    key = "backupDeleteDate";
    if ( ini_key_exists(section,key) )
      then backupDeleteDate = ini_read_real(section, key, defaultVal);
      else ini_write_real(section, key, defaultVal);
    
    // get the default folder for saving and loading
    defaultVal = global.USER_DIRECTORY;
    key = "defaultSaveDirectory";
    if ( ini_key_exists(section,key) )
      then global.USER_DIRECTORY = ini_read_string(section, key, defaultVal);
      else ini_write_string(section, key, defaultVal);

    
    /// DEBUG ///
    var section = "DEBUG";
    var key = "";
    var defaultVal = 0;
    
    defaultVal = global.DEBUG_MODE;
    key = "DEBUG_MODE";
    if ( ini_key_exists(section,key) )
      then global.DEBUG_MODE = ini_read_real(section, key, defaultVal);
      //else ini_write_real(section, key, defaultVal);
    
    // CLOSE
    ini_close();
}
