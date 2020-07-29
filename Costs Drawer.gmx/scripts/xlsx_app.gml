var file = file_text_open_write("xlsx\docProps\app.xml");


// fill it up
file_text_write_string(file,'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>');
file_text_writeln(file);

file_text_write_string(file,'<Properties xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes" xmlns="http://schemas.openxmlformats.org/officeDocument/2006/extended-properties">');
file_text_writeln(file);

file_text_write_string(file,'<Template/>');
file_text_writeln(file);

file_text_write_string(file,'<TotalTime>11</TotalTime>');// maybe change this to 1?
file_text_writeln(file);

file_text_write_string(file,'<Application>LibreOffice/5.4.0.3$Windows_X86_64 LibreOffice_project/7556cbc6811c9d992f4064ab9287069087d7f62c</Application>');
file_text_writeln(file);

file_text_write_string(file,'</Properties>');
file_text_writeln(file);



file_text_close(file);

global.xlsxReady ++;

