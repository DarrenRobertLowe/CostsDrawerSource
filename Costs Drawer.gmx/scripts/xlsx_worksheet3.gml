var file = file_text_open_write("xlsx\xl\worksheets\sheet3.xml");

// fill it up
file_text_write_string(file,'<?xml version="1.0" encoding="UTF-8" standalone="yes"?> ');
file_text_writeln(file);

file_text_write_string(file,'<worksheet xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"> ');
file_text_writeln(file);
file_text_writeln(file);


file_text_write_string(file,'<sheetPr filterMode="false"> ');
file_text_writeln(file);

file_text_write_string(file,'<pageSetUpPr fitToPage="false"/> ');
file_text_writeln(file);

file_text_write_string(file,'</sheetPr> ');
file_text_writeln(file);

file_text_write_string(file,'<dimension ref="A1"/> ');
file_text_writeln(file);
file_text_writeln(file);


file_text_write_string(file,'<sheetViews> ');
file_text_writeln(file);
file_text_writeln(file);


file_text_write_string(file,'<sheetView workbookViewId="0" zoomScalePageLayoutView="100" zoomScaleNormal="100" zoomScale="100" colorId="64" topLeftCell="A1" view="normal" defaultGridColor="true" showOutlineSymbols="true" tabSelected="false" rightToLeft="false" showZeros="true" showRowColHeaders="true" showGridLines="true" showFormulas="false"> ');
file_text_writeln(file);

file_text_write_string(file,'<selection sqref="A1" activeCellId="0" activeCell="A1" pane="topLeft"/> ');
file_text_writeln(file);

file_text_write_string(file,'</sheetView> ');
file_text_writeln(file);

file_text_write_string(file,'</sheetViews> ');
file_text_writeln(file);

file_text_write_string(file,'<sheetFormatPr outlineLevelCol="0" outlineLevelRow="0" zeroHeight="false" defaultRowHeight="12.8"/> ');
file_text_writeln(file);
file_text_writeln(file);


file_text_write_string(file,'<cols> ');
file_text_writeln(file);

file_text_write_string(file,'<col width="11.57" style="0" min="1" max="1" outlineLevel="0" hidden="false" customWidth="false" collapsed="false"/> ');
file_text_writeln(file);

file_text_write_string(file,'<col width="11.52" style="0" min="2" max="1025" outlineLevel="0" hidden="false" customWidth="false" collapsed="false"/> ');
file_text_writeln(file);

file_text_write_string(file,'</cols> ');
file_text_writeln(file);
file_text_writeln(file);


file_text_write_string(file,'<sheetData> ');
file_text_writeln(file);

file_text_write_string(file,'<row r="1" outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="12.85" customFormat="false"/> ');
file_text_writeln(file);

file_text_write_string(file,'</sheetData> ');
file_text_writeln(file);

file_text_write_string(file,'<printOptions verticalCentered="false" horizontalCentered="false" gridLinesSet="true" gridLines="false" headings="false"/> ');
file_text_writeln(file);

file_text_write_string(file,'<pageMargins footer="0.7875" header="0.7875" bottom="1.025" top="1.025" right="0.7875" left="0.7875"/> ');
file_text_writeln(file);

file_text_write_string(file,'<pageSetup copies="1" verticalDpi="300" horizontalDpi="300" useFirstPageNumber="false" cellComments="none" draft="false" blackAndWhite="false" orientation="portrait" pageOrder="downThenOver" fitToHeight="1" fitToWidth="1" firstPageNumber="0" scale="100" paperSize="9"/> ');
file_text_writeln(file);
file_text_writeln(file);


file_text_write_string(file,'<headerFooter differentOddEven="false" differentFirst="false"> ');
file_text_writeln(file);

file_text_write_string(file,'<oddHeader>&amp;C&amp;A</oddHeader>');
file_text_writeln(file);

file_text_write_string(file,'<oddFooter>&amp;CPage &amp;P</oddFooter>');
file_text_writeln(file);

file_text_write_string(file,'</headerFooter> ');
file_text_writeln(file);

file_text_write_string(file,'</worksheet> ');
file_text_writeln(file);


file_text_close(file);

global.xlsxReady ++;
