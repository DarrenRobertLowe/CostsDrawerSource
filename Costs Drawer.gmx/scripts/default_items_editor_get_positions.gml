//default_items_editor_get_positions();

windowX1                = 10;
popupWindowWidth        = 730;
windowX2                = (windowX1 + popupWindowWidth);
windowY1                = 10;
footerHeight            = 50;
popupWindowHeight       = window_get_height() - (footerHeight*2);
popupWindowHeight       = max(popupWindowHeight, footerHeight*4);
contentEndY             = (windowY1 + popupWindowHeight);
maxItemsShowable        = floor((popupWindowHeight / rowHeight)-1);
maxItemsShowable        = max(maxItemsShowable, 0);

footerY1                = contentEndY;
footerY2                = (contentEndY + footerHeight);


quantumColumnWidth      = 120;
defaultValueColumnX     = (windowX2 - quantumColumnWidth);
newValueColumnX         = (defaultValueColumnX - quantumColumnWidth);
professionalColumnX     = (windowX2 - quantumColumnWidth);
outlayColumnX           = (professionalColumnX - quantumColumnWidth);
descriptionColumnWidth  = (newValueColumnX - windowX1);
descriptionColumnX      = windowX1;
descriptionColumnEndX   = (newValueColumnX - quantumColumnWidth);


margin = 5;
defaultValueTextX       = ((defaultValueColumnX + quantumColumnWidth) - margin);
newValueTextX           = ((newValueColumnX     + quantumColumnWidth) - margin);
outlayTextX             = ((outlayColumnX       + quantumColumnWidth) - margin);
professionalTextX       = ((professionalColumnX + quantumColumnWidth) - margin);

descriptionTextX        = (windowX1 + margin);
descriptionTextWidth    = ((newValueColumnX - descriptionTextX) - margin);
headerY                 = (windowY1 + rowHeight);        // the headers
outlayProfessionalY     = (headerY + (rowHeight*1));     // where the "Outlay Prof." header text goes
listStartY              = (headerY + (rowHeight*1));     // where the items start

customHeaderY           = (windowY1 + (rowHeight*16));   // the headers
customListStartY        = (customHeaderY + rowHeight);   // where the custom items start
headerDescriptionX      = (newValueColumnX / 2);
headerNewValueX         = (newValueColumnX + ((defaultValueColumnX-newValueColumnX)/2));
headerDefaultValueX     = (defaultValueColumnX + ((windowX2-defaultValueColumnX)/2));

buttonSize              = 17; // width and height of the scrollbar buttons
scrollbarX              = (windowX2 + 1);
popupWindowEndX         = (scrollbarX + buttonSize);



// REPOSITION CUSTOM HEADERS Y
/* Because we don't have ability to edit default items yet
 * we want to put the CUSTOM ITEMS Y to be that of the
 * DEFAULT ITEMS Y for now
*/
customHeaderY = headerY;


/// Footer buttons calculations
var targetSprite    = spr_popup_save;
var footerMiddle    = round(footerY1 + (footerY2 - footerY1) / 2);
var halfWidth       = round(sprite_get_width(targetSprite)   / 2);
var halfHeight      = round(sprite_get_height(targetSprite)  / 2);
footerButtonsY  = round(footerMiddle    - halfHeight);

footerButton1x  = (windowX1 + 10);
footerButton2x  = (windowX1 + 104);
footerButton3x  = (windowX1 + 200);
footerButton4x  = (windowX1 + 293);
footerButton5x  = (windowX1 + 511);
footerButton6x  = (windowX1 + 631);


// MOVE EXISITNG BUTTONS
var button = -1;

button = addButton;
if (exists(button))
{
    button.x = footerButton1x;
    button.y = footerButtonsY;
    with (button)
    {
        x2 = (x + sprite_width);
        y2 = (y + sprite_height);
    }
}

button = deleteButton;
if (exists(button))
{
    button.x = footerButton2x;
    button.y = footerButtonsY;
    with (button)
    {
        x2 = (x + sprite_width);
        y2 = (y + sprite_height);
    }
}

button = moveUpButton;
if (exists(button))
{
    button.x = footerButton3x;
    button.y = footerButtonsY;
    with (button)
    {
        x2 = (x + sprite_width);
        y2 = (y + sprite_height);
    }
}

button = moveDownButton;
if (exists(button))
{
    button.x = footerButton4x;
    button.y = footerButtonsY;
    with (button)
    {
        x2 = (x + sprite_width);
        y2 = (y + sprite_height);
    }
}

button = saveButton;
if (exists(button))
{
    button.x = footerButton5x;
    button.y = footerButtonsY;
    with (button)
    {
        x2 = (x + sprite_width);
        y2 = (y + sprite_height);
    }
}

button = closeButton;
if (exists(button))
{
    button.x = footerButton6x;
    button.y = footerButtonsY;
    with (button)
    {
        x2 = (x + sprite_width);
        y2 = (y + sprite_height);
    }
}




/// scrollbar stuff
var scrollAreaStartY = (listStartY - rowHeight);


if (exists(customScrollbar))
{
    customScrollbar.y = scrollAreaStartY;
    customScrollbar.x = windowX2;
    customScrollbar.height = 100;   // no real point in having this be dynamic
    customScrollbar.scrollAreaStartY = scrollAreaStartY;
    customScrollbar.scrollAreaHeight = (footerY1 - scrollAreaStartY);
    customScrollbar.scrollAreaStartX = scrollbarX;
    customScrollbar.scrollAreaEndX   = (scrollbarX + buttonSize);
    customScrollbar.scrollAreaEndY   = footerY1;
}


if (exists(customScrollbarUp))
{
    customScrollbarUp.x = scrollbarX;
    customScrollbarUp.y = (scrollAreaStartY - buttonSize);
}
if (exists(customScrollbarDown))
{
    customScrollbarDown.x = scrollbarX;
    customScrollbarDown.y = footerY1;
}
