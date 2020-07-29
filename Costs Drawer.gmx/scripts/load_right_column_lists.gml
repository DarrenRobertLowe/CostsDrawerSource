/// load_right_column_lists(file)
//
file = argument0;

instance_create(x,y,witnesses_SCROLLBAR);

        // PLAINTIFFS //show_debug_message("loading Plaintiffs");
        // restart the PLAINTIFFS list
        if ds_exists(global.PLAINTIFFS,ds_type_list)
        {
            ds_list_destroy(global.PLAINTIFFS);
        }
        global.PLAINTIFFS = ds_list_create();
       
        
        // read the plaintiffs string line
        file_text_readln(file);                                                                     // move onto next line
        line = file_text_read_string(file);                                                         // take that line as a string
        var iteration = -1;
        var plaintiff   = -1;
        
        while (line != ";")
        {
            iteration ++; //show_debug_message("iteration = "+string(iteration));
            
            // separate each plaintiff and for each one create a new instance
            var fieldEnd    = string_pos("^",line)-1;                                               // find the string before "^"
            var name        = string_copy(line,0,fieldEnd);                                         // extract the plaintiff from the string
            
            if (name == "[andOthers]")
            {
                if exists(plaintiff)
                {
                    plaintiff.andOthers = true; //show_debug_message("plaintiff " +string(plaintiff) +" setting andOthers to true");
                }
            }
            else // regular name
            {
                plaintiff = instance_create(x,y,PLAINTIFF);
                plaintiff.description = name;
                plaintiff.alarm[0] = 1;
            }
            
            var len         = string_length(line);
            line            = string_copy(line,fieldEnd+2,len);                                     // trim that field from the string
        }
        
        
        
        // DEFENDANTS //show_debug_message("loading Defendants");
        // restart the PLAINTIFFS list
        if ds_exists(global.DEFENDANTS,ds_type_list)
        {
            ds_list_destroy(global.DEFENDANTS);
        }
        global.DEFENDANTS = ds_list_create();
        
        
        // read the defendants string line
        file_text_readln(file);                                                                     // move onto next line
        line = file_text_read_string(file);                                                         // take that line as a string
        var defendant   = -1;
        var iteration = -1;
        while (line != ";")
        {
            iteration ++; //show_debug_message("iteration = "+string(iteration));
            
            // separate each defendant and for each one create a new instance
            var fieldEnd    = string_pos("^",line)-1;                                               // find the string before "^"
            var name        = string_copy(line,0,fieldEnd); //show_debug_message("name=" +string(name) +".");
            
            if (name ==  "[andOthers]")
            {
                if exists(defendant)
                {
                    defendant.andOthers = true; //show_debug_message("defendant " +string(defendant) +" setting andOthers to true");
                }
            }
            else // regular name
            {
                defendant = instance_create(x,y,DEFENDANT);
                defendant.description = name;   // pass the name as description
                defendant.alarm[0] = 1;
            }
            
            var len         = string_length(line);
            line            = string_copy(line,fieldEnd+2,len);                                     // trim that field from the string
        }
        
        
        
        // COUNSEL
        file_text_readln(file);                                                                     // move onto next line
        line = file_text_read_string(file);
        global.SENIOR_COUNSEL = line;
        
        file_text_readln(file);                                                                     // move onto next line
        line = file_text_read_string(file);
        global.JUNIOR_COUNSEL = line;
        
        
        
        // WITNESSES
        if ds_exists(global.WITNESSES,ds_type_list)
        {
            ds_list_destroy(global.WITNESSES);
        }
        global.WITNESSES = ds_list_create();
        
        if !(instance_exists(witnesses_SCROLLBAR)) then instance_create(0,0,witnesses_SCROLLBAR);   // create the scrollbar
        
        file_text_readln(file);                                                                     // move onto next line
        line = file_text_read_string(file);
        
        
        
        // COSTS PURSUANT
        var item = firstPage_CostsType;             // create the costsType item

        file_text_readln(file);                                                                     // move onto next line
        item.line3 = file_text_read_string(file);
        
        file_text_readln(file);                                                                     // move onto next line
        item.line4 = file_text_read_string(file);
        
        
        
        // SOLICITOR'S ADDRESS
        var addressItem = firstPage_Address;         // create the Address item
        
        file_text_readln(file);                                                                     // move onto next line
        line = file_text_read_string(file);
        if line != ";" then addressItem.addressLine1 = line;
        
        file_text_readln(file);                                                                     // move onto next line
        line = file_text_read_string(file);
        if line != ";" then addressItem.addressLine2 = line;
        
        file_text_readln(file);                                                                     // move onto next line
        line = file_text_read_string(file);
        if line != ";" then addressItem.addressLine3 = line;
        
        file_text_readln(file);                                                                     // move onto next line
        line = file_text_read_string(file);
        if line != ";" then addressItem.addressLine4 = line;
        
        file_text_readln(file);                                                                     // move onto next line
        line = file_text_read_string(file);
        if line != ";" then addressItem.addressLine5 = line;
        
        file_text_readln(file);                                                                     // move onto next line
        line = file_text_read_string(file);
        if line != ";" then addressItem.addressLine6 = line;
        
        file_text_readln(file);                                                                     // move onto next line
        line = file_text_read_string(file);
        if line != ";" then addressItem.addressLine7 = line;
        
        //file_text_readln(file);                                                                     // move onto next line
        //line = file_text_read_string(file);
        //if line != ";" then addressItem.addressLine8 = line;
        
        
// RESET THE SCROLLBARS
global.warningsScroll   = 0;
global.currentWarningNumber = 0;

global.itemsScroll      = 0;
global.currentItemNumber = 0;

global.witnessesScroll  = 0;
global.currentWitnessNumber = 0;

global.plaintiffsScroll = 0;
global.currentPlaintiffNumber = 0;

global.defendantsScroll = 0;
global.currentDefendantNumber = 0;
