///xlsx_VATquantum()

//outlay
file_text_write_string(file,'<c r="E' +string(current_row) +'" t="n" s="3">');
file_text_writeln(file);
//file_text_write_string(file,'<f aca="false">SUM(E' +string(current_row-1) +'*0.23)</f>'); 
file_text_write_string(file,'<f aca="false">SUM(E' +string(current_row-1) +'*' +string(global.VATamount)+')</f>');
file_text_writeln(file);
file_text_write_string(file,'</c>');
file_text_writeln(file);
