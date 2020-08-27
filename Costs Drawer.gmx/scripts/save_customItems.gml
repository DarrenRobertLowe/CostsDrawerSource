///save_customItems()
var filename = "";
var array    = -1;

if (global.BILL_COURT == "Circuit")
{
    array    = global.arrayOfCicruitCourtCustomItemValues;
    fileName = "cc_custom_items.txt";
}
else // if (global.BILL_COURT == "Highcourt")
{
    array    = global.arrayOfHighCourtCustomItemValues;
    fileName = "hc_custom_items.txt";
}


if  (fileName != "")
and (array != -1)
{
    // note: No need to delete the file first as it will be overwritten automatically.
    
    if !(file_exists(fileName))
    {
        file = file_text_open_write(fileName);
        file_text_close(file);
    }
    
    
    if ( file_exists(fileName) )
    {
        file = file_text_open_write(fileName);
        
            
            var size  = array_height_2d(array);
            
            for (var i=0; i<size; i++)
            {
                var description = array[i, 0];
                file_text_write_string(file, description);
                file_text_write_string(file, ";");

                var outlay      = array[i, 1];
                file_text_write_real(file, outlay);
                file_text_write_string(file, ";");
                
                var professional = array[i, 2];
                file_text_write_real(file, professional);
                file_text_write_string(file, ";");
                
                file_text_writeln(file);
            }
        
        
        // CLOSE
        file_text_close(file);
    }
    else
    {
        show_message("Unable to create "+string(filename)+" file at location!");
    }
}
else
{
    show_message("Unable to save custom items, court jurisdiction appears not to be set correctly!");
}
