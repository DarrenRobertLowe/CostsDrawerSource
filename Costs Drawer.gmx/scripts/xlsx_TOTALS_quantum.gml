// xlsx_TOTALS_quantum()


if (item.showTotals == true)
{
/*
    if (item.pageNumber == 1)
      then startRow = ((item.row+2) - (global.rowsPerPage));    // WTF is this supposed to do?
      else
      */
      
    var linesBack = (global.rowsPerPage -1);
    var startRow = (item.row - linesBack);
    var endRow   = (item.row - 1);
    
    // outlay
    file_text_write_string(file,'<c r="E' +string(current_row) +'" t="n" s="8">');
    file_text_writeln(file);
    file_text_write_string(file,'<f aca="false">SUM(E' +string(startRow) +':E'+string(endRow)+')</f>'); // SUM(...)
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
    // professional
    file_text_write_string(file,'<c r="G' +string(current_row) +'" t="n" s="8">');
    file_text_writeln(file);
    file_text_write_string(file,'<f aca="false">SUM(G' +string(startRow) +':G'+string(endRow)+')</f>'); // SUM(...)
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
}
