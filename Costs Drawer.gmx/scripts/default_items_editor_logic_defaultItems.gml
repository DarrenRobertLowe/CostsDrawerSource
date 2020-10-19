///default_items_editor_logic_defaultItems();
/*
var y1 = windowY1;
var y2 = windowY2;

var maxItem = min(size, 15); // 15 being the amount we can show on screen at once.
var startingIndex = 0;

for (var i=startingIndex; i<maxItem; i++)
{
    var yy          = (listStartY + (i*rowHeight));
    var y2          = (yy - rowHeight);
    var defaultDesc = array[i,0];
    var newDesc     = array[i,1];
    var defaultVal  = array[i,2];
    var newVal      = array[i,3];
    shownDescription = "";
    
    if (newDesc == "")
        then shownDescription = defaultDesc;
        else shownDescription = newDesc;
    
    
    
    /// DESCRIPTION
    // mouse clicking
    if ( mouse_over_popup_area(descriptionTextX, y2, descriptionColumnEndX, yy) )
    {
        if (mouse_check_button_released(mb_left))
        {
            fieldSelected = descriptionFieldIndex;
            
            // enteredValue-click on row
            if (indexSelected == i)
            {
                if (double_clicked())
                {
                    // get the new description
                    var str = get_string("Enter a description:", shownDescription);
                    
                    if (str != "")
                    {
                        // set the value
                        newDesc = str;
                        arrayOfHighCourtItemValues[i, newDescIndex] = newDesc;
                        array = arrayOfHighCourtItemValues;
                    }
                }
                else reset_clickTime();
            }
            else
            {
                indexSelected = i;
                reset_clickTime();
            }
        }
    }
    
    
    // keyboard enter
    if keyboard_check_pressed(vk_enter)
    {
        if (indexSelected == i)
        {
            // get the new description
            var str = get_string("Enter a description:", shownDescription);
            
            if (str != "")
            {
                // set the value
                newDesc = str;
                arrayOfHighCourtItemValues[i, newDescIndex] = newDesc;
                array = arrayOfHighCourtItemValues;
            }
        }
    }
    
    
    // if selected, draw a blue background and set text to white
    if (indexSelected == i)
    {
        draw_set_color(c_blue);
        draw_rectangle(descriptionTextX, y2, descriptionColumnEndX, yy, false);
        draw_set_color(c_white);
    }
    else draw_set_color(c_black);
    
    
    
    // draw text
    draw_set_halign(fa_left);
    draw_text(descriptionTextX,  yy, shownDescription);
    
    
    draw_set_color(c_black);
    draw_set_halign(fa_right);
    draw_text(newValueTextX,     yy, newVal);
    draw_text(defaultValueTextX, yy, defaultVal);
    
    // draw row 
    draw_line(windowX1, yy, windowX2, yy);
}
*/
