///save_customItems()
var filename = "";
//var array    = -1;

if (global.BILL_COURT == "Circuit")
{
    //array    = global.arrayOfCicruitCourtCustomItemValues;
    fileName = "cc_custom_items.txt";
}
else // if (global.BILL_COURT == "Highcourt")
{
    //array    = global.arrayOfHighCourtCustomItemValues;
    fileName = "hc_custom_items.txt";
}


if  (fileName != "")
and (array != -1)
{
    if (global.BILL_COURT == "Circuit")
      then tFileName = "backup_cc_custom_items.txt";
      else tFileName = "backup_hc_custom_items.txt";
    
    saveFile = get_save_filename("text files|*.txt", tFileName);
    
    
    if (saveFile != "") //( file_exists(fileName) )
    {
        file = file_text_open_write(saveFile);
        //file_text_close(file);
            //if (file_exists(file))
            //{
            var itemsArray;
            if (global.BILL_COURT == "Circuit")
                then itemsArray = global.arrayOfCicruitCourtCustomItemValues;
                else itemsArray = global.arrayOfHighCourtCustomItemValues;
  
                var size  = array_height_2d(itemsArray);
                
                for (var i=0; i<size; i++)
                {
                    var description = itemsArray[i, 0];
                    file_text_write_string(file, description);
                    file_text_write_string(file, "^");
    
                    var outlay      = itemsArray[i, 1];
                    file_text_write_string(file, outlay);
                    file_text_write_string(file, "^");
                    
                    var professional = itemsArray[i, 2];
                    file_text_write_string(file, professional);
                    file_text_write_string(file, "^");
                    
                    file_text_writeln(file);
                }
            //}
            //else
            //{
            ///    show_message("Unable to create file at location!");
            //    exit;
            //}
        
        // CLOSE
        file_text_close(file);
    }
    else exit;
}
else
{
    show_message("Unable to save custom items, court jurisdiction appears not to be set correctly!");
}
