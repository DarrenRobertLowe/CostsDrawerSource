var file = file_text_open_write("xlsx\docProps\core.xml");


// fill it up
file_text_write_string(file,'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>   ');
file_text_writeln(file);

file_text_write_string(file,'<cp:coreProperties xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties">   ');
file_text_writeln(file);

file_text_write_string(file,'<dcterms:created xsi:type="dcterms:W3CDTF">2009-04-16T11:32:48Z</dcterms:created>   ');
file_text_writeln(file);

file_text_write_string(file,'<dc:creator/>   ');
file_text_writeln(file);

file_text_write_string(file,'<dc:description/>   ');
file_text_writeln(file);

file_text_write_string(file,'<dc:language>en-IE</dc:language>   ');
file_text_writeln(file);

file_text_write_string(file,'<cp:lastModifiedBy/>   ');
file_text_writeln(file);

file_text_write_string(file,'<dcterms:modified xsi:type="dcterms:W3CDTF">2018-06-06T13:59:10Z</dcterms:modified>   ');
file_text_writeln(file);

file_text_write_string(file,'<cp:revision>4</cp:revision>   ');
file_text_writeln(file);

file_text_write_string(file,'<dc:subject/>   ');
file_text_writeln(file);

file_text_write_string(file,'<dc:title/>   ');
file_text_writeln(file);

file_text_write_string(file,'</cp:coreProperties>   ');
file_text_writeln(file);




file_text_close(file);


global.xlsxReady ++;
