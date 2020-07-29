
//outlay
file_text_write_string(file,'<c r="E' +string(current_row) +'" t="n" s="3">');
file_text_writeln(file);
file_text_write_string(file,'<v>'+string(item.outlayText) +'</v>');
file_text_writeln(file);
file_text_write_string(file,'</c>');
file_text_writeln(file);

// professional
file_text_write_string(file,'<c r="G' +string(current_row) +'" t="n" s="3">');
file_text_writeln(file);
file_text_write_string(file,'<v>' + string(item.professionalText) + '</v>');
file_text_writeln(file);
file_text_write_string(file,'</c>');
file_text_writeln(file);
