///create_email()
// setup folders
var targetTime      = ( (get_timer()/1000) + global.XLSX_Timout);



// get user file (cdf only)
// NOTE: this doesn't work because attachments can't be automatically added through bat files
//file = get_open_filename_ext("cdf file|*.cdf", "", global.USER_DIRECTORY, "Select a cdf file to send");


// Delete the CreateZip.bat file if it already exists
if file_exists("email.bat")
{
    var tempFile = ("email.bat");
    file_delete(tempFile);
}


// create a text file and write this string to it...
var file = file_text_open_write("email.bat");

// in BAT files you need to escape special chars, so spaces become %%20, new lines become %%0D%%0A
var mailString = "START mailto:" +CDF_RECEIVE_EMAIL_ADDRESS +"?subject=Herewith%%20copy%%20of%%20bill%%20cdf%%20file%%20for%%20review^&body=Hi,%%0D%%0A%%0D%%0APlease%%20find%%20attached%%20.cdf%%20file%%0D%%0A%%0D%%0AThanks%%0D%%0A%%0D";
file_text_write_string(file,mailString);
file_text_close(file);



// wait until the .bat exists
var targetTime = ( (get_timer()/1000) + global.XLSX_Timout);
while !file_exists("email.bat") 
{
    updateTimer();
    
    if (global.TIMER >= targetTime)
    {
        if show_question("This seems to be taking a long time. Continue waiting?")
        {
            targetTime = ( (get_timer()/1000) + global.XLSX_Timout);
        }
        else
        {
            show_message("Problem exporting file (x02)! creating BAT file for email export, make sure the disk is not write protected!");
            window_set_cursor(cr_default);
            return false;
            exit;
        }
    }
}


// once the .bat exists...
if file_exists("email.bat")
{
    shell_execute(PROGRAM_APPDATA + "\email.bat", 0);
}
else
{
    show_message("Problem exporting file (x03)! creating BAT file for email export, make sure the disk is not write protected!");
    window_set_cursor(cr_default);
    return false;
    exit;
}

show_message("NOTE: If your email client does not open, you can send the email manually to " +string(CDF_RECEIVE_EMAIL_ADDRESS) );
