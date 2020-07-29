// xlsx_PAGE_NUMBER_quantum()

if (item.object_index == PAGE_NUMBER) and (item.row > lastPage_TOTAL.row) then exit;

if (item.showTotals == true)
{
    if (item.row > 43)
    {
        // outlay
        file_text_write_string(file,'<c r="E' +string(current_row) +'" t="n" s="3">');
        file_text_writeln(file);
        file_text_write_string(file,'<f aca="false">SUM(E' +string(item.row-1) +')</f>'); // SUM(...)
        file_text_writeln(file)
        file_text_write_string(file,'</c>');
        file_text_writeln(file);
        
        // professional
        file_text_write_string(file,'<c r="G' +string(current_row) +'" t="n" s="3">');
        file_text_writeln(file);
        file_text_write_string(file,'<f aca="false">SUM(G' +string(item.row-1) +')</f>'); // SUM(...)
        file_text_writeln(file)
        file_text_write_string(file,'</c>');
        file_text_writeln(file);
    }
}
