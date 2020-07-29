/// check_edit_dates()
/* Checks to see if we're editing a date
*/

if (selectedField == "year")
{
    if (editingYear == false)
    {
        set_unsaved();//
        // Initialize Year
        popupWaiting    = true;                                     // prevent other popups while we're doing this
        drawBorder("year");
        
        keyboard_string = "";
        tempYear        = string(dateYear);
        cursorPosition  = string_length(tempYear)+1;                // put cursor at end of number
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        
        editingYear = true;
    }
}


if (selectedField == "month")
{
    if (editingMonth == false)
    {
        // Initialize Month
        popupWaiting    = true;                                     // prevent other popups while we're doing this
        drawBorder("month");
        
        keyboard_string = "";
        tempMonth       = string(dateMonth);
        cursorPosition  = string_length(tempMonth)+1;                // put cursor at end of number
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        
        editingMonth = true;
    }
}

if (selectedField == "day")
{
    if (editingDay == false)
    {
        // Initialize Day
        popupWaiting    = true;                                     // prevent other popups while we're doing this
        drawBorder("day");
        
        keyboard_string = "";
        tempDay         = string(dateDay);
        cursorPosition  = string_length(dateDay)+1;                // put cursor at end of number
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        
        editingDay = true;
    }

}
