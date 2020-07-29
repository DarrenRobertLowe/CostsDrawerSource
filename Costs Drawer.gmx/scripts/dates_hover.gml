/// dates_hover();
/* 
 * Handles popup drawing, date drawing, and click events.
*/

//if (global.popup == -1) then global.popup = id;  // set the popup to this item
//if (global.popup == id)       // if popup is ours
if (global.datePopup == id)
{
    draw_dates_popup();         // draw popup area
    mouseOverChecks();          // draw highlights
    
    dateLines = 2;              // the number of lines to add based on the dates
    
    
    // DRAW ALL DATES WHEN MOUSE IS OVER...
    // YEAR
    if (hasYear == true)
    {
        if (dateYear == 0)                                                      // no data
        {
            draw_set_colour(global.highlightColor);                                   // gray text
            draw_text(textPosX+textMargin,textPosY,"Year");
        }
        else
        {
            if (yearString == global.ERROR_TEXT)
            {
                draw_set_color(global.errorText);                               // red text
                draw_text(textPosX,textPosY,string(dateYear));                  // show what the user typed
            }
            else // no error
            {                                                                  
                draw_set_colour(global.normalDateTextColor);                    // black text
                draw_text(textPosX,textPosY,yearString);
            }
        }
    }
    
    
    // MONTH
    if (hasMonth == true)
    {
        if (string(dateMonth) == "")    // no data
        or (string(dateMonth) == "0")   // no data
        {
            draw_set_colour(global.highlightColor);                                   // gray text
            draw_text(textPosX+textMargin,textPosY+(rowHeight),"Month");
        }
        else
        {
            if (monthString == global.ERROR_TEXT)
            {
                draw_set_color(global.errorText);                               // red text
                draw_text(textPosX,textPosY+(rowHeight),string(dateMonth));     // show what the user typed
            }
            else  // no error
            {
                draw_set_colour(global.normalDateTextColor);
                draw_text(textPosX,textPosY+(rowHeight),monthString);
            }
        }
    }
    
    
    // DAY (not included in user_items)
    if (hasDay == true)
    {
        dateLines = 3;      // the number of lines to add based on the dates
        
        if (dateDay == 0)   // no data
        {
            draw_set_colour(global.highlightColor);                                   // gray text
            draw_text(textPosX+textMargin,textPosY+(rowHeight*2),"Day");
        }
        else
        {
            if (dayString == global.ERROR_TEXT)
            {
                draw_set_color(global.errorText);                               // red text
                draw_text(textPosX,textPosY+(rowHeight*2),string(dateDay));     // show what the user typed
            }
            else // no error
            {
                draw_set_colour(global.normalDateTextColor);
                draw_text(textPosX,textPosY+(rowHeight*2),dayString);
            }
        }
    }


} // end of popup = id;
