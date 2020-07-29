/// get_update_link_from_preferences();
/* NOTE: This is needed because we restart the program
 * after finding a download (due to the progress bar not 
 * working otherwise) and STARTUP would normally change
 * global.UPDATE_LINK back to the default. To get around
 * this problem we simply save the update link in the
 * preferences.ini and load it at startup after defining
 * the variable.
 * Note that when you restart costs drawer it will still
 * scrape the link from the website and update it as
 * normal. This script is really only used when restarting
 * due to updates.
*/


var fileName = "preferences.ini";

if ( file_exists(fileName) )
{
    ini_open(fileName);
    
    var section     = "UPDATE";
    var key         = "";
    var defaultVal  = "";
    
    
    defaultVal = global.UPDATE_LINK;
    key = "last_update_link";
    if ( ini_key_exists(section, key) )
      then global.UPDATE_LINK = ini_read_string(section, key, defaultVal);
    
    defaultVal = global.UPDATE_FORMAT;
    key = "last_update_format";
    if ( ini_key_exists(section, key) )
      then global.UPDATE_FORMAT = ini_read_string(section, key, defaultVal);
    
    ini_close();
}
