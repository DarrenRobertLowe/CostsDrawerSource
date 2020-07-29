///xlsx_TOTALquantum()

///xlsx_outlayToTotalquantum()
var startRow = lastPage_SUBTOTAL.row;
var endRow   = lastPage_OutlayToTotal.row;

//professional
file_text_write_string(file,'<c r="G' +string(current_row) +'" t="n" s="3">');
file_text_writeln(file);
file_text_write_string(file,'<f aca="false">SUM(G'+string(startRow) +':G'+string(endRow)+')</f>'); 
file_text_writeln(file);
file_text_write_string(file,'</c>');
file_text_writeln(file);
