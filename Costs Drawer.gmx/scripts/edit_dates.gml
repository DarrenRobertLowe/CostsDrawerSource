/// edit_dates()

// setup font
textPosX = global.itemNoColumnX;

draw_dates_popup();


// show all the date slots
if (editingYear == true)
{
    // draw the tempYear
    draw_set_color(global.normalDateTextColor);
    if (tempYear == "0")
      then draw_text(textPosX,textPosY,"");             // slot 1
      else draw_text(textPosX,textPosY,tempYear);       // slot 1
    
    
    // draw the dateMonth
    if (monthString == "")
    {
        draw_set_color(global.grayText); 
        draw_text(textPosX,textPosY+(rowHeight),"Month");        // slot 2
    }
    else
    {
        draw_set_color(global.normalDateTextColor); 
        draw_text(textPosX,textPosY+(rowHeight),monthString);    // slot 2
    }

    
    // draw the dayString
    if (hasDay == true)
    {
        if (dayString == "")
        {
            draw_set_color(global.grayText);
            draw_text(textPosX,textPosY+(rowHeight*2),"Day");        // slot 3
        }
        else
        {
            draw_set_color(global.normalDateTextColor);
            draw_text(textPosX,textPosY+(rowHeight*2),dayString);    // slot 3
        }
    }
    
    // set the lines
    if (lines < 3) then lines = 3;
}





if (editingMonth == true)
{
    // draw the yearString
    if (yearString == "")
    {
        draw_set_color(global.grayText); 
        draw_text(textPosX,textPosY,"Year");                        // slot 2
    }
    else 
    {
        draw_set_color(global.normalDateTextColor); 
        draw_text(textPosX,textPosY,yearString);                    // slot 2
    }
    
    // draw the tempMonth
    draw_set_color(global.normalDateTextColor);
    draw_text(textPosX,textPosY+(rowHeight),tempMonth);             // slot 2
    
    
    // draw the dayString
    if (hasDay == true)
    {
        if (dayString == "")
        {
            draw_set_color(global.grayText);
            draw_text(textPosX,textPosY+(rowHeight*2),"Day");           // slot 3
        }
        else
        {
            draw_set_color(global.normalDateTextColor);
            draw_text(textPosX,textPosY+(rowHeight*2),dayString);       // slot 3
        }
    }
    
    
    // set the lines
    if lines < 3 then lines = 3;
}



if (editingDay == true)
{
    // draw the yearString
    if (yearString == "")
    {
        draw_set_color(global.grayText); 
        draw_text(textPosX,textPosY,"Year");                        // slot 2
    }
    else
    {
        draw_set_color(global.normalDateTextColor); 
        draw_text(textPosX,textPosY,yearString);                    // slot 2
    }
    
    // draw the monthString
    if (monthString == "")
    {
        draw_set_color(global.grayText); 
        draw_text(textPosX,textPosY+(rowHeight),"Month");           // slot 2
    }
    else
    {
        draw_set_color(global.normalDateTextColor); 
        draw_text(textPosX,textPosY+(rowHeight),monthString);       // slot 2
    }
    
    // draw the tempDay
    draw_set_color(global.normalDateTextColor);
    
    if ( string(tempDay) == "0" )
    {
        draw_text(textPosX,textPosY+(rowHeight*2),"");              // slot 3
    }
    else
    {
        draw_text(textPosX,textPosY+(rowHeight*2),tempDay);          // slot 3
    }

    // set the lines
    dateLines = 3;  // the number of lines to add based on the dates
}

