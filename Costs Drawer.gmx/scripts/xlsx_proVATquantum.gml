///xlsx_proVATquantum()
var tRow = lastPage_SUBTOTAL.row;

//professional
file_text_write_string(file,'<c r="G' +string(current_row) +'" t="n" s="3">');
file_text_writeln(file);
//file_text_write_string(file,'<f aca="false">SUM(G' +string(tRow) +'*0.23)</f>'); 
file_text_write_string(file,'<f aca="false">SUM(G' +string(tRow) +'*' +string(global.VATamount)+')</f>'); 
file_text_writeln(file);
file_text_write_string(file,'</c>');
file_text_writeln(file);
