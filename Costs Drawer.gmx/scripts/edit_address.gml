drawBorder(string(selectedField));

reset_text();
draw_set_font_scaled(font_TimesBold);

// draw the text so far...
var str = "";
cursorPosY = textPosY;


    if (selectedField = "addressLine1")
    {
        draw_set_color(global.itemTextColor);
        str = tempAddressLine;
        cursorPosY = textPosY;
    }
    else
    {
        draw_set_color(global.grayText);
        str = addressLine1;
    }
    draw_text(textPosX, textPosY, str);
    
    
    if (selectedField = "addressLine2")
    {
        draw_set_color(global.itemTextColor);
        str = tempAddressLine;
        cursorPosY = (textPosY + (global.rowHeight));
    }
    else
    {
        draw_set_color(global.grayText);
        str = addressLine2;
    }
    draw_text(textPosX, textPosY + (global.rowHeight), str);
    
    
    if (selectedField = "addressLine3")
    {
        draw_set_color(global.itemTextColor);
        str = tempAddressLine;
        cursorPosY = (textPosY + (global.rowHeight*2));
    }
    else
    {
        draw_set_color(global.grayText);
        str = addressLine3;
    }
    draw_text(textPosX, (textPosY + (global.rowHeight*2)), str);
    
    
    if (selectedField = "addressLine4")
    {
        draw_set_color(global.itemTextColor);
        str = tempAddressLine;
        cursorPosY = (textPosY + (global.rowHeight*3));
    }
    else
    {
        draw_set_color(global.grayText);
        str = addressLine4;
    }
    draw_text(textPosX, (textPosY + (global.rowHeight*3)), str);
    
    
    if (selectedField = "addressLine5")
    {
        draw_set_color(global.itemTextColor);
        str = tempAddressLine;
        cursorPosY = (textPosY + (global.rowHeight*4));
    }
    else
    {
        draw_set_color(global.grayText);
        str = addressLine5;
    }
    draw_text(textPosX, (textPosY + (global.rowHeight*4)), str);
    
    
    if (selectedField = "addressLine6")
    {
        draw_set_color(global.itemTextColor);
        str = tempAddressLine;
        cursorPosY = (textPosY + (global.rowHeight*5));
    }
    else
    {
        draw_set_color(global.grayText);
        str = addressLine6;
    }
    draw_text(textPosX, (textPosY + (global.rowHeight*5)), str);
    
    
    if (selectedField = "addressLine7")
    {
        draw_set_color(global.itemTextColor);
        str = tempAddressLine;
        cursorPosY = (textPosY + (global.rowHeight*6));
    }
    else
    {
        draw_set_color(global.grayText);
        str = addressLine7;
    }
    draw_text(textPosX, textPosY + (global.rowHeight*6), str);
    


/// WHERE THE MAGIC HAPPENS...
tempAddressLine = user_text_input(tempAddressLine,textPosX,cursorPosY,false);


// CONFIRM AND STOP EDITING //
if keyboard_check_released(vk_escape)
or keyboard_check_released(vk_enter)
or mouseClickOutsideArea(global.descriptionColumnX,borderStartY,global.outlayColumnX,borderEndY + global.rowHeight)
{
    if (selectedField = "addressLine1") then addressLine1 = tempAddressLine;
    if (selectedField = "addressLine2") then addressLine2 = tempAddressLine;
    if (selectedField = "addressLine3") then addressLine3 = tempAddressLine;
    if (selectedField = "addressLine4") then addressLine4 = tempAddressLine;
    if (selectedField = "addressLine5") then addressLine5 = tempAddressLine;
    if (selectedField = "addressLine6") then addressLine6 = tempAddressLine;
    if (selectedField = "addressLine7") then addressLine7 = tempAddressLine;
    //if (selectedField = "addressLine8") then addressLine8 = tempAddressLine;
    
    if (addressLine1 = "") then addressLine1 = defaultAddressLine1;
    if (addressLine2 = "") then addressLine2 = defaultAddressLine2;
    if (addressLine3 = "") then addressLine3 = defaultAddressLine3;
    if (addressLine4 = "") then addressLine4 = defaultAddressLine4;
    if (addressLine5 = "") then addressLine5 = defaultAddressLine5;
    if (addressLine6 = "") then addressLine6 = defaultAddressLine6;
    if (addressLine7 = "") then addressLine7 = defaultAddressLine7;
    //if (addressLine8 = "") then addressLine8 = defaultAddressLine8;
    
    lastPage_Address.alarm[0] = 1;
    
    editing = false;
    set_unsaved();
    global.SHOW_WARNINGS = true;
    global.selected = -1;
    exit;
}   

