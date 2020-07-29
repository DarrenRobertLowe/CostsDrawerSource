/// toggleItemNumber()

if (selectedField    = "item number")
{
    set_unsaved();                                      // Mark that the file has been changed
    
    popupWaiting = true;                                // prevent other popups while we're doing this
    
    drawBorder("item number");
    
    if (countMyItemNumber == true)
    {
        countMyItemNumber = false;              // toggle countMyItemNumber off
        confirmDescription(description);
        DOC_ORGANIZER.startFrom = id;
        DOC_ORGANIZER.alarm[0] = 2;
    }
    else
    {
        countMyItemNumber = true;               // toggle countMyItemNumber on
        confirmDescription(description);
        DOC_ORGANIZER.startFrom = id;
        DOC_ORGANIZER.alarm[0] = 2;
    }
    
    popupWaiting     = false;
    selectedField = "";
}
