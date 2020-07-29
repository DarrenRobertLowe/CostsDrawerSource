///update_check_if_just_updated()

// Check if we have updated //
var fileName = "preferences.ini";

if !(file_exists(fileName))
{
    file = file_text_open_write(fileName);
    file_text_close(file);
}

if ( file_exists(fileName) )
{
    ini_open(fileName);
    
    section = "UPDATE";
    defaultVal = get_real_version(GM_version);
    key = "version";
    previousVersion = 0;
    
    if ( ini_key_exists(section,key) ) // can be used to detect an old install
    {
        previousVersion = ini_read_string(section, key, defaultVal);
    }
    else // can be used to detect a fresh install
    {
        ini_write_string(section, key, defaultVal);
    }
    
    show_debug_message("previousVersion is :"+string(round(previousVersion)));
    show_debug_message("current version is :"+string(get_real_version(GM_version)) );
    
    if (round(previousVersion) < get_real_version(GM_version))
    {
        open_whats_new();
        show_message("Costs Drawer has been updated to v"+string(GM_version) +"!");
    }
    
    ini_close();
}
