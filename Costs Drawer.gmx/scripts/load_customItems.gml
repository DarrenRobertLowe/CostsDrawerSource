///load_customItems()
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
    if !(file_exists(fileName))
    {
        file = file_text_open_write(fileName);
        file_text_close(file);
    }
    
    
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
                  then exit;
                  else array[i,1] = val;
                
                // PROFESSIONAL
                val = load_customItems_getVal();
                if (val == -1)
                  then exit;
                  else array[i,2] = val;
                
                // NEXT LINE
                file_text_readln(file);
                i++;
            }
        
        
        // SET THE GLOBAL ARRAY
        if (global.BILL_COURT == "Circuit")
          then global.arrayOfCicruitCourtCustomItemValues = array;      // circuit court
          else global.arrayOfHighCourtCustomItemValues = array;         // highcourt
        
        
        // CLOSE
        file_text_close(file);
    }
    else
    {
        show_message("Unable to create "+string(filename)+" file at location!");
        exit;
    }
}
else
{
    show_message("Unable to load custom items, court jurisdiction appears not to be set correctly!");
    exit;
}
