/// default_items_editor_draw_data()

draw_set_font(font_GUI);

var y1 = windowY1;
var y2 = windowY2;


// draw the white background
draw_set_color(c_white);
draw_rectangle(windowX1, y1, windowX2, y2, false);

// draw the popup border
draw_set_color(c_dkgray);
draw_rectangle(windowX1-1, y1, windowX2, y2, true);



// draw header and footer background rectangles
// background
draw_set_color(c_ltgray);
draw_rectangle(windowX1, y1,                        windowX2, headerY,       false);
draw_rectangle(windowX1, (customHeaderY-rowHeight), windowX2, customHeaderY, false);
draw_rectangle(windowX1, footerY1, windowX2, footerY2, false);
// border
draw_set_color(c_dkgray);
draw_rectangle((windowX1 - 1), (y1-1),                        (windowX2),   (headerY),          true);
draw_rectangle((windowX1 - 1), (customHeaderY-(rowHeight+1)), (windowX2),   (customHeaderY),    true);
draw_rectangle((windowX1 - 1), footerY1, (windowX2),   footerY2,    true);

// draw columns
draw_set_color(c_dkgray);
draw_line(newValueColumnX,      y1,   newValueColumnX,        y2);
draw_line(defaultValueColumnX,  y1,   defaultValueColumnX,    y2);




// draw headers
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_text(headerDescriptionX,   headerY, "Default Item Description");
draw_text(headerNewValueX,      headerY, "New Value");
draw_text(headerDefaultValueX,  headerY, "Default Value");
// draw row under headers
//draw_line(windowX1, headerY, windowX2, headerY);


// custom items header
draw_text(headerDescriptionX,   customHeaderY, "Custom Made Items");
draw_text(headerNewValueX,      customHeaderY, "Outlay");
draw_text(headerDefaultValueX,  customHeaderY, "Professional");


// DRAW ITEMS CONTENT AND INTERATION
/* TO DO:
 * We'll want to be able to scroll through the list.
 * Scrolling will simply change the starting currentIndex value and
 * all will work after that.
 * We'll need a scrollbar and scroll buttons.
 *
 * We want descriptions to either display in multiline,
 * or, much easier, we trim the description if it's longer
 * than the descriptionTextWidth.
 *
 * We want to make sure nothing below the window is
 * clickable. This will be useful for any other popup 
 * windows like this one in the future, such as a
 * preferences window.
 * 
 */
var maxItem = min(size, 15); // 15 being the amount we can show on screen at once.


for (currentIndex=0; currentIndex<maxItem; currentIndex++)
{
    var yy          = (listStartY + (currentIndex*rowHeight));
    var y2          = (yy - rowHeight);
    var defaultDesc = array[currentIndex,0];
    var newDesc     = array[currentIndex,1];
    var defaultVal  = array[currentIndex,2];
    var newVal      = array[currentIndex,3];
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
            
            // double-click on row
            if (indexSelected == currentIndex)
            {
                if (double_clicked())
                {
                    default_items_editor_edit_description();
                }
                else reset_clickTime();
            }
            else
            {
                indexSelected = currentIndex;
                reset_clickTime();
            }
        }
    }
    
    // keyboard enter
    if keyboard_check_pressed(vk_enter)
    {
        //if (fieldSelected == descriptionFieldIndex)
        //{
            default_items_editor_edit_description();
        //}
                
        /*
        if (fieldSelected == defaultValueFieldIndex)
        {
        }
        
        if (fieldSelected == newValueFieldIndex)
        {
        }
        */
        
    }
    
    
    // if selected, draw a blue background and set text to white
    if (indexSelected == currentIndex)
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


/// CUSTOM ITEMS
//var array   = arrayOfHighCourtCustomItemValues;
//var size    = array_height_2d(array);
var maxItem = min(size, 15); // 15 being the amount we can show on screen at once.

for (var currentIndex=0; currentIndex<maxItem; currentIndex++)
{
    var yy          = (customListStartY + (currentIndex*rowHeight));
    var desc        = array[currentIndex,0];
    var outlayVal   = array[currentIndex,1];
    var profesVal   = array[currentIndex,2];
    
    draw_set_halign(fa_left);
    draw_text(descriptionTextX,  yy, desc);
    draw_set_halign(fa_right);
    draw_text(newValueTextX,     yy, outlayVal);
    draw_text(defaultValueTextX, yy, profesVal);
    
    // draw row
    draw_line(windowX1, yy, windowX2, yy);
}
