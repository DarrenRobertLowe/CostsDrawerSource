// FIND THE WIDTH OF THE WARNINGS CONTENT#
draw_set_font(font_GUI);

var list1   = global.WARNINGS;
var list2   = global.CAUTIONS;
var size1   = ds_list_size(global.WARNINGS);
var size2   = ds_list_size(global.CAUTIONS);
var strWidth1 = 0;
var strWidth2 = 0;
var strLength1 = 0;
var strLength2 = 0;

//find the max width of WARNINGS
for(i1=0; i1<size1; i1++)
{
    var a = ds_list_find_value(list1,i1);
    var width = string_width(a);
    var length = string_length(a);
    if (width > strWidth1) then strWidth1 = width;
    if (length > strLength1) then strLength1 = length;
}

//find the max width of CAUTIONS
for(i2=0; i2<size2; i2++)
{
    var a = ds_list_find_value(list2,i2);
    var width  = string_width(a);
    var length = string_length(a);
    if (width > strWidth2) then strWidth2 = width;
    if (length > strLength2) then strLength2 = length;
}

if (strWidth1 >= strWidth2)
{
    warningsWidth  = strWidth1;
    textLength = strLength1;
}
else
{
    warningsWidth  = strWidth2;
    textLength = strLength2;
}

