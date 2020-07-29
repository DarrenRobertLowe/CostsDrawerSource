/// draw_dates();
// SETUP

var slot1 = "";
var slot2 = "";
var slot3 = "";
dateLines = 0;


/*
var yearChanged  = false;
var monthChanged = false;
var dayChanged   = false;


if ( (dateYear > 0) and  (dateYear != previousYear) )
  then yearChanged = true;
  
if ( (dateMonth > 0) and (dateMonth != previousMonth) )
  then monthChanged = true;

if ( (dateDay > 0) and (dateDay != previousDay) )
  then dayChanged = true;
*/

/*
if   (dateYear == 0)
then yearString = previousYearString;

if   (dateMonth == 0)
then monthString = previousMonthString;

if   (dateDay == 0)
then dayString = previousDayString;
*/

  

// FIRST ON PAGE
if (firstOnPage == true)
{
    if (dayChanged == false) then draw_set_color(global.grayText);
                             else draw_set_color(global.normalDateTextColor);
                             if (global.PRINT_VIEW == true) then draw_set_color(c_black);
                             
    draw_text(textPosX,textPosY,yearString);
    
    if (monthChanged == false)  then draw_set_color(global.grayText);
                                else draw_set_color(global.normalDateTextColor);
                                if (global.PRINT_VIEW == true) then draw_set_color(c_black);
                                
    draw_text(textPosX,textPosY+(rowHeight),monthString);
    
    
    if (requiresDay == true)
    {
    if (dayChanged == false) then draw_set_color(global.grayText);
                             else draw_set_color(global.normalDateTextColor);
                             if (global.PRINT_VIEW == true) then draw_set_color(c_black);
                             
                             draw_text(textPosX,textPosY+(rowHeight*2),dayString)
    }
     
    exit;
}



// NOTHING THERE and not firstOnPage
if  (dateYear  == 0)
and (dateMonth == 0)
and (dateDay   == 0)
and (firstOnPage == false)
{
    draw_set_color(global.grayText);
    if (global.PRINT_VIEW == false)
      then draw_text(textPosX,textPosY,"Date");
    exit;
}
  
  
// ALL REQUIRED
if  (requiresYear  == true)
and (requiresMonth == true)
and (requiresDay   == true)
{
    date_get_color("year");
    if (dateYear > 0)
      then slot1 = yearString
      else slot1 = "Year";
    draw_text(textPosX,textPosY,slot1);
    
    
    date_get_color("month");
    if (dateYear > 0)
      then slot2 = monthString
      else slot2 = "Mnth";
    draw_text(textPosX,textPosY+(rowHeight),slot2);
    
    
    date_get_color("day");
    if (dateYear > 0)
      then slot3 = dayString
      else slot3 = "Day";
    draw_text(textPosX,textPosY+(rowHeight*2),slot3);
    
    exit;
}


// FIRST ON PAGE (YEAR AND MONTH)
if (yearChanged)    //( (dateYear > 0) and (dateYear != previousYear) )
or (firstOnPage == true)
{
    // YEAR in slot 1
    slot1 = yearString;
    if (showYear == false) then slot1 = "Year"
    
    dateLines = 1;                                                      // the number of lines to set as minimum
    
    date_get_color("year");
    draw_text(textPosX,textPosY,slot1);
    
    
    // MONTH in slot 2
    slot2 = monthString;
    if (showMonth == false) then slot2 = "Mnth"
    
    dateLines = 2;                                                      // the number of lines to set as minimum
    
    date_get_color("month");
    draw_text(textPosX,textPosY+(rowHeight),slot2);
    
    
    // DAY in slot 3 (only on some item types)
    if (requiresDay == true)
    {
        slot3 = dayString;
        if (showDay == false) then slot3 = "Day"
        
        dateLines = 3;                                                  // the number of lines to set as minimum
        
        date_get_color("day");
        draw_text(textPosX,textPosY+(rowHeight*2),slot3);
    }
    
    exit;
}



// NO YEAR DISPLAYED
if ( dateYear == 0 )
or ( yearChanged == false )
{
    if ( monthChanged )
    {
        // Month in slot 1
        slot1 = monthString;

        dateLines = 1;                                                  // the number of lines to add
        
        date_get_color("month");
        draw_text(textPosX,textPosY,slot1);
        
        
        // Day in slot 2
        slot2 = dayString;
        if (showDay == false) then slot2 = "Day"
        
        dateLines = 2;                                                  // the number of lines to add
        
        date_get_color("day");
        draw_text(textPosX,textPosY+(rowHeight),slot2);
        
        exit;
    }
    else // Day in slot 1
    {
        slot1 = dayString;
        if (showDay == false) then slot1 = "Date"
        
        dateLines = 1;                                                  // the number of lines to add
        
        date_get_color("day");
        draw_text(textPosX,textPosY,slot1);
        
        exit;
    }
}


// ONLY DAY
if  (dateYear  == 0)
and (dateMonth == 0)
and (dateDay > 0)
{
    // Day in slot 1
    slot1 = dayString;
    if (showDay == false) then slot1 = "Day"
    if (dayChanged == false) then slot1 = ""
    dateLines = 1;                                                      // the number of lines to add
    
    //date_get_color("day");
    draw_set_color(c_red);
    draw_text(textPosX,textPosY,slot1);
    
    exit;
}


if  (dateYear > 0)
and (dateMonth == 0)
{
    showDay = false;
    slot2 = "Mnth"
    draw_text(textPosX,textPosY,slot2);
    
    exit;
}





if  (showYear  == false)
and (showMonth == false)
{
    if (hasDay == true)
    {
        if (showDay == false)
        or (dayChanged == false)
        {
            date_get_color("day");
            draw_text(textPosX,(textPosY),"Day");
            exit;
        }
    }
    
    if (hasDay == false)
    {
        draw_set_color(c_blue)//global.grayText); //date_get_color("day");
        draw_text(textPosX,(textPosY),"Date");    
    }
}



if  (showYear  == false)
and (showMonth == false)
and (showDay   == false)
{
    date_get_color("day");
    draw_text(textPosX,(textPosY),"Date");    
}

