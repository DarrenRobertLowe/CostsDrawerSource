/* Creates the workbook.xml file.
 * The workbook.xml is more or less the same in every xlsx file,
 * and it mostly controls the view port and window size, with the
 * only notable difference being the <definedNames> section which
 * we've added. The <definedNames> area allows for an entry called
 * "_xlnm.Print_Area" which allows us to limit the area that gets
 * printed by a printer. Not really important.
*/

var file = file_text_open_write("xlsx\xl\workbook.xml");


// fill it up
file_text_write_string(file,'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>');
file_text_writeln(file);

file_text_write_string(file,'<workbook xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">');
file_text_writeln(file);

file_text_write_string(file,'<fileVersion appName="Calc"/>');
file_text_writeln(file);

file_text_write_string(file,'<workbookPr date1904="false" showObjects="all" backupFile="false"/>');
file_text_writeln(file);

file_text_write_string(file,'<workbookProtection/>');
file_text_writeln(file);
file_text_writeln(file);


file_text_write_string(file,'<bookViews>');
file_text_writeln(file);

file_text_write_string(file,'<workbookView activeTab="0" firstSheet="0" tabRatio="500" windowHeight="8192" windowWidth="16384" yWindow="0" xWindow="0" showSheetTabs="true" showVerticalScroll="true" showHorizontalScroll="true"/>');
file_text_writeln(file);

file_text_write_string(file,'</bookViews>');
file_text_writeln(file);
file_text_writeln(file);


file_text_write_string(file,'<sheets>');
file_text_writeln(file);

file_text_write_string(file,'<sheet r:id="rId2" state="visible" sheetId="1" name="Sheet1"/>');
file_text_writeln(file);

file_text_write_string(file,'<sheet r:id="rId3" state="visible" sheetId="2" name="Sheet2"/>');
file_text_writeln(file);

file_text_write_string(file,'<sheet r:id="rId4" state="visible" sheetId="3" name="Sheet3"/>');
file_text_writeln(file);

file_text_write_string(file,'</sheets>');
file_text_writeln(file);



// THIS SECTION DEFINES THE PRINTABLE AREA
/* Sheet1!$A$1:$G$n A1 is the start and Gn is where
 * the print area ends. Therefore we need to set the value
 * of $G$n to be based on global.totalRows.
*/
file_text_write_string(file,'<definedNames>');
file_text_writeln(file);

file_text_write_string(file,'<definedName name="_xlnm.Print_Area" vbProcedure="false" localSheetId="0" hidden="false" function="false">Sheet1!$A$1:$G$'+string(global.totalRows)+'</definedName>');
file_text_writeln(file);

file_text_write_string(file,'</definedNames>');
file_text_writeln(file);
/////////////////////////////////////////////////



file_text_write_string(file,'<calcPr iterateDelta="0.001" iterate="false" refMode="A1" iterateCount="100"/>');
file_text_writeln(file);
file_text_writeln(file);


file_text_write_string(file,'<extLst>');
file_text_writeln(file);
file_text_writeln(file);


file_text_write_string(file,'<ext uri="{7626C862-2A13-11E5-B345-FEFF819CDC9F}" xmlns:loext="http://schemas.libreoffice.org/">');
file_text_writeln(file);

file_text_write_string(file,'<loext:extCalcPr stringRefSyntax="CalcA1"/>'); //CalcA1ExcelA1
file_text_writeln(file);

file_text_write_string(file,'</ext>');
file_text_writeln(file);

file_text_write_string(file,'</extLst>');
file_text_writeln(file);

file_text_write_string(file,'</workbook>');
file_text_writeln(file);



file_text_close(file);


global.xlsxReady ++;
