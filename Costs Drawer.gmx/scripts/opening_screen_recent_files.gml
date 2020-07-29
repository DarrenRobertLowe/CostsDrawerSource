///opening_screen_recent_files()

// draw the recent files
var list = MASTER.recentFiles;
var size = ds_list_size(list);

if (size > 0)
{
    var appdataFolder = PROGRAM_APPDATA;
    
    draw_set_font(font_GUI_large);
    draw_set_halign(fa_left);
    
    var sep             = (separation + 3);
    var strLen          = 0;
    var yy              = (y1 + 12);
    var xx              = (x1 + (global.estimatedCharacterWidth) );
    var scrollAreaWidth = ( (x2-xx) - (global.estimatedCharacterWidth) );
    var areaHeight      = (y2-y1);
    var maxDrawn        = 12; // (areaHeight/sep);
    
    
    // draw the items and buttons
    for(i=0; i<(maxDrawn); i++)
    {
        var fileFromList = ds_list_find_value(list,i);
        
        if !(is_undefined(fileFromList))
        {
            var y3 = ( (yy + (i*sep)) - 12);
            
            // highlight line
            if (mouseOverArea(xx,y3,x2,y3+sep))
            {
                draw_set_color(global.highlightColor)
                draw_set_alpha(global.highlightAlpha);
                draw_rectangle(xx,y3,x2,y3+sep,0);
                
                // CLICKING ON A RECENT FILE
                if (mouse_check_button_released(mb_left))
                {
                    // GET AROUND SANDBOXING BY COPYING FILE TO APPDATA AS "temp"
                    // delete old temp file just in case
                    var filePath = (appdataFolder + "\temp");
                    if (file_exists(filePath))
                      then file_delete(filePath);
                    
                    
                    /* if the file exists in any directory (including program directory), we'll copy
                     * it to filePath (i.e. "temp" file in appdata folder) 
                     * So if the file existed in the root directory, it also exists now as filePath.
                     * Or if it didn't exist, filePath will remain blank.
                     */
                    file_copy_win(fileFromList, filePath); //we don't need a check because A) it won't work and B) it's a dll command
                    
                    // HOTFIX: get's around "file not found" issue when a file was saved to program directory (21-Jun-2020)
                    /* Change the below to filePath = (etc...) to copy the file as named (e.g. asdf.cdf instead of "temp")
                     * WARNING: Not advised because the original file will still exist, and when loaded will be
                     * the old version, which will then be copied over the newer edited version. What a
                     * bloody mess!
                    */
                    fileFromList = recentFiles_change_filepath_if_programDirectory(fileFromList);
                    
                    
                    // replace "temp" file if the target file is found in the appdata folder
                    if ( file_exists(fileFromList) )
                    {
                        //show_message("fileFromList exists : "+string(fileFromList));
                        //show_message("copying to : "+string(filePath));
                        file_copy_win(fileFromList, filePath);
                    }
                    
                    
                    // Waiting for file to load...
                    while !(file_exists(filePath)) // while !(file_exists(filePath))
                    {
                        window_set_cursor(cr_hourglass);
                        recentFilesTimer--;                                                 // wait a few seconds for the file to exist
                        
                        if (recentFilesTimer <= 0) // file not found at location
                        {
                            window_set_cursor(cr_default)
                        
                            // FILE NOT FOUND
                            if (show_question("FILE NOT FOUND! Remove from list?"))
                            {
                                // if the user chooses to remove the file from the list...
                                ds_list_delete(list,i);                                     // delete the list entry
                                
                                var filePath = (appdataFolder + "\recent_files.txt");       // find the recent_files.txt
                                if file_exists(filePath) then file_delete(filePath);        // delete it
                                
                                var fileR;
                                fileR = file_text_open_write(working_directory+"\recent_files.txt");           // create a new recent_files.txt
                                for(var n=0; n<ds_list_size(list); n++)                     // iterate through our list
                                {
                                    var value = ds_list_find_value(list,n);
                                    file_text_write_string(fileR,value);                    // write each filePath to the recent_files.txt
                                    file_text_writeln(fileR);
                                }
                                file_text_close(fileR);
                            }
                            
                            recentFilesTimer = recentFilesTimerDefault;
                            exit;
                        }
                    }
                    
                    // load the file
                    window_set_cursor(cr_default)
                    recentFilesTimer = recentFilesTimerDefault;
                    
                    global.fileToOpen         = filePath;
                    global.USER_FILENAME      = filePath;
                    global.recentFileSelected = fileFromList;
                    
                    update_recent_files(fileFromList);
                    room_goto(WINDOW);
                }
            }
            
            // DRAW THE LIST OF RECENT FILES
            strLen          = string_length(fileFromList);
            var chars       = strLen-(global.recentFilesScroll-1)
            var charWidth   = global.estimatedCharacterWidth * 1.25;    // the width of a single character (estimated)
            var maxChars    = ((scrollAreaWidth) / charWidth);          // how long of the string we can show
            if (chars > maxChars) then chars = maxChars;
            str = filename_name(fileFromList);                          // grab only the filename after last "\"
            str = string_copy(str,global.recentFilesScroll,chars);      // grab only enough letters to fit the area
            // NOTE: The above code should actually be determined by a scrollbar
            
            draw_set_alpha(1);
            draw_set_color(global.itemTextColor);
            if (i < size)
            then draw_text(xx, yy+(i*sep), str);    // finall draw the list contents
        }
    }

    
    // CLEANUP
    reset_text();
}
