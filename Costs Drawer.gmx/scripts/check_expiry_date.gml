///check_expiry_date()
// returns bool 
// true if in date and all is well
// else returns false
// 
// Reads the expiry file (if it exists) to get the encrypted date
// decrypts it
// changes the below variables

var year    = 2010;
var month   = 1;
var day     = 1;
var file    = -1;


if file_exists("chkd")
{
    file = file_text_open_read("chkd")
}
else
{
    show_debug_message("chkd file not found!");
    return false;
    exit;
}


var date = file_text_read_string(file);
if (date == "")
{
    show_debug_message("date not found in chkd file!");
    return false;
    exit;
}
else
{
    var dateStr = decrypt_number(date);
    

    if (dateStr != "invalid")
    {
        /// REVERSE THE DATES
        var str = "";
        
        
        day     = string_copy(dateStr,1,2);
        for (var i=string_length(day); i>0; i--)
        {
            str += string_char_at(day,i);
        }
        day = str;
        
        str = "";
        month   = string_copy(dateStr,3,2);
        for (var i=string_length(month); i>0; i--)
        {
            str += string_char_at(month,i);
        }
        month = str;
        
        str = "";
        year    = string_copy(dateStr,5,8)
        for (var i=string_length(year); i>0; i--)
        {
            str += string_char_at(year,i);
        }
        year = str;
        
        if is_undefined(day) then day = 0;
        day = real(day);
        
        if is_undefined(month) then month = 0;
        month = real(month);
        
        if is_undefined(year) then year = 0;
        year = real(year);
    }
    else
    {
        year  = 0;
        month = 0;
        day   = 0;
    }
}


yearExp  = real(year);    //2020;
monthExp = real(month);   //11;
dayExp   = real(day);     //01;

if  (year  > 1970) // WARNING! Dates prior to 1970 cause crash
and (month > 0)
and (day   > 0)
{
    licence_expiry_date = date_create_datetime(yearExp, monthExp, dayExp, 0, 0, 0); // the last 3 digits don't seem to do anything

    show_debug_message("year is "+string(year));
    show_debug_message("month is "+string(month));
    show_debug_message("day is "+string(day));
    
    show_debug_message("licence_expiry_date = "+string(licence_expiry_date));
    show_debug_message("date_current_datetime = "+string(date_current_datetime() ));
    
    
    
    // This function returns -1 if date1 is earlier, 0 if both dates are the same, and 1 if date1 is later...
    var inDate = date_compare_date(licence_expiry_date, date_current_datetime());
    
    if (inDate >= 0)
    {
        // check if it expires soon
        if (date_month_span(date_current_datetime(), licence_expiry_date) <= 1)
        {
            // if expiring soon, check if we should show the warning
            if (get_expiry_warning_permission())
            {
                var message  = ( "This licence will soon expire on " +string(dayExp) +"-" +string(monthExp) +"-" +string(yearExp) );
                var question = ( "#Do you want to be reminded at next start up?" );
                
                if (show_question(message + question) == false) // show the warning as a question
                  then deactivate_expiry_warning();
            }
        }
        
        return true;
        exit;
    }
    
    if (inDate < 0)
    {
        show_message("This licence has expired. Please enter an updated code or contact support to renew the licence.");
        return false;
        exit;
    }
}
else
{
    show_message("This licence is corrupted or out of date!  Please enter an updated code or contact support to renew the licence.");
    return false;
    exit;
}
