/// CREATE .XLSX FILE

// update items for export

//update_totals(0);   // totals
update_entire_document();
count_folios();
lastPage_VATNumbers.seniorLine = string(global.SENIOR_COUNSEL) +" " +string(lastPage_VATNumbers.seniorVATNo);
lastPage_VATNumbers.juniorLine = string(global.JUNIOR_COUNSEL) +" " +string(lastPage_VATNumbers.juniorVATNo);


with(USER_ITEM) // see fee later
{
    seeFeeLaterCheck2();
}

with ( INSTRUCTIONS_FEE_ITEM )
{
    if (linked == true)
    {
        shownDescription = master.shownDescription;
        formatDescription(shownDescriptionList,shownDescription,false);
    }
}


// setup
window_set_cursor(cr_hourglass); // change the mouse pointer
var appdata         = environment_get_variable("LOCALAPPDATA") + "\";
var progam_name     = string_replace(game_display_name," ","_");
var appdataFolder   = PROGRAM_APPDATA;
var xlsxFolder      = (PROGRAM_APPDATA + "\xlsx");
var targetTime      = ( (get_timer()/1000) + global.XLSX_Timout);


/// CLEANUP
// delete generated.xlsx if it already exists
if (file_exists("generated.xlsx")) then file_delete("generated.xlsx");


// Delete any existing XLSX Structure
if directory_exists("xlsx")
{
    directory_destroy("xlsx");
}
global.xlsxReady = 0;



// START
// Create a new XLSX directory structure
directory_create("xlsx");               
directory_create("xlsx\docProps");
directory_create("xlsx\_rels");
directory_create("xlsx\xl");
directory_create("xlsx\xl\_rels");
directory_create("xlsx\xl\worksheets");


// Create the required XML files
xlsx_contentTypes();    // create and fill the [Content_Types].xml file
xlsx_styles();          // create and fill the styles.xml (may need to be generated).
xlsx_rels();            // create and fill the .rels file
xlsx_workbook_rels();   // create and fill the workbook.xml.rels file
xlsx_core();            // create and fill the docProps\core.xml file
xlsx_app();             // create and fill the docProps\app.xml file
xlsx_custom();          // create and fill the docProps\custom.xml file
xlsx_workbook();        // create and fill the xl\workbook.xml file
xlsx_worksheet2();      // create and fill sheet 2 // not really needed
xlsx_worksheet3();      // create and fill sheet 3 // not really needed
xlsx_worksheet1();      // generated from the .cdf file
//xlsx_sharedStrings(); // created by xlsx_worksheet1();


// wait until all files exist
targetTime = ( (get_timer()/1000) + global.XLSX_Timout);
while (global.xlsxReady < 11)
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
            show_message("Problem exporting file (x01)! make sure the disk is not write protected!");
            window_set_cursor(cr_default);
            return false;
            exit;
        }
    }
}


// Create the bat file
var zipbat = file_text_open_write("createZip.bat");
file_text_write_string(zipbat, 'CScript "' +program_directory +'zip.vbs" "' +xlsxFolder+'" "'  +program_directory + 'generated.zip"');
file_text_close(zipbat);


// wait until the .bat exists
targetTime = ( (get_timer()/1000) + global.XLSX_Timout);
while !file_exists("createZip.bat") 
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
            show_message("Problem exporting file (x02)! creating BAT file for XLSX, make sure the disk is not write protected!");
            window_set_cursor(cr_default);
            return false;
            exit;
        }
    }
}


// once the .bat exists...
if file_exists("CreateZip.bat")
{
    shell_execute(appdataFolder + "\CreateZip.bat", 0);
}
else
{
    show_message("Problem exporting file (x03)! Please contact technical support if this problem persists!");
    window_set_cursor(cr_default);
    return false;
    exit;
}



// remove ".cdf" from name if there
var fileName;
var len = string_length(global.FILENAME);
if (string_copy(global.FILENAME,len-3,4) == (".cdf"))
{
    fileName = string_copy(global.FILENAME,0,len-4);
}
else
{
    fileName = global.FILENAME;
}


// prompt user for the save name and location
if (argument0 == "print")
{
    tFile = appdataFolder + "\generated.xlsx";
}
else // argument0 == "export"
{
    var tFile = get_save_filename_ext("Excel Compatible file|*.xlsx", fileName, global.USER_DIRECTORY, "Export as .xlsx");
    //show_message("tFile = " +string(tFile));
}


// remove ".cdf" if there again
var fileName;
var len = string_length(global.FILENAME);
if (string_copy(global.FILENAME,len-3,4) == (".cdf"))
{
    fileName = string_copy(global.FILENAME,0,len-4);
}
else
{
    fileName = global.FILENAME;
}


// add the .xlsx extension if it's not there
var len = string_length(tFile);
if ( string_copy(tFile,len-4,5) != (".xlsx") )
  then tFile += string(".xlsx");



// HACK! Printing wasn't normally working the first attempt,
// but it worked if we interrupted the user with a message.
// Instead, we could just wait some time.
if (tFile != "")
{
    targetTime = ( (get_timer()/1000) + global.XLSX_Timout);
    var targetTime1 = ( (get_timer()/1000) + global.PRINT_WAIT);
    while (global.TIMER < targetTime1)
    {
        updateTimer();
    }
    
    
    
    
    while !(file_exists("generated.zip"))
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
                show_message("Problem exporting file (er:Ex04)! Unable to generate zip. Appdata folder might be inaccessible.");
                window_set_cursor(cr_default);
                return false;
                exit;
            }
        }
    }
    
    // once the file exists...
    file_copy(working_directory + "generated.zip",tFile);
    
    
    // check for file completion
    // this isn't advisable as it will return true instantly
    // if the file already existed before export
    while !file_exists(tFile)
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
                show_message("Problem exporting file (x05)! XLSX file does not appear to be created.");
                window_set_cursor(cr_default);
                return false;
                exit;
            }
        }
    }
    
}
else {
    // user cancelled
    show_message("Export cancelled!")
    window_set_cursor(cr_default);
    return false;
    exit;
}


// reset the mouse pointer
window_set_cursor(cr_default);

// FINISH
return true;

