/// button_scroll_right(item_SCROLLBAR_H);

if (argument0.scrollbarShown = true)
{
    /* count down */
    if (delayBeforeButtonRepeat > -1)                               // -1 is lowest
    {
         delayBeforeButtonRepeat --;                                // count down while button is held down
    }
    
    
    /* Functionality */
    if mouseOverSprite()                                            // if the mouse is over this button
    {
        if mouse_check_button_pressed(mb_left)                      // if the user is pressing this button
        {
            if (delayBeforeButtonRepeat <= -1) 
            {
                with (argument0)
                {
                    x += global.horizontalScrollAmount;
                    constrain_scrollbarH();
                    myScroll = get_right_column_xview_from_scrollbar();
                    //alarm[0] = 1;
                }
                    
                delayBeforeButtonRepeat = (global.buttonTimerDelay * room_speed);
            }
    
            /* start repeating button automatically */
            if (delayBeforeButtonRepeat == 0) 
            {
                with (argument0)
                {
                    x += global.horizontalScrollAmount;
                    constrain_scrollbarH();
                    myScroll = get_right_column_xview_from_scrollbar();
                    //alarm[0] = 1;
                }
                    
                delayBeforeButtonRepeat = (global.hScrollbarButtonRepeatSpeed * room_speed);
            }
        }
    }
    else
    {
        delayBeforeButtonRepeat = -1;
    }
    
    
    /* Change the SPRITE */
    if mouseOverSprite()
    {
        if mouse_check_button(mb_left)
        {
            image_index = 2;
        }
        else image_index = 1;
    }
    else image_index = 0;
    
}
