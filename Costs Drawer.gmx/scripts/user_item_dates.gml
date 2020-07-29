/// user_item_dates()

yearCarried  = false;
monthCarried = false;
dayCarried   = false;


draw_set_halign(fa_right);

textPosX = global.itemNoColumnX;

yearString  = string(dateYear);
previousMonthString = "";


// find the previous dates
get_previous_dates();


// format the month string
formatMonth(); // change "1" to "JAN", etc

previousYearString = string(previousYear);
dayString          = formatDay(dateDay);
previousDayString  = formatDay(previousDay);



// Make yearString = previousYear, etc
dates_decide_carried_and_shown();


//formatDay();


if (countMyItemNumber == true)
{
    // are we editing a date?
    check_edit_dates();
    
    
    // Interactivity
    if (editing_dates() == true)                    // if editing a date...
    {
        edit_dates();       // makes date input clearer
        edit_date();        // contains the actual editing code
    }
    else                                            // if not editing a date...
    {
        if mouseOverDate()  then dates_hover();     // hovering over dates
                            else draw_dates();      // not hovering over dates
    }
}
