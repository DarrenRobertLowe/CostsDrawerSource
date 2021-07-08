///load_customItemsFile()
// this allows the user to manually load a custom items file.

var suggestedFileName = "";
var array    = -1;

/*
if (global.BILL_COURT == "Circuit")
{
    array    = global.arrayOfCicruitCourtCustomItemValues;
    suggestedFileName = "backup_cc_custom_items.txt";
}
else // if (global.BILL_COURT == "Highcourt")
{
    array    = global.arrayOfHighCourtCustomItemValues;
    suggestedFileName = "backup_hc_custom_items.txt";
}
*/


fileName = get_open_filename("text file|*.txt","Select a backup custom items file to load...");

if ( file_exists(fileName) )
{
    file = file_text_open_read(fileName);
    
    var str = "";
    var i   = 0;
    
    while !(file_text_eof(file))
    {
        line = file_text_read_string(file);
        
        // DESCRIPTION
        array[i,0] = load_customItems_getDescription();
        
        // OUTLAY
        val = load_customItems_getVal();
        if (val == -1)
          then {show_message("File not in correct format! Aborting!"); exit};
          else array[i,1] = val;
        
        // PROFESSIONAL
        val = load_customItems_getVal();
        if (val == -1)
          then {show_message("File not in correct format! Aborting!"); exit};
          else array[i,2] = val;
        
        // NEXT LINE
        file_text_readln(file);
        i++;
    }
    
    
    // SET THE GLOBAL ARRAY
    if (global.BILL_COURT == "Circuit")
      then global.arrayOfCicruitCourtCustomItemValues = array;      // circuit court
      else global.arrayOfHighCourtCustomItemValues = array;         // highcourt
    
    
    // Save the new custom items
    save_customItems(array);
    COMMON_ITEMS_CHECKER.alarm[0] = 1;  // update the list of items
    
    show_message("Finished loading Custom Items file.");
    // CLOSE
    file_text_close(file);
}
else
{
    show_message("Unable to load the selected file!");
    exit;
}
