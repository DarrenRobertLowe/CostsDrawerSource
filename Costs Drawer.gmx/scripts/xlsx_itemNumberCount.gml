if  (item.countMyItemNumber == true)
and (item != lastItem)
{
    itemNumberCount ++;
    
    if (itemNumberCount == 1)   // if it's the first item number just put the number 1.
    {
        file_text_write_string(file,'<c r="B' + string(item.row) + '" s="2">');           // <c r="B(row)" t="s" s="0">
        file_text_writeln(file);
        file_text_write_string(file,'<v>1</v>');                                               // <v>1</v>
        file_text_writeln(file);
        file_text_write_string(file,'</c>');                                                   // </c>
        file_text_writeln(file);
    }
    
    else    // if it's not the first item number, make it a formula.
    {
        file_text_write_string(file,'<c r = "B' + string(item.row) + '" t="s" s="2">');// <c r="B(row)" t="s" s="0">
        file_text_writeln(file);
        file_text_write_string(file,' <f aca="false">SUM(B' +string(prevRow) +'+1)</f>');      // SUM(...)
        file_text_writeln(file);
        file_text_write_string(file,'</c>');                                                   // </c>
        file_text_writeln(file);
    }
    
    prevRow = item.row;
    lastItem = item;
}
