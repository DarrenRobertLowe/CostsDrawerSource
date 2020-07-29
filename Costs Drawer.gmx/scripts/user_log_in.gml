/// user_log_in();

get_login();

if (login == 1)
{
    show_debug_message("validating login");
    
    // combine user and pass to form a string
    show_debug_message("userpass given as "+string(userpass) );
    
    
    // SEARCH THE DATABASE FOR USERPASS
    userpass = string_replace_all(userpass," ","");
    
    var ind = ds_list_find_index(codeList,userpass);
    
    if (ind == -1) // FAIL
    {
        if ( show_question("Invalid login! Try again?") )
        {
            login = -1;
            userpass = -1;
            user_log_in();  // start again
        }
        else
        {
            show_message("Costs Drawer requires authentication to run. Please enter a valid passcode, or contact support at "+string(DEVELOPER_EMAIL));
            game_end();
        }
    }
    else // SUCCESS
    {
        show_debug_message("CONVERTING DATES INTO REAL DATES");
        // get date of expiry from dateList
        var expiryDate = ds_list_find_value(dateList,ind);
        
        //extract year
        year = string_copy(expiryDate,1,4);
        show_debug_message("year extracted as "+string(year));
        expiryDate = string_delete(expiryDate,1,4);
        
        //extract month
        month = string_copy(expiryDate,1,2);
        show_debug_message("month extracted as "+string(month));
        expiryDate = string_delete(expiryDate,1,2);
        
        //extract day
        day = string_copy(expiryDate,1,2);
        show_debug_message("day extracted as "+string(day));
        expiryDate = string_delete(expiryDate,1,2);
        
        write_expiry_date();
        reset_expiry_warning(); // UPDATE PREFERENCES SO EXPIRY WARNING MESSAGE IS SHOWN AGAIN

        //LOGGED_IN = true;
        //accessGranted = true;
        alarm[0] = 1;
    }
}
