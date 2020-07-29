///calculateBorderEnd()

// normal items
var nlines = ds_list_size(shownDescriptionList);

if (nlines < 1) then nlines = 1;

var height = ( (nlines-1) * global.rowHeight );
if (height < global.rowHeight) then height = global.rowHeight;


var bEndY = ( borderStartY + height );
bEndY += ( seeFeeLater * global.rowHeight )
    

// exceptions...
if (object_index == INSTRUCTIONS_FEE_ITEM)
or (object_index == GENERAL_INSTRUCTIONS_DETAILS)
{
    //bEndY = borderEndY;
    var nlines = ds_list_size(shownDescriptionList);
    bEndY = (borderStartY + ((nlines)*global.rowHeight));
}

if (object_index == WITNESS_FEE)
{
    bEndY = (borderStartY + (lines*global.rowHeight));
}

return bEndY;
