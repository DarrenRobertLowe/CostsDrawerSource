var file = file_text_open_write("xlsx\_rels\.rels");

// fill it up
file_text_write_string(file,'<?xml version="1.0" encoding="UTF-8"?>');
file_text_writeln(file);

file_text_write_string(file,'<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">');
file_text_writeln(file);

file_text_write_string(file,'<Relationship Target="xl/workbook.xml" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Id="rId1"/>');
file_text_writeln(file);

file_text_write_string(file,'<Relationship Target="docProps/core.xml" Type="http://schemas.openxmlformats.org/package/2006/relationships/metadata/core-properties" Id="rId2"/>');
file_text_writeln(file);

file_text_write_string(file,'<Relationship Target="docProps/app.xml" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/extended-properties" Id="rId3"/>');
file_text_writeln(file);

file_text_write_string(file,'<Relationship Target="docProps/custom.xml" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/custom-properties" Id="rId4"/>');
file_text_writeln(file);

file_text_write_string(file,'</Relationships>');
file_text_writeln(file);

file_text_close(file);


global.xlsxReady ++;
