/// xlsx_SUBTOTAL_quantum()

// xlsx_TOTALS_quantum()
var pageNum     = ( getPageNumberFromRow(item.row) );
var startRow    = (((pageNum - 1) * global.rowsPerPage)+1);
var endRow      = ( item.row - 1 );

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
