///write_preferences()

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
    var value = 0;
    
    
    
    value = global.XLSX_Timout;
    key = "XLSX_Timout";
    ini_write_real(section, key, value);
    
    value = global.PRINT_WAIT;
    key = "PRINT_WAIT";
    ini_write_real(section, key, value);

    value = global.tooltipsDelay;
    key = "tooltipsDelay";
    ini_write_real(section, key, value);
    
    value = global.doubleClickTime;                                    
    key = "doubleClickTime";                                                
    ini_write_real(section, key, value);
    
    value = backupFrequency;                                           
    key = "backupFrequency";                                                
    ini_write_real(section, key, value);                        

    value = global.GUI_SCALE;
    key = "GUI_SCALE";
    ini_write_real(section, key, value);
    
    value = global.scale;
    key = "zoom";
    ini_write_real(section, key, value);
    
    value = global.DISPLAY_TIPS;
    key = "displayTipOfTheDay";
    ini_write_real(section, key, value);
      
    value = global.currentTip;
    key = "tip";
    ini_write_real(section, key, value);
    
    value = global.USER_DIRECTORY;
    key = "defaultSaveDirectory";
    ini_write_string(section, key, value);
    
    /// UPDATE /// ( also see retrieve_update_link() )
    section = "UPDATE";
    value = get_real_version(GM_version);
    key = "version";
    ini_write_real(section, key, value);
    
    /// DEBUG ///
    var section = "DEBUG";
    var key = "";
    var value = 0;
    
    value = false;//global.DEBUG_MODE; // always disable debug mode by default
    key = "DEBUG_MODE";
    ini_write_real(section, key, value);
    
    // CLOSE
    ini_close();
}
