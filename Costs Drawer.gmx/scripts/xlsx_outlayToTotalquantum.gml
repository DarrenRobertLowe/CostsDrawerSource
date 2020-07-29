///xlsx_outlayToTotalquantum()

var tRow = lastPage_SUBTOTAL.row;

//professional
file_text_write_string(file,'<c r="G' +string(current_row) +'" t="n" s="3">');
file_text_writeln(file);
file_text_write_string(file,'<f aca="false">SUM(E' +string(tRow) +')</f>'); 
file_text_writeln(file);
file_text_write_string(file,'</c>');
file_text_writeln(file);

