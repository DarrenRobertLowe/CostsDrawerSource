///get_expiry_warning_permission()
var fileName = "preferences.ini";
var status   = true; // show the message by default


if !(file_exists(fileName))
{
    file = file_text_open_write(fileName);
    file_text_close(file);
}

if ( file_exists(fileName) )
{
    // OPEN
    ini_open(fileName);
    
    // WRITE
    var section     = "PREFERENCES";    
    var key         = "show_expiry_warning";
    status = ini_read_real(section, key, true); // get the setting
    
    // CLOSE
    ini_close();
} 

return status;
