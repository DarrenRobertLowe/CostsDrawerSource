/// user_item_dates()

/* General Rules...
     *   The first item on a page always displays the Year and Month.
     *   Other items only show dates when they have changed.
     *   If an item doesn't have date data itself, it tries to find it from previous items.
     * 
     * When not editing and mouseOver...
     *   All 3 dates for the item are shown. Year, Month and Day.
     * 
     * When editing a date...
     *   All 3 dates are shown. year is slot 1, Month is slot 2, Day is slot 3.
     *   The specific date being edited is NOT drawn, but instead the tempYear, tempMonth, tempDay is.
    */


/// SETUP
reset_text();
draw_set_halign(fa_right);
textPosX    = global.itemNoColumnX;    //( global.dateColumnX + (global.dateColumnWidth/2) );
yearString  = "";
monthString = "";
dayString   = "";


// DATE VALIDATION //
//if (object_index = USER_ITEM)
//{
if (hasDate == true)
{
    // Validate Year
    if (validate_year(dateYear))
      then yearString = string(dateYear);
      else yearString = global.ERROR_TEXT;
    
    if (dateYear == 0)
      then yearString = "";
    
    
    // Validate Month
    if (validate_month(dateMonth))
      then monthString = string(dateMonth);
      else monthString = global.ERROR_TEXT;
    
    if (monthString != global.ERROR_TEXT)
    {
        if string(monthString) == "0" then monthString = "Month";
        if real(dateMonth) == 0  then monthString = "Month";
        if real(dateMonth) == 1  then monthString = "JAN";
        if real(dateMonth) == 2  then monthString = "FEB";
        if real(dateMonth) == 3  then monthString = "MAR";
        if real(dateMonth) == 4  then monthString = "APR";
        if real(dateMonth) == 5  then monthString = "MAY";
        if real(dateMonth) == 6  then monthString = "JUN";
        if real(dateMonth) == 7  then monthString = "JUL";
        if real(dateMonth) == 8  then monthString = "AUG";
        if real(dateMonth) == 9  then monthString = "SEP";
        if real(dateMonth) == 10 then monthString = "OCT";
        if real(dateMonth) == 11 then monthString = "NOV";
        if real(dateMonth) == 12 then monthString = "DEC";
    }
    
    
    
    // Validate Day
    if (validate_day(dateDay))
      then dayString = string(dateDay);
      else dayString = global.ERROR_TEXT;
    
    
    if (dayString != global.ERROR_TEXT)
    {
        /// Add enders to day
        if dateDay == 1
        or dateDay == 21
        or dateDay == 31
        then dayString = string(dateDay) + "st";
                    
        if dateDay == 2
        or dateDay == 22
        then dayString = string(dateDay) + "nd";
                    
        if dateDay == 3
        or dateDay == 23
        then dayString = string(dateDay) + "rd";
                    
        if  dateDay != 0
        and dateDay != 1
        and dateDay != 21
        and dateDay != 31
        and dateDay != 2
        and dateDay != 22
        and dateDay != 3
        and dateDay != 23
        then dayString = string(dateDay) + "th";
        
        if (dateDay = 0) then dayString = "";
    }
    
    
    
    
    /// while NOT editing anything...
    if  !(editingYear)
    and !(editingMonth)
    and !(editingDay)
    {
        
    } // end of not editing
    
    reset_text();
    
    
    
    
    /// while editing...
    if (editingYear)
    or (editingMonth)
    or (editingDay)
    {
        edit_dates();
    }
    
    if (lines < dateLines)
    {
        lines = dateLines;
    }
}
