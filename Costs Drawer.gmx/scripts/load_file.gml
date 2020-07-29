/// load_file()
/* Deletes all items, including page numbers and totals.
 * Sets the page number back to 1.
 * Recreates each item line by line.
 * Checks for page threshold after each item is added,
 * and creates a new page and moves the item onto it where needed,
 * whilst also create the PAGE_NUMBER and TOTALS items.
 * Finally moves the BUTTON_CreateNewItem to the correct
 * position.
 * 
 * This script will have to do some error handling.
*/
docVer = 0;

global.USER_FILENAME = global.fileToOpen;

///// LOADING \\\\\
if (file_exists(global.USER_FILENAME))
{
    /// Create a fresh document
    clear_file();                               // (delete all ITEMS, including PAGE_NUMBERs, etc, and clears lists)
    
    if !instance_exists(DOC_ORGANIZER) then instance_create(0,0,DOC_ORGANIZER);
    with (MASTER)
    {
        load_preferences();
        set_relative_positions();   // needed just to initialize the variables, the values don't matter yet
    }
    
    
    /// open the file
    file = file_text_open_read(global.USER_FILENAME);
    
    // make sure the file isn't empty
    if !(file_text_eof(file))
    {
        var line = file_text_read_string(file);
        
        if (line = "")
        or (string_count(";",line) == 0)
        {
            show_message("Unable to load document as it appears to be corrupted!");
            exit;
        }
        
        
        
        // COMPATIBILITY CHECK
        // version number
        var fieldEnd        = string_pos(";", line)-1;                  // find the string before ";"
        var fileVersion     = string_copy(line, 0, fieldEnd);           // THIS WILL BE USED LATER WHEN "load_file" is e.g. "load_file_1.0.2.0"
        var fileVersionCheck= get_real_version(fileVersion);
        
        var fileVersionNoDots = string_replace_all(fileVersion, ".", "");
        var fileVersionNo   = real(fileVersionNoDots);
        var currentVersion  = get_real_version(GM_version);
        
        
        // CHECK THE docVer
        /* docVer is of course, short for document version.
         * It should be located directly after the version number on the first line e.g. 2.2.1.0;
         * The current docVer used in the check and written to saved files is the macro CURRENT_DOCUMENT_VERSION
        */     
         if (string_count("docVer:",line) > 0) // if there IS a "docVer:" 
         {
            var docVerPos   = (string_pos("docVer:", line) +7);
            var docVerStr   = string_copy(line, docVerPos, string_length(line));
            
            /* we could put a check here to see if the string is syntactically valid and 
             * reject it if it isn't. Right now, it doesn't crash as a result of being passed
             * letters and such, so it's pretty grand. Worst case is that a file will be messed
             * up when importing, but it will be the fault of whoever modified the file manually.
             */
            var docVer = get_real_version(docVerStr);
            //show_message("docVer ripped as "+string(docVer));
            if (docVer > get_real_version(CURRENT_DOCUMENT_VERSION))
            {
                show_message("Cannot open file!#File is from a newer version of Costs Drawer! (v"+string(fileVersion)+")#You must update Costs Drawer to the latest version in order to open this file!");
                new_file();
                exit;
            }
        }
        else // IF THERE'S NO docVer, CHECK PROGRAM VERSION
        {
            // if file is newer than our version
            if (fileVersionCheck > get_real_version(GM_version))
            {
                show_message("Cannot open file!#File is from a newer version of Costs Drawer! (v"+string(fileVersion)+")#You must update Costs Drawer to the latest version in order to open this file!");
                new_file();
                exit;
            }
        }
        
        
        
        // PUT SPECIFIC VERSIONS HERE FOR BACKWARDS COMPATIBILITY
        // e.g. if fileVersionNo < 1020 then load_file_1019()
        /// VALUES
        // myID count
        file_text_readln(file);                                 // move onto next line
        line                = file_text_read_string(file);
        var fieldEnd        = string_pos(";",line)-1;           // find the string before ";"
        global.itemID       = real(string_copy(line,0,fieldEnd));     // current item count for "myID"                                                    
        
        // Cirucit Court / High Court / District Court
        file_text_readln(file);                                 // move onto next line
        line                = file_text_read_string(file);
        var fieldEnd        = string_pos(";",line)-1;           // find the string before ";"
        global.BILL_COURT    = string_copy(line,0,fieldEnd);    // bill court (e.g. Circuit Court, High Court)
        
        // Cirucit Court / High Court / District Court
        file_text_readln(file);                                 // move onto next line
        line                = file_text_read_string(file);
        var fieldEnd        = string_pos(";",line)-1;           // find the string before ";"
        global.BILL_TYPE   = string_copy(line,0,fieldEnd);      // bill type (e.g. party and party or solicitor and client)
        
        // record number
        file_text_readln(file);                                 // move onto next line
        line                = file_text_read_string(file);
        var fieldEnd        = string_pos(";",line)-1;           // find the string before ";"
        global.recordNumber = string_copy(line,0,fieldEnd);     // record number
        
        // bill on behalf of
        file_text_readln(file);                                 // move onto next line
        line                = file_text_read_string(file);
        var fieldEnd        = string_pos(";",line)-1;           // find the string before ";"
        global.BILL_ON_BEHALF_OF = string_copy(line,0,fieldEnd);// plaintiff / defendant
        
        // total rows
        file_text_readln(file);                                 // move onto next line
        line                = file_text_read_string(file);
        var fieldEnd        = string_pos(";",line)-1;           // find the string before ";"
        var totalRows       = real(string_copy(line,0,fieldEnd));// plaintiff / defendant
        
        // view y pos
        file_text_readln(file);                                 // move onto next line
        line                = file_text_read_string(file);
        var fieldEnd        = string_pos(";",line)-1;           // find the string before ";"
        global.view_y_to_load   = real(string_copy(line,0,fieldEnd));// view y pos
        
        
        ds_list_clear(global.listOfItems);
        ds_list_clear(global.LAST_PAGE_ITEMS);
        ds_list_clear(global.WARNINGS);
        ds_list_clear(global.CAUTIONS);
        
        
        
        
        
        
        // CREATE THE FIRST PAGE OBJECTS...
        create_first_page();
        
        /* GET REGION INFO (Or whatever info the users decided to put there)
         * Applies only docVer 2.1+
         * Note: docVer 2.1 = 20100
         * Test: show_message("docVer of file is "+string(docVer));
         * Test: show_message("current document version of Costs Drawer is "+string(get_real_version(CURRENT_DOCUMENT_VERSION)))
         */
        if (docVer >= 20100)
        {
            var fieldEnd = 0;
            
            //show_message("docVer is "+string(docVer) +" which is >= than 20100");
            // region line 1
            file_text_readln(file);                                 // move onto next line
            line            = file_text_read_string(file);
            fieldEnd        = string_pos(";",line)-1;               // find the string before ";"
            firstPage_regionInfo_line1_docVer21.description = string_copy(line,0,fieldEnd);// view y pos
            
            // region line 2
            file_text_readln(file);                                 // move onto next line
            line            = file_text_read_string(file);
            fieldEnd        = string_pos(";",line)-1;               // find the string before ";"
            firstPage_regionInfo_line2_docVer21.description = string_copy(line,0,fieldEnd);// view y pos
             
            // region line 3
            file_text_readln(file);                                 // move onto next line
            line            = file_text_read_string(file);
            fieldEnd        = string_pos(";",line)-1;               // find the string before ";"
            firstPage_regionInfo_line3_docVer21.description = string_copy(line,0,fieldEnd);// view y pos
        }
        
        
        // LOAD PLAINTIFFS, DEFENDANTS, COUNSEL, WITNESSES, COSTS PURSUANT, and SOLICITOR'S ADDRESS
        load_right_column_lists(file);
        
        
            /// ITEMS
            /// CREATE & FILL THE ITEMS AND populate global.listOfItems ///
            while !(file_text_eof(file))                                    // repeat until end of file
            {
                file_text_readln(file);                                     // move onto next line
                var line = file_text_read_string(file);

                if  (line == "//endoffile") {break;}                        // end of file reached so stop looping
                
                // get the string before the first "^"
                var fieldEnd    = string_pos("^",line)-1;
                var obj         = string_copy(line,1,fieldEnd);

                
                // create the object instance and add to global.listOfItems
                var asset   = asset_get_index(obj);                             //show_message("asset = " +string(asset));      // DEBUG
                item        = instance_create(0,0,asset);                       // create the object (obj) e.g. "USER_ITEM"

                if (item_belongs_to_listOfItems(item))
                  then ds_list_add(global.listOfItems,item);                    // add to the global.listOfItems
                
                
                var len  = string_length(line);
                line     = string_copy(line,fieldEnd+2,len);                    // trim that field from the string
                
                
                if (item.object_index == GENERAL_INSTRUCTIONS_DETAILS)
                {
                    ds_list_add(global.LAST_PAGE_ITEMS,item)//item.alarm[0] = 1; // normal create event for instructions details
                }
                
                
                if  (item.object_index != lastPage_VATNumbers)
                and (item.object_index != lastPage_VATNotRecoverable)
                {
                    // FILL THE FIELDS
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.row        = real(string_copy(line,0,fieldEnd));       // row
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.myID       = real(string_copy(line,0,fieldEnd));       // myID
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.dateYear   = real(string_copy(line,0,fieldEnd));       // year
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.dateMonth  = real(string_copy(line,0,fieldEnd));       // month
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.dateDay    = real(string_copy(line,0,fieldEnd));       // day
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.showYear   = real(string_copy(line,0,fieldEnd));       // show year?
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.showMonth  = real(string_copy(line,0,fieldEnd));       // show month?
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.showDay    = real(string_copy(line,0,fieldEnd));       // show day?
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.countMyItemNumber   = real(string_copy(line,0,fieldEnd)); // count this item?
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.description = string_copy(line,0,fieldEnd);            // description
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    if (item.object_index != lastPage_drawingCostsAndCopy)
                    {
                        with(item){
                            alarm[2] = 1;
                        }
                    }
                    
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.lines      = real(string_copy(line,0,fieldEnd));       // lines
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    
                    // quantum
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.outlayText = string_copy(line,0,fieldEnd);             // outlayText
                    if (item.outlayText = " ")
                      then item.outlayText = "";
                      
                    if (item.outlayText = "-.--")
                    or (item.outlayText = "")
                      then item.outlay = 0;
                    else item.outlay     = real(item.outlayText);
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.professionalText = string_copy(line,0,fieldEnd);       // professionalText
                    if (item.professionalText = " ")
                      then item.professionalText = "";
                    
                    if (item.professionalText = "-.--")
                    or (item.professionalText = "")
                      then item.professional = 0;
                    else item.professional = real(item.professionalText);
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    
                    // reset quantum for calculated items
                    if (item.object_index == PAGE_NUMBER)
                    or (item.object_index == TOTALS)
                    or (item.object_index == lastPage_TOTAL)
                    or (item.object_index == lastPage_SUBTOTAL)
                    or (item.object_index == lastPage_ProVAT)
                    or (item.object_index == lastPage_OutlayToTotal)
                    {
                        item.outlay = 0;
                        item.professional = 0;
                        item.totalOutlay = 0;
                        item.totalProfessional = 0;
                        item.outlayText = "";
                        item.professionalText = "";
                    }
                    
                    
                    if (item.object_index == WITNESS)
                    {
                        fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                        item.name       = string_copy(line,0,fieldEnd);             // name
                        //show_message("WITNESS line : "+string(line));
                        len             = string_length(line);
                        line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                        ds_list_add(global.WITNESSES,item);
                        
                        var delbtn = instance_create(x,y,button_deleteWitness);
                        delbtn.myNumber = ds_list_size(global.WITNESSES);
                        delbtn.myValue  = item;
                        
                        var edtbtn = instance_create(x,y,button_editWitness);
                        edtbtn.myNumber = ds_list_size(global.WITNESSES);
                        edtbtn.myValue  = item;
                    }
                    
                    
                    // masterID
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.masterID   = real(string_copy(line,0,fieldEnd));       // master
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    // myFee
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.myFee      = real(string_copy(line,0,fieldEnd));       // myFee
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    // myStamp
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.myStamp    = real(string_copy(line,0,fieldEnd));       // myStamp
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    // myCommissionersFee
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.myCommissionersFee    = real(string_copy(line,0,fieldEnd));       // myStamp
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string 
                    
                    // linked?
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.linked     = real(string_copy(line,0,fieldEnd));       // myStamp
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string 
                    
                    // folios (drawing costs and copy)
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.folios     = real(string_copy(line,0,fieldEnd));       // 
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string 
                    
                    
                    // START WITNESSES ON NEXT PAGE
                    if (item.object_index == lastPage_WITNESSES)
                    {
                        fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                        global.startWitnessesOnNewPage = real(string_copy(line,0,fieldEnd));       // 
                        len             = string_length(line);
                        line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string 
                    }
                }
                
                
                if (item.object_index == lastPage_VATNumbers)
                {
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.row        = real(string_copy(line,0,fieldEnd));       // row
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.solicitorVATNo = string_copy(line,0,fieldEnd);
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.seniorVATNo = string_copy(line,0,fieldEnd);
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                    
                    fieldEnd        = string_pos("^",line)-1;                   // grab up to the "^"
                    item.juniorVATNo = string_copy(line,0,fieldEnd);
                    len             = string_length(line);
                    line            = string_copy(line,fieldEnd+2,len);         // trim that field from the string
                }
                
                
                
                /// COMPATABILITY ADJUSTMENTS
                if (fileVersionNo < 1100)
                {
                    if  (item.object_index == lastPage_drawingCostsAndCopy)
                    and (global.BILL_COURT == "Circuit")
                    {
                        item.professional = global.CC_drawingCostsAndCopy;
                        global.showUpdateMessage = true;
                        
                        ds_queue_enqueue(global.updateAffectedItemsQueue,"Row "+string(item.row)+" : drawing costs and copy");
                    }
                }
            }
            
            
            //////// SUCCESS ///////
            
            // update filename and directory
            global.FILENAME         = filename_name(global.fileToOpen);
            global.USER_FILENAME    = global.FILENAME;
            global.USER_DIRECTORY   = filename_path(global.fileToOpen);
            window_set_caption(global.FILENAME + " - Costs Drawer");
            
            
            //// window setup ////
            window_set_max_width(-1);
            window_set_max_height(-1);
            window_set_min_height(529);
            window_set_min_width(400);
            old_window_width = 1; // causes window resize to run which fixes gui
            
            
            screen_width  = display_get_width();
            screen_height = display_get_height();
            window_set_size(screen_width*.8,screen_height*.8);
            window_set_position(screen_width*.1, screen_height*.1);
            
            scrollAreaStartY = (global.pageStart + global.scrollbarButtonSize);
            //// //// //// //// ////
            
            create_GUI();
            reset_text();
            
            with MASTER{set_relative_positions();}
            global.totalRows = totalRows;
            
            view_yview[0] = 0;
            
            global.load_view_y = true; // this will move the view to the proper place

            // sort document again
            if exists(DOC_ORGANIZER)
            {
                with(DOC_ORGANIZER)
                {
                /// Manually Organize Doc
                startFrom = -1;
                alarm[0] = 1;
                }
            }
    }
    else
    {
        show_message("ERROR! Selected file appears to be empty!");
        exit;
    }
    
    file_text_close(file);  // CLOSE THE FILE
    global.SAVED_AS = false;
}
else
{
    // file not selected
}
