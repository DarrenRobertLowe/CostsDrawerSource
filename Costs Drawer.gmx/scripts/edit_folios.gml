/// edit_folios();

drawBorder(string(selectedField));

reset_text();
draw_set_font_scaled(font_TimesBold);

// draw the text so far...
var str = "";
cursorPosY = textPosY;


    if (selectedField = "folios")
    {
        draw_set_color(global.itemTextColor);
        str = tempFolios;
        cursorPosY = (textPosY + global.rowHeight);
    }
    else
    {
        draw_set_color(global.grayText);
        str = addressLine7;
    }
    
    draw_text(global.descriptionColumnX, (textPosY + global.rowHeight), str);
    


/// WHERE THE MAGIC HAPPENS...
tempFolios = user_number_input(tempFolios,global.descriptionColumnX,cursorPosY,false);


// CONFIRM AND STOP EDITING //
if keyboard_check_released(vk_escape)
or keyboard_check_released(vk_enter)
or mouseClickOutsideArea(global.descriptionColumnX,borderStartY,global.outlayColumnX,borderEndY + global.rowHeight)
{
    folios = real(string_digits(tempFolios));
    professional = (folios * global.costPerFolio);
    professionalText = formatQuantum(professional);
    
    editing = false;
    editingFolios = false;
    set_unsaved();
    global.selected = -1;
    exit;
}
