/// session_write_backupDeleteDate();
targetDateTime = argument0;

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
    
    ini_write_real( section, 'backupDeleteDate', targetDateTime );
    ini_close();
}
