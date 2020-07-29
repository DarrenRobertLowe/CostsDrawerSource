///reset_expiry_warning()
/*
 * @return void
 * Updates the preferences.ini so the warning message for
 * nearing expiry date will be shown again.
*/

var fileName = "preferences.ini";

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
    var value       = true;
    var key         = "show_expiry_warning";
    ini_write_real(section, key, value);

    // CLOSE
    ini_close();
}
