/// xlsx_description_regularItem()
var str = "";
var style = item.xlsx_styleID;


//if (item.object_index == PAGE_NUMBER) and (item.showTotals == false) then exit;

if (item.object_index == PAGE_NUMBER) and (item.row > lastPage_TOTAL.row) then exit;

// get the description string
str = ds_list_find_value(item.shownDescriptionList,iteration);


if (is_undefined(str)) then str = "";
else str = xlsx_convert_special_chars(str);


if (item.object_index == lastPage_SUBTOTAL) then str = "SUB TOTAL";


if  (item.seeFeeLater == true)
and (current_row = itemEndRow)
{
    str = "see fee later";
    style = 1;
}


// <c r="D45" ...>
file_text_write_string(file,'<c r="D' +string(item.row + iteration) +'" t="s" s="'+string(style)+'">');
file_text_writeln(file);



sharedStringIndex = xlsx_write_sharedString(str); // adds string as sharedStringIndex


file_text_write_string(file,'<v>'+string(sharedStringIndex) +'</v>');
file_text_writeln(file);

file_text_write_string(file,'</c>');
file_text_writeln(file);
