/// writeFile()
global.SAVING = 1;

var file;

file = file_text_open_write(argument0);
    file_text_close(file);
    
    /* The following commented code is a reminder of what's needed when
     * trying to "Save" rather than "Save As...".
     * It's supposed to give an error message if the file can't be saved,
     * but it doesn't work.
     
     * To do something like that, we could take a hash of the file, try to save,
     * then after some period of time, check the hash of the new files against the
     * old one.
     */
    //if file_text_open_write(argument0){
        file = file_text_open_write(argument0)
    //}
    //else {
    //    show_message("Cannot write to file! Make sure the folder/file is not write protected! DEBUG: get_save_filename_ext() must be called first!");
    //}
        
        
        if file_exists(argument0)
        {
            // non-item info
            file_text_write_string(file,string(GM_version));            // version number of the program
            file_text_write_string( file, string(";"));
            
            file_text_write_string(file,"docVer:" +string(CURRENT_DOCUMENT_VERSION));      // docVer gets written to same line, do not add ";"
            
            file_text_writeln(file);
            file_text_write_string(file,string(global.itemID));         // myID count
            file_text_write_string( file, string(";"));
            
            file_text_writeln(file);
            file_text_write_string(file,string(global.BILL_COURT));     // highcourt, circuit court, district court
            file_text_write_string( file, string(";"));
            
            file_text_writeln(file);
            file_text_write_string(file,string(global.BILL_TYPE));      // Party & Party, Solicitor & Client, etc.
            file_text_write_string( file, string(";"));
            
            file_text_writeln(file);
            file_text_write_string( file, string(global.recordNumber) );
            file_text_write_string( file, string(";"));
            
            file_text_writeln(file); 
            file_text_write_string( file, string(global.BILL_ON_BEHALF_OF));
            file_text_write_string( file, string(";"));
            
            file_text_writeln(file);
            file_text_write_string( file, string(global.totalRows));
            file_text_write_string( file, string(";"));
            
            file_text_writeln(file);    
            file_text_write_string( file, string(view_yview[0]));       // view y pos
            file_text_write_string( file, string(";"));
            
            
            
            //// FIRST PAGE OBJECTS...
            
            /// REGION INFO LINES
            file_text_writeln(file);  // new line
            file_text_write_string( file, firstPage_regionInfo_line1_docVer21.description );
            file_text_write_string( file, string(";"));
            file_text_writeln(file);
            file_text_write_string( file, firstPage_regionInfo_line2_docVer21.description );
            file_text_write_string( file, string(";"));
            file_text_writeln(file);
            file_text_write_string( file, firstPage_regionInfo_line3_docVer21.description );
            file_text_write_string( file, string(";"));
            
            
            // PLAINTIFFS
            file_text_writeln(file);                                            // new line
            for(var i=0; i<ds_list_size(global.PLAINTIFFS); i++)
            {
                var item     = ds_list_find_value(global.PLAINTIFFS, i);
                var nameList = item.descriptionList;
                var str      = "";
                
                for(var n = 0; n<ds_list_size(nameList); n++)
                {
                    // concatenate the list into a single string
                    str += string(ds_list_find_value(nameList,n));
                }
                
                file_text_write_string(file, str);
                file_text_write_string(file, "^");                              // separator for each name
                
                // and others?
                if (item.andOthers == true)
                {
                    file_text_write_string(file, "[andOthers]");
                    file_text_write_string(file, "^");                          // separator for each name
                }
            }
            file_text_write_string( file, string(";")); // end plaintiffs
            
            
            // DEFENDANTS
            file_text_writeln(file);                                            // new line
            for(var i=0; i<ds_list_size(global.DEFENDANTS); i++)
            {
                var item = ds_list_find_value(global.DEFENDANTS, i);
                var nameList = item.descriptionList;
                var str = "";
                for(var n=0; n<ds_list_size(nameList); n++)
                {
                    // concatenate the list into a single string
                    str += string(ds_list_find_value(nameList,n));
                }
                
                file_text_write_string(file, str);
                file_text_write_string(file, "^");                              // separator for each field
                
                // and others?
                if (item.andOthers == true)
                {
                    file_text_write_string(file, "[andOthers]");
                    file_text_write_string(file, "^");                           // separator for each field
                }
            }
            file_text_write_string( file, string(";")); // end plaintiffs
            
            
            // COUNSEL
            file_text_writeln(file);                                        // new line
            file_text_write_string( file, string(global.SENIOR_COUNSEL));
            file_text_writeln(file);
            file_text_write_string( file, string(global.JUNIOR_COUNSEL));
            
            
            // WITNESSES
            file_text_writeln(file);                                        // new line
            for(var i=0; i<ds_list_size(global.WITNESSES); i++)
            {
                var val = ds_list_find_value(global.WITNESSES,i);
                var witnessName = val.name;
                file_text_write_string( file, string(witnessName) );
                file_text_write_string(file,"^");                           // separator for each field
            }
            file_text_write_string( file, string(";"));
            
            
            // COSTS PURSUANT          
            file_text_writeln(file); 
            file_text_write_string( file, string(firstPage_CostsType.line3));
            
            file_text_writeln(file); 
            file_text_write_string( file, string(firstPage_CostsType.line4));
            
            
            // SOLICITOR'S ADDRESS
            file_text_writeln(file);                                        // new line
            if (firstPage_Address.addressLine1 == firstPage_Address.defaultAddressLine1)
              then file_text_write_string( file, string(";"));
              else file_text_write_string( file, string(firstPage_Address.addressLine1));
            
              
            file_text_writeln(file);
            if (firstPage_Address.addressLine2 == firstPage_Address.defaultAddressLine2)
              then file_text_write_string( file, string(";"));
              else file_text_write_string( file, string(firstPage_Address.addressLine2));
            
            
            file_text_writeln(file);
            if (firstPage_Address.addressLine3 == firstPage_Address.defaultAddressLine3)
              then file_text_write_string( file, string(";"));
              else file_text_write_string( file, string(firstPage_Address.addressLine3));
            
            file_text_writeln(file); 
            if (firstPage_Address.addressLine4 == firstPage_Address.defaultAddressLine4)
              then file_text_write_string( file, string(";"));
              else file_text_write_string( file, string(firstPage_Address.addressLine4));
            
            file_text_writeln(file); 
            if (firstPage_Address.addressLine5 == firstPage_Address.defaultAddressLine5)
              then file_text_write_string( file, string(";"));
              else file_text_write_string( file, string(firstPage_Address.addressLine5));
            
            file_text_writeln(file); 
            if (firstPage_Address.addressLine6 == firstPage_Address.defaultAddressLine6)
              then file_text_write_string( file, string(";"));
              else file_text_write_string( file, string(firstPage_Address.addressLine6));
            
            file_text_writeln(file); 
            if (firstPage_Address.addressLine7 == firstPage_Address.defaultAddressLine7)
              then file_text_write_string( file, string(";"));
              else file_text_write_string( file, string(firstPage_Address.addressLine7));
            
            /*
            file_text_writeln(file); 
            if (firstPage_Address.addressLine8 == firstPage_Address.defaultAddressLine8)
              then file_text_write_string( file, string(";"));
              else file_text_write_string( file, string(firstPage_Address.addressLine8));
            */
            
            file_text_writeln(file);                                            // new line
            
                        
            // ITEM CONTENT
            for(var i=0; i<ds_list_size(global.listOfItems); i++)               // iterate through the list of items
            {  
                var a     = ds_list_find_value(global.listOfItems,i);
                var index = object_get_name(a.object_index)
                
                //if  index != "PAGE_NUMBER"
                //and index != "TOTALS"
                if index != "firstPage_CourtInfo"
                and index != "firstPage_record_number"
                and index != "firstPage_Plaintiffs"
                and index != "PLAINTIFF"
                and index != "DEFENDANT"
                and index != "firstPage_Defendants"
                and index != "firstPage_Address"
                and index != "firstPage_CostsType"
                and index != "firstPage_regionInfo_line1_docVer21"
                and index != "firstPage_regionInfo_line2_docVer21"
                and index != "firstPage_regionInfo_line3_docVer21"
                //and index != "BUTTON_CreateNewItem"
                {
                    // object index
                    file_text_write_string(file,string(index));
                    
                    // row
                    file_text_write_string(file,"^");                           // separator for each field
                    file_text_write_real(file,a.row);
                    
                    // myID
                    file_text_write_string(file,"^");
                    file_text_write_real(file,a.myID);
                    
                    // year
                    file_text_write_string(file,"^");
                    file_text_write_real(file,a.dateYear);
                    
                    // month text
                    file_text_write_string(file,"^");
                    if (a.dateMonth != "") {
                        file_text_write_string(file, a.dateMonth);
                    }
                    else {
                        file_text_write_string(file, " ");                      // make sure something gets written
                    }
                    
                    
                    // dates
                    file_text_write_string(file,"^");
                    file_text_write_real(file,a.dateDay);
                    file_text_write_string(file,"^");
                    file_text_write_real(file,a.showYear);
                    file_text_write_string(file,"^");
                    file_text_write_real(file,a.showMonth);
                    file_text_write_string(file,"^");
                    file_text_write_real(file,a.showDay);
                    file_text_write_string(file,"^");
                    
                    // item count?
                    file_text_write_real(file,a.countMyItemNumber);
                    file_text_write_string(file,"^");
                    
                    
                    // description text
                    if (a.description != "") {
                        file_text_write_string(file,a.description);
                    }
                    else {
                        file_text_write_string(file, " ");                      // make sure something gets written
                    }
                    
                    file_text_write_string(file,"^");
                    
                    
                    // lines count
                    file_text_write_real(file,a.lines);
                    file_text_write_string(file,"^");
                    
                    
                    // outlayText
                    if (a.outlayText != "") {
                        file_text_write_string(file,a.outlayText);
                    }
                    else {
                        file_text_write_string(file, " ");                      // make sure something gets written
                    }
                    file_text_write_string(file,"^");
                    
                    
                    // professionalText
                    if (a.professionalText != "") {
                        file_text_write_string(file,a.professionalText);
                    }
                    else {
                        file_text_write_string(file, " ");                      // make sure something gets written
                    }
                    file_text_write_string(file,"^");
                    
                    // MASTER
                    file_text_write_string(file,a.masterID);
                    file_text_write_string(file,"^");
                    
                    // myFee
                    if (a.myFee == -3) then file_text_write_real(file,-3);        // this means the instructions fee was deleted (item had one but the user edited or deleted it, thus unlinking it)
                    else
                    {
                        if (a.myFee == -1)
                          then file_text_write_real(file,-1);                         // -1 means that we  DO NOT  have a fee.
                          else file_text_write_real(file,-2);                         // -2 means that we    DO    have a fee (e.g. myFee = 100123). The value is given by the loaded instructions_fee_item itself.
                    }
                    file_text_write_string(file,"^");
                    
                    
                    // myStamp
                    if (a.myStamp == -1)
                      then file_text_write_real(file,-1);                         // -1 means that we  DO NOT  have a stamp.
                      else file_text_write_real(file,-2);                         // -2 means that we    DO    have a stamp. (the value is actually given by the loaded instructions_fee_item itself)
                    file_text_write_string(file,"^");
                    
                    // myCommissionersFee
                    if (a.myCommissionersFee == -1)
                      then file_text_write_real(file,-1);                         // -1 means that we  DO NOT  have a com fee.
                      else file_text_write_real(file,-2);                         // -2 means that we    DO    have a com fee. (the value is actually given by the loaded instructions_fee_item itself)
                    file_text_write_string(file,"^");
                    
                    // linked
                    file_text_write_real(file,a.linked);                          // 0 or 1
                    file_text_write_string(file,"^");
                    
                    // folios
                    file_text_write_real(file,a.folios);                          // for drawing costs and copy
                    file_text_write_string(file,"^");
                    /*
                    // isBlock (should be removed as we don't need it now)
                    file_text_write_string(file,a.isBlock);
                    file_text_write_string(file,"^");
                    
                    // blockParent (should be removed as we don't need it now)
                    file_text_write_string(file,a.blockParent);
                    file_text_write_string(file,"^");
                    
                    
                    // blockChildList (should be removed as we don't need it now)
                    if (a.hasBlockChild == true)
                      then file_text_write_real(file,-2);                         // -2 means that we    DO    have a child. (the value is actually given by the loaded child itself)
                      else file_text_write_real(file,-1);                         // -1 means that we  DO NOT  have a child.
                    file_text_write_string(file,"^");
                    
                    // instructionsFee
                    file_text_write_real(file,a.instructionsFee)
                    file_text_write_string(file,"^");
                    
                    
                    // See Fee Later
                    file_text_write_real(file,a.seeFeeLater)
                    file_text_write_string(file,"^");
                    */
                    
                    // END
                    file_text_write_string(file,";");                           // marks the end of a line/item
                    file_text_writeln(file);
                }
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            // LAST PAGE ITEMS CONTENT
            for(var i=0; i<ds_list_size(global.LAST_PAGE_ITEMS); i++)           // iterate through the list of items
            {  
                var a     = ds_list_find_value(global.LAST_PAGE_ITEMS,i);
                var index = object_get_name(a.object_index)
                
                if  (index != "PAGE_NUMBER")
                and (index != "TOTALS")
                and (index != "lastPage_VATNumbers")
                and (index != "lastPage_VATNotRecoverable")
                {
                    //object_index;
                    file_text_write_string(file,string(index));
                    
                    // row
                    file_text_write_string(file,"^");                           // separator for each field
                    file_text_write_real(file,a.row);
                    
                    // myID
                    file_text_write_string(file,"^");
                    file_text_write_real(file,a.myID);
                    
                    // year
                    file_text_write_string(file,"^");
                    file_text_write_real(file,a.dateYear);
                    
                    
                    // month text
                    file_text_write_string(file,"^");
                    if (a.dateMonth != "")
                    {
                        file_text_write_string(file, a.dateMonth);
                    }
                    else file_text_write_string(file, " ");                     // make sure something gets written

                    // dates
                    file_text_write_string(file,"^");
                    file_text_write_real(file,a.dateDay);
                    file_text_write_string(file,"^");
                    file_text_write_real(file,a.showYear);
                    file_text_write_string(file,"^");
                    file_text_write_real(file,a.showMonth);
                    file_text_write_string(file,"^");
                    file_text_write_real(file,a.showDay);
                    file_text_write_string(file,"^");
                    
                    
                    // item count? /  (global.startWitnessesOnNewPage)
                    file_text_write_real(file,a.countMyItemNumber);
                    file_text_write_string(file,"^");

                        
                    
                    
                    // description text
                    if (a.description != "")
                    {
                        file_text_write_string(file,a.description);
                    }
                    else file_text_write_string(file, " ");                     // make sure something gets written
                    file_text_write_string(file,"^");
                    
                    
                    // lines count
                    file_text_write_real(file,a.lines);
                    file_text_write_string(file,"^");
                    
                    
                    // outlayText
                    if (a.outlayText != "")
                    {
                        file_text_write_string(file,a.outlayText);
                    }
                    else file_text_write_string(file, " ");                     // make sure something gets written
                    file_text_write_string(file,"^");
                    
                    
                    // professionalText
                    if (a.professionalText != "")
                    {
                        file_text_write_string(file,a.professionalText);
                    }
                    else file_text_write_string(file, " ");                     // make sure something gets written
                    file_text_write_string(file,"^");
                    
                    if (a.object_index == WITNESS)
                    {
                        // lines count
                        file_text_write_string(file,a.name);
                        file_text_write_string(file,"^");
                    }

                    // MASTER
                    file_text_write_string(file,a.masterID);
                    file_text_write_string(file,"^");
                    
                    /// myFee
                    if (a.myFee == -3) then file_text_write_real(file,-3);        // this means the instructions fee was deleted (item had one but the user edited or deleted it, thus unlinking it)
                    else
                    {
                        if (a.myFee == -1)
                          then file_text_write_real(file,-1);                         // -1 means that we  DO NOT  have a fee.
                          else file_text_write_real(file,-2);                         // -2 means that we    DO    have a fee (e.g. myFee = 100123). The value is given by the loaded instructions_fee_item itself.
                    }
                    file_text_write_string(file,"^");
                    
                    // myStamp
                    if (a.myStamp == -1)
                      then file_text_write_real(file,-1);                         // -1 means that we  DO NOT  have a fee and should create one.
                      else file_text_write_real(file,-2);                         // -2 means that we    DO    have a fee. (the value is actually given by the loaded instructions_fee_item itself)
                    file_text_write_string(file,"^");
                    
                    //myCommissionersFee
                    if (a.myCommissionersFee == -1)
                      then file_text_write_real(file,-1);                         // -1 means that we  DO NOT  have a fee and should create one.
                      else file_text_write_real(file,-2);                         // -2 means that we    DO    have a com fee. (the value is actually given by the loaded instructions_fee_item itself)
                    file_text_write_string(file,"^");
                   
                     // linked
                    file_text_write_real(file,a.linked);                          // 0 or 1
                    file_text_write_string(file,"^");
                    
                    // folios
                    file_text_write_real(file,a.folios);                          // for drawing costs and copy
                    file_text_write_string(file,"^");
                    
                    /*
                    // isBlock(should be removed as we don't need it now)
                    file_text_write_string(file,a.isBlock);
                    file_text_write_string(file,"^");
                    
                    // blockParent
                    file_text_write_string(file,a.blockParent);
                    file_text_write_string(file,"^");
                    
                    // blockChildList (should be removed as we don't need it now)
                    if (a.hasBlockChild == true)
                      then file_text_write_real(file,-2);                         // -2 means that we    DO    have a child. (the value is actually given by the loaded child itself)
                      else file_text_write_real(file,-1);                         // -1 means that we  DO NOT  have a child.
                    */

                    if (a.object_index == lastPage_WITNESSES) // (global.startWitnessesOnNewPage)
                    {
                        file_text_write_real(file,global.startWitnessesOnNewPage);
                        file_text_write_string(file,"^");
                    }
                        
                    // END
                    file_text_write_string(file,";");                           // marks the end of a line/item
                    file_text_writeln(file);
                }
                
                
                /// VAT NOT RECOVERABLE
                if  (index == "lastPage_VATNotRecoverable")
                {
                    file_text_write_string(file,string(index));
                    file_text_write_string(file,"^");                               // separator for each field
                    file_text_write_real(file,lastPage_VATNotRecoverable.row);
                    
                    file_text_write_string(file,";");                               // marks the end of a line/item
                    file_text_writeln(file);
                }
                
                
                /// VAT NUMBERS
                if (index == "lastPage_VATNumbers")
                {
                    file_text_write_string(file,string(index));
                    file_text_write_string(file,"^");                               // separator for each field
                    file_text_write_real(file,lastPage_VATNumbers.row);
                    file_text_write_string(file,"^");
                    file_text_write_string(file,lastPage_VATNumbers.solicitorVATNo);
                    file_text_write_string(file,"^");
                    file_text_write_string(file,lastPage_VATNumbers.seniorVATNo);
                    file_text_write_string(file,"^");
                    file_text_write_string(file,lastPage_VATNumbers.juniorVATNo);
                    file_text_write_string(file,"^");
                    
                    file_text_write_string(file,";");                               // marks the end of a line/item
                    file_text_writeln(file);
                }
            }
            
            file_text_write_string(file,"//endoffile");
            file_text_close(file);
        }
        else {show_message("Error - Could not write to file!");}
        
        
// FINISH UP
if file_exists(file) then file_text_close(file);

set_saved();

window_set_cursor(cr_default);                      // reset the mouse pointer
