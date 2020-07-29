/// date_get_color("year" or "month" or "day")

// set the text color to default...
draw_set_color(global.normalDateTextColor);

  
    

// change the text colour under these circumstances...
if (argument0 == "year")
{
    if (yearString == string(previousYear))         // makes carried values from the previous year gray also
    {
        draw_set_color(global.grayText);
    }
    
    if (yearString == global.ERROR_TEXT)
    or (requiresYear == true) and (dateYear == 0)
    {
        draw_set_color(global.errorText);
    }
}


if (argument0 == "month")
{
    if (monthString == string(previousMonth))         // makes carried values from the previous month gray also
    or (dateMonth = 0)
    {
        draw_set_color(global.grayText);
    }
    
    if (monthString == global.ERROR_TEXT)
    or (requiresMonth == true) and (dateMonth == 0)
    {
        draw_set_color(global.errorText);
    }
}


if (argument0 == "day")
{
    if (dayString == string(previousDay))           // makes carried values from the previous month gray also
    or (dateDay == 0)
    {
        draw_set_color(global.grayText);
    }
    
    if (dayString == global.ERROR_TEXT)
    or (requiresDay == true) and (dateDay == 0)
    {
        draw_set_color(global.errorText);
    }
}
