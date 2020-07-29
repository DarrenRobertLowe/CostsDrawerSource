var file = file_text_open_write("xlsx\xl\_rels\workbook.xml.rels");

// fill it up

file_text_write_string(file,'<?xml version="1.0" encoding="UTF-8"?>');
file_text_writeln(file);
file_text_write_string(file,'<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">');
file_text_writeln(file);
file_text_write_string(file,'<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/>');
file_text_writeln(file);
file_text_write_string(file,'<Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet1.xml"/>');
file_text_writeln(file);
file_text_write_string(file,'<Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet2.xml"/>');
file_text_writeln(file);
file_text_write_string(file,'<Relationship Id="rId4" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet3.xml"/>');
file_text_writeln(file);
file_text_write_string(file,'<Relationship Id="rId5" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/sharedStrings" Target="sharedStrings.xml"/>');
file_text_writeln(file);
file_text_write_string(file,'</Relationships>');



file_text_close(file);



global.xlsxReady ++;

