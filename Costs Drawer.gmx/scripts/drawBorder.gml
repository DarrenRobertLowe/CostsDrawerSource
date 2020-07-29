/// drawBorder()

if (global.PRINT_VIEW == true) then exit;


var outline = global.highlightOutline; // whether or not rectangle is outline or filles
draw_set_color(global.highlightColor);
draw_set_alpha(global.highlightAlpha);

var x1 = global.descriptionColumnX;
var x2 = global.outlayColumnX;
var y1 = row;
var y2 = row + lines;

/// this calc is needed now because of paragraph items
var bEndY = calculateBorderEnd();


if (argument0 == "instructions") {
    x1 = global.dateColumnX;
    x2 = global.hColumnX;
    y1 = borderStartY;
    y2 = INSTRUCTIONS_FEE_TOTAL.borderEndY;

    outline = 0;
    draw_set_alpha(0.1);
}


if (argument0 == "instructionsFeeItem") {
    x1 = global.dateColumnX;
    x2 = global.hColumnX;
    y1 = borderStartY;
    y2 = borderEndY;

    outline = 0;
    draw_set_alpha(0.1);
}



if (argument0 == "item") {
    x1 = global.dateColumnX;
    x2 = global.hColumnX;
    y1 = borderStartY;
    y2 = bEndY;
    outline = 0;
    draw_set_alpha(0.1);
}


if (argument0 == "Witness Fee")
{
    x1 = global.dateColumnX;
    x2 = global.hColumnX;
    y1 = borderStartY;
    y2 = borderStartY + (ds_list_size(shownDescriptionList)*global.rowHeight);
    outline = 0;
    draw_set_alpha(0.1);
}



if (argument0 == "date") { ///  no longer needed??
    x1 = global.dateColumnX;
    x2 = global.itemNoColumnX;
    y1 = borderStartY;
    y2 = borderStartY + global.rowHeight;
}


if (argument0 == "year") {
    x1 = (global.dateColumnX   - (global.textMargin*3));
    x2 = (global.itemNoColumnX + global.textMargin);
    y1 = borderStartY;
    y2 = borderStartY+global.rowHeight;
}

if (argument0 == "month") {
    x1 = (global.dateColumnX   - (global.textMargin*3));
    x2 = (global.itemNoColumnX + global.textMargin);
    y1 = borderStartY+global.rowHeight;
    y2 = borderStartY+(global.rowHeight*2);
}

if (argument0 == "day") {
    x1 = (global.dateColumnX   - (global.textMargin*3));
    x2 = (global.itemNoColumnX + global.textMargin);
    y1 = borderStartY+(global.rowHeight*2);
    y2 = borderStartY+(global.rowHeight*3);
}



if (argument0 == "item number") {
    x1 = global.itemNoColumnX;
    x2 = global.cColumnX;
    y1 = borderStartY;
    y2 = borderStartY+global.rowHeight;
}


if (argument0 == "description")
{
    var lanes = ds_list_size(descriptionList);
    if (lanes < 1) then lanes = 1;
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = borderStartY;
    y2 = borderStartY + (lanes * global.rowHeight);//borderEndY;                            // this is multiple lines
}


if (argument0 == "outlay") {
    x1 = global.outlayColumnX;
    x2 = global.fColumnX;
    y1 = (quantumPositionY - global.rowHeight);
    y2 = quantumPositionY;
    
}


if (argument0 == "professional")
{
    x1 = global.professionalColumnX;
    x2 = global.hColumnX;
    y1 = (quantumPositionY - global.rowHeight);
    y2 = quantumPositionY;
}

if (argument0 == "record number") {
    x1 = global.descriptionColumnX + string_width("Record No. ");
    x2 = global.outlayColumnX;
    y1 = borderStartY;
    y2 = borderStartY + global.rowHeight;
}

if (argument0 == "addressLine1") {
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = borderStartY;
    y2 = borderStartY + global.rowHeight;
}

if (argument0 == "addressLine2") {
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = borderStartY + global.rowHeight;
    y2 = borderStartY + (global.rowHeight*2);
}

if (argument0 == "addressLine3") {
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = borderStartY + (global.rowHeight*2);
    y2 = borderStartY + (global.rowHeight*3);
}

if (argument0 == "addressLine4") {
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = borderStartY + (global.rowHeight*3);
    y2 = borderStartY + (global.rowHeight*4);
}

if (argument0 == "addressLine5") {
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = borderStartY + (global.rowHeight*4);
    y2 = borderStartY + (global.rowHeight*5);
}

if (argument0 == "addressLine6") {
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = borderStartY + (global.rowHeight*5);
    y2 = borderStartY + (global.rowHeight*6);
}

if (argument0 == "addressLine7") {
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = borderStartY + (global.rowHeight*6);
    y2 = borderStartY + (global.rowHeight*7);
}

if (argument0 == "addressLine8") {
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = borderStartY + (global.rowHeight*7);
    y2 = borderStartY + (global.rowHeight*8);
}



if (argument0 == "costsPursuantLine3") {
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = borderStartY + (global.rowHeight*2);
    y2 = borderStartY + (global.rowHeight*3);
}

if (argument0 == "costsPursuantLine4") {
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = borderStartY + (global.rowHeight*3);
    y2 = borderStartY + (global.rowHeight*4);
}



if (argument0 == "VATNumbersLine1") {
    x1 = textPosX + string_width("V.A.T No. ")
    x2 = global.outlayColumnX;
    y1 = borderStartY + (global.rowHeight*0);
    y2 = borderStartY + (global.rowHeight*1);
}

if (argument0 == "VATNumbersLine2") {
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = borderStartY + (global.rowHeight*1)
    y2 = borderStartY + (global.rowHeight*2);
}

if (argument0 == "VATNumbersLine3") {
    x1 = textPosX + string_width(global.SENIOR_COUNSEL) +string_width(" ");
    x2 = global.outlayColumnX;
    y1 = borderStartY + (global.rowHeight*2)
    y2 = borderStartY + (global.rowHeight*3);
}

if (argument0 == "VATNumbersLine4") {
    x1 = textPosX + string_width(global.JUNIOR_COUNSEL) +string_width(" ");
    x2 = global.outlayColumnX;
    y1 = borderStartY + (global.rowHeight*3);
    y2 = borderStartY + (global.rowHeight*4);
}


if (argument0 == "Junior Counsel") {
    x1 = global.rightColumnWindowsX1;
    x2 = global.rightColumnWindowsX2;
    y1 = global.juniorCounselWindowY1;
    y2 = global.juniorCounselWindowY2;
}
    
if (argument0 == "Senior Counsel") {
    x1 = global.rightColumnWindowsX1;
    x2 = global.rightColumnWindowsX2;
    y1 = global.seniorCounselWindowY1;
    y2 = global.seniorCounselWindowY2;
}

if (argument0 == "Add Expense") {
    var lanes = ds_list_size(descriptionList);
    
    if (lanes < 1) then lanes = 1;
    
    x1 = global.descriptionColumnX
    x2 = global.outlayColumnX
    y1 = borderStartY + (lanes*global.rowHeight)
    y2 = borderStartY + (lanes*global.rowHeight) + global.rowHeight
}

if (argument0 == "create new item") {
    x1 = global.dateColumnX;
    x2 = global.hColumnX;
    y1 = borderStartY;
    y2 = borderEndY;
}


if (argument0 == "solicitorVATNo")
{
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = textPosY - (rowHeight);
    y2 = textPosY;
}

if (argument0 == "seniorVATNo")
{
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = textPosY + (rowHeight);
    y2 = textPosY + (rowHeight*2);
}

if (argument0 == "juniorVATNo")
{
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = textPosY + (rowHeight*2);
    y2 = textPosY + (rowHeight*3);
}


if (argument0 == "Plaintiff")
{
    var lanes = ds_list_size(descriptionList);
    
    if (lanes < 1) then lanes = 1;
    
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = borderStartY + (lanes * global.rowHeight);
    y2 = borderStartY + (lanes * global.rowHeight) + (global.rowHeight*2);
}


if (argument0 == "Add Plaintiff 1")
{
    var lanes = ds_list_size(descriptionList);
    
    if (lanes < 1) then lanes = 1;
    
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = borderStartY + (lanes*global.rowHeight);
    y2 = borderStartY + (lanes*global.rowHeight) + global.rowHeight;
}


if (argument0 == "Add Plaintiff 2")
{
    var lanes = ds_list_size(descriptionList);
    
    if (lanes < 1) then lanes = 1;
    
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = borderStartY + (lanes*global.rowHeight) + (global.rowHeight);
    y2 = borderStartY + (lanes*global.rowHeight) + (global.rowHeight*2);
}

if (argument0 == "plaintiff name")
{
    var lanes = ds_list_size(descriptionList);
    if (lanes < 1) then lanes = 1;
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    y1 = (borderStartY + rowHeight);
    y2 = (borderStartY + rowHeight) + (lanes * global.rowHeight);//borderEndY;                            // this is multiple lines
}


if (argument0 == "plaintiff 2") {
    x1 = global.dateColumnX;
    x2 = global.hColumnX;
    y1 = borderStartY + global.rowHeight;
    y2 = borderEndY   + global.rowHeight;
    outline = 0;
    draw_set_alpha(0.1);
}


if (argument0 == "and others") {
    x1 = global.descriptionColumnX;
    x2 = global.outlayColumnX;
    if (object_index == PLAINTIFF) then y1 = (borderStartY + ( global.rowHeight*(lines + 1) ));
    if (object_index == DEFENDANT) then y1 = (borderStartY + ( global.rowHeight*(lines + 2) ));
    y2 = y1 + global.rowHeight;
    outline = 0;
    //draw_set_alpha(0.1);
}



if (argument0 == "folios")
{
    
    if  (folios > 0)
    and (editingFolios == false)
    {
        x1 = textPosX;
        x2 = ( x1 + string_width( string(folios) ));
    }
    else
    {
        x1 = global.descriptionColumnX;
        x2 = ( x1 + string_width("Enter ") );
    }

    y1 = (borderStartY + global.rowHeight);
    y2 = (y1 + (1 * global.rowHeight)); 
}


// draw
draw_rectangle(x1,y1,x2,y2,outline);

// clean up
draw_set_alpha(1);
