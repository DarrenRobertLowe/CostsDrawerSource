/// print();
if (ds_list_size(global.WARNINGS) > 0)
{
    if !(show_question("WARNING! Your bill contains critical errors that should be fixed before setting down! #Proceed with print?"))
    then exit
}


export_excel("print"); // excel file is required as a target to print

// setup
var appdataFolder = PROGRAM_APPDATA;

var targetTime = ( (get_timer()/1000) + global.XLSX_Timout);

while !(file_exists(appdataFolder+"\generated.xlsx")) // wait...
{
    if (global.TIMER >= targetTime)
    {
        if show_question("This seems to be taking a long time. Continue waiting?")
        {
            targetTime = ( (get_timer()/1000) + global.XLSX_Timout);
        }
        else
        {
            show_message("Problem exporting file (er:Pr01)! Unable to generate xlsx. Appdata folder might be inaccessible.");
            window_set_cursor(cr_default);
            return false;
            exit;
        }
    }
}


// FINALLY
shell_do_at("print",appdataFolder+"\generated.xlsx",working_directory);
show_debug_message("Attempting to print xlsx...");


// reset the mouse pointer
window_set_cursor(cr_default);

// FINISH
return true;

