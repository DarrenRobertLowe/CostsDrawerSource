/// xlsx_description_irregularItem()
var str = "";

//if (item.object_index == PAGE_NUMBER) and (item.showTotals == false) then exit;
if (item.object_index == PAGE_NUMBER) and (item.row > lastPage_TOTAL.row) then exit;


// <c r="D45" ...>
file_text_write_string(file,'<c r="D' +string(item.row + iteration) +'" t="s" s="'+string(item.xlsx_styleID)+'">');
file_text_writeln(file);


if (item.object_index == TOTALS)
{
    if (item.showTotals == true)
      then str = "Forward/";
      else str = "";
}

if (item.object_index == lastPage_drawingCostsAndCopy)
{
    if (iteration == 0 ) then str = item.title;             // first iteration
    if (iteration == 1 ) then str = "    " +string(global.folios) + " " +string(item.shownDescription);  // second iteration
}



if (item.object_index == lastPage_DatedSignature)
{
    if (iteration == 0 ) then str = item.line1;             // first iteration
    if (iteration == 1 ) then str = item.line2;             // second iteration
    if (iteration == 2 ) then str = item.line3;             // third iteration
}


if (item.object_index == lastPage_Address)
{
    if (iteration == 0 ) then str = item.shownAddressLine1;             // first iteration
    if (iteration == 1 ) then str = item.shownAddressLine2;             // second iteration
    if (iteration == 2 ) then str = item.shownAddressLine3;             // third iteration
    if (iteration == 3 ) then str = item.shownAddressLine4;             // etc...
    if (iteration == 4 ) then str = item.shownAddressLine5;
    if (iteration == 5 ) then str = item.shownAddressLine6;
    if (iteration == 6 ) then str = item.shownAddressLine7;
    //if (iteration == 7 ) then str = item.addressLine8;
}

if (item.object_index == lastPage_VATNumbers)
{
    if (iteration == 0 ) then str = ("V.A.T. No. " + string(item.solicitorVATNo));
    if (iteration == 1 ) then str = item.headerText;
    if (iteration == 2 ) then str = item.seniorLine;// +" " +item.seniorVATNo;
    if (iteration == 3 ) then str = item.juniorLine;// +" " +item.juniorVATNo;
}

if (item.object_index == WITNESS)
{
    var size = ds_list_size(item.nameList);
    if (iteration < size)
    {
        var desc = ds_list_find_value(item.nameList,iteration); // get each line of the name (names could be longer than 1 line)
        str = xlsx_convert_special_chars(desc);
    }
    else
    {    
        var desc = ds_list_find_value(item.descriptionList,iteration-size);
        str = xlsx_convert_special_chars(desc);
    }
}


// remove description
if (item.object_index == lastPage_OutlayToTotal)
or (item.object_index == lastPage_SUBTOTAL)
{
    str = "";
}


if (is_undefined(str)) then str = "";
else str = xlsx_convert_special_chars(str);
sharedStringIndex = xlsx_write_sharedString(str); // adds string as sharedStringIndex

/*
if (item.object_index == lastPage_Address)
{
    show_message("iteration is "+string(iteration));
    show_message("str is "+string(str));
    show_message("stsharedStringIndex is "+string(sharedStringIndex));
}
*/

file_text_write_string(file,'<v>'+string(sharedStringIndex) +'</v>');
file_text_writeln(file);

file_text_write_string(file,'</c>');
file_text_writeln(file);
