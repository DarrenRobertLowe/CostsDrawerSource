/// xlsx_date();
/*
 *
*/
if (item.hasDate == false) then exit;

var yearString  = item.yearString;
var monthString = item.monthString;
var dayString   = item.dayString;

if (yearString  == global.ERROR_TEXT) then yearString   = "";
if (monthString == global.ERROR_TEXT) then monthString  = "";
if (dayString   == global.ERROR_TEXT) then dayString    = "";


if (iteration == 0) // slot 1
{
    monthAlreadyShown  = false;    //
    dayAlreadyShown    = false;    // so if we draw day is slot 1 or 2, it doesn't get drawn in 3
    
    if  (item.showYear == true)
    //and (item.dateYear > 0)
    {
        // show the year on the first row
        str = xlsx_convert_special_chars(yearString)
        sharedStringIndex = xlsx_write_sharedString(str);  // write the shared string and add to the sharedStringIndex
        
        file_text_write_string(file,'<c r= "A' + string(current_row) + '" t="s" s="0">')
        file_text_writeln(file);
        file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
        file_text_writeln(file);
        file_text_write_string(file,'</c>');
        file_text_writeln(file);
        
        exit;
    }
    
    if  (item.showYear  == false)
    and (item.showMonth == true)
    //and (item.dateMonth > 0)
    {
        // show the month on the first row
        str = xlsx_convert_special_chars(monthString)
        sharedStringIndex = xlsx_write_sharedString(str);  // write the shared string and add to the sharedStringIndex
        
        file_text_write_string(file,'<c r= "A' + string(current_row) + '" t="s" s="0">')
        file_text_writeln(file);
        file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
        file_text_writeln(file);
        file_text_write_string(file,'</c>');
        file_text_writeln(file);
        
        monthAlreadyShown = true;  // don't draw month again
        exit;
    }
    
    if  (item.showYear  == false)
    and (item.showMonth == false)
    and (item.showDay   == true)
    //and (item.dateDay > 0)
    {
        // show the day on the first row
        str = xlsx_convert_special_chars(dayString)
        sharedStringIndex = xlsx_write_sharedString(str);  // write the shared string and add to the sharedStringIndex
        
        file_text_write_string(file,'<c r= "A' + string(current_row) + '" t="s" s="0">')
        file_text_writeln(file);
        file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
        file_text_writeln(file);
        file_text_write_string(file,'</c>');
        file_text_writeln(file);
        
        monthAlreadyShown   = true;
        dayAlreadyShown     = true; // don't draw day again
        exit;
    }
}


if (iteration == 1) // slot 2
{
    if  (item.showYear == true) // if the year is shown in slot 1
    {
        // then this slot can only be month
        if  (item.showMonth == true)
        and (monthAlreadyShown == false)
        //and (item.dateMonth > 0)
        {
            // show the month in slot 2
            str = xlsx_convert_special_chars(monthString)
            sharedStringIndex = xlsx_write_sharedString(str);  // write the shared string and add to the sharedStringIndex
            
            
            file_text_write_string(file,'<c r= "A' + string(current_row) + '" t="s" s="0">')
            file_text_writeln(file);
            file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
            file_text_writeln(file);
            file_text_write_string(file,'</c>');
            file_text_writeln(file);
            
            exit;
        }
    }
    
    if (item.showYear == false) // if the year is NOT shown in slot 1
    {
        // then this slot can only be day
        if  (item.showDay == true)
        and (dayAlreadyShown == false)
        //and (item.dateDay > 0)
        {
            // show the day in slot 2
            
            str = xlsx_convert_special_chars(dayString)
            sharedStringIndex = xlsx_write_sharedString(str);  // write the shared string and add to the sharedStringIndex
            
            
            file_text_write_string(file,'<c r= "A' + string(current_row) + '" t="s" s="0">')
            file_text_writeln(file);
            file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
            file_text_writeln(file);
            file_text_write_string(file,'</c>');
            file_text_writeln(file);
            
            dayAlreadyShown = true;
            
            exit;
        }
    }
}


if (iteration == 2) // slot 3
{
    // this slot can only EVER be day
    if  (item.showDay == true)
    and (dayAlreadyShown == false)
    //and (item.dateDay > 0)
    {
        str = xlsx_convert_special_chars(dayString)
        sharedStringIndex = xlsx_write_sharedString(str);  // write the shared string and add to the sharedStringIndex
        
        file_text_write_string(file,'<c r= "A' + string(current_row) + '" t="s" s="0">')
        file_text_writeln(file);
        file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
        file_text_writeln(file);
        file_text_write_string(file,'</c>');
        file_text_writeln(file);
    }
}


