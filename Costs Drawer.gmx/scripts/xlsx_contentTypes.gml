if file_exists("xlsx\[Content_Types].xml") then file_delete("xlsx\[Content_Types].xml");

var file = file_text_open_write("xlsx\[Content_Types].xml");


// fill it up


file_text_write_string(file,'<?xml version="1.0" encoding="UTF-8"?>');
file_text_writeln(file);
file_text_write_string(file,'<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">');
file_text_writeln(file);
file_text_write_string(file,'<Default ContentType="application/xml" Extension="xml"/>');
file_text_writeln(file);
file_text_write_string(file,'<Default ContentType="application/vnd.openxmlformats-package.relationships+xml" Extension="rels"/>');
file_text_writeln(file);
file_text_write_string(file,'<Default ContentType="image/png" Extension="png"/>');
file_text_writeln(file);
file_text_write_string(file,'<Default ContentType="image/jpeg" Extension="jpeg"/>');
file_text_writeln(file);
file_text_write_string(file,'<Override ContentType="application/vnd.openxmlformats-package.relationships+xml" PartName="/_rels/.rels"/>');
file_text_writeln(file);
file_text_write_string(file,'<Override ContentType="application/vnd.openxmlformats-package.core-properties+xml" PartName="/docProps/core.xml"/>');
file_text_writeln(file);
file_text_write_string(file,'<Override ContentType="application/vnd.openxmlformats-officedocument.extended-properties+xml" PartName="/docProps/app.xml"/>');
file_text_writeln(file);
file_text_write_string(file,'<Override ContentType="application/vnd.openxmlformats-officedocument.custom-properties+xml" PartName="/docProps/custom.xml"/>');
file_text_writeln(file);
file_text_write_string(file,'<Override ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml" PartName="/xl/worksheets/sheet1.xml"/>');
file_text_writeln(file);
file_text_write_string(file,'<Override ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml" PartName="/xl/worksheets/sheet2.xml"/>');
file_text_writeln(file);
file_text_write_string(file,'<Override ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml" PartName="/xl/worksheets/sheet3.xml"/>');
file_text_writeln(file);
file_text_write_string(file,'<Override ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml" PartName="/xl/styles.xml"/>');
file_text_writeln(file);
file_text_write_string(file,'<Override ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml" PartName="/xl/workbook.xml"/>');
file_text_writeln(file);
file_text_write_string(file,'<Override ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sharedStrings+xml" PartName="/xl/sharedStrings.xml"/>');
file_text_writeln(file);
file_text_write_string(file,'<Override ContentType="application/vnd.openxmlformats-package.relationships+xml" PartName="/xl/_rels/workbook.xml.rels"/>');
file_text_writeln(file);
file_text_write_string(file,'</Types>');


file_text_close(file);

global.xlsxReady ++;
