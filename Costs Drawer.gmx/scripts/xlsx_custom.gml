var file = file_text_open_write("xlsx\docProps\custom.xml");


// fill it up
file_text_write_string(file,'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>');
file_text_writeln(file);

file_text_write_string(file,'<Properties xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes" xmlns="http://schemas.openxmlformats.org/officeDocument/2006/custom-properties">');
file_text_writeln(file);
file_text_writeln(file);

file_text_write_string(file,'<property name="Info 1" pid="2" fmtid="{D5CDD505-2E9C-101B-9397-08002B2CF9AE}">');
file_text_writeln(file);

file_text_write_string(file,'<vt:lpwstr/>');
file_text_writeln(file);

file_text_write_string(file,'</property>');
file_text_writeln(file);
file_text_writeln(file);

file_text_write_string(file,'<property name="Info 2" pid="3" fmtid="{D5CDD505-2E9C-101B-9397-08002B2CF9AE}">');
file_text_writeln(file);

file_text_write_string(file,'<vt:lpwstr/>');
file_text_writeln(file);

file_text_write_string(file,'</property>');
file_text_writeln(file);
file_text_writeln(file);

file_text_write_string(file,'<property name="Info 3" pid="4" fmtid="{D5CDD505-2E9C-101B-9397-08002B2CF9AE}">');
file_text_writeln(file);

file_text_write_string(file,'<vt:lpwstr/>');
file_text_writeln(file);

file_text_write_string(file,'</property>');
file_text_writeln(file);
file_text_writeln(file);

file_text_write_string(file,'<property name="Info 4" pid="5" fmtid="{D5CDD505-2E9C-101B-9397-08002B2CF9AE}">');
file_text_writeln(file);

file_text_write_string(file,'<vt:lpwstr/>');
file_text_writeln(file);

file_text_write_string(file,'</property>');
file_text_writeln(file);

file_text_write_string(file,'</Properties>');
file_text_writeln(file);






file_text_close(file);


global.xlsxReady ++;
