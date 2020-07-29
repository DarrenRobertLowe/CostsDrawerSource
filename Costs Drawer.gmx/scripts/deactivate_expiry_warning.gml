///deactivate_expiry_warning()
/*
 * @return void
 * Updates the preferences.ini so the warning message for
 * nearing expiry date will NOT be shown again until a new
 * validation code is entered.
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
    var value       = false;
    var key         = "show_expiry_warning";
    ini_write_real(section, key, value);

    // CLOSE
    ini_close();
}
