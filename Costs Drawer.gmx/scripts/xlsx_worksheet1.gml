file = file_text_open_write("xlsx\xl\worksheets\sheet1.xml");
sharedStrings = file_text_open_write("xlsx\xl\sharedStrings.xml");
sharedStringsList = ds_list_create();


/// create the start of the sharedStrings.xml
file_text_write_string(sharedStrings,'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>');
file_text_writeln(sharedStrings);
file_text_write_string(sharedStrings,'<sst xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">');
file_text_writeln(sharedStrings);


/// start the xml
file_text_write_string(file,'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>');
file_text_writeln(file);

file_text_write_string(file,'<worksheet xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">');
file_text_writeln(file);

file_text_write_string(file,'<sheetPr filterMode="false">');
file_text_writeln(file);

file_text_write_string(file,'<pageSetUpPr fitToPage="false"/>');
file_text_writeln(file);

file_text_write_string(file,'</sheetPr>');
file_text_writeln(file);

//file_text_write_string(file,'<dimension ref="D43"/>');
//file_text_writeln(file);



/// display settings for the view
file_text_write_string(file,'<sheetViews>');
file_text_writeln(file);

file_text_write_string(file,'<sheetView workbookViewId="0" zoomScalePageLayoutView="120" zoomScaleNormal="100" zoomScale="120" colorId="64" topLeftCell="A1" view="pageBreakPreview" defaultGridColor="true" showOutlineSymbols="true" tabSelected="true" rightToLeft="false" showZeros="true" showRowColHeaders="true" showGridLines="false" showFormulas="false">');
file_text_writeln(file);

file_text_write_string(file,'<selection sqref="A1" activeCellId="0" activeCell="A1" pane="topLeft"/>');
file_text_writeln(file);

file_text_write_string(file,'</sheetView>');
file_text_writeln(file);

file_text_write_string(file,'</sheetViews>');
file_text_writeln(file);

file_text_write_string(file,'<sheetFormatPr outlineLevelCol="0" outlineLevelRow="0" zeroHeight="false" defaultRowHeight="17.35"/>');
file_text_writeln(file);


/// This is where we set the column widths and styles
// NOTE: columns use the same style IDs that cells do!
file_text_write_string(file,'<cols>');
file_text_writeln(file);

file_text_write_string(file,'<col width="5.31" style="0" min="1" max="1" outlineLevel="0" hidden="false" customWidth="true" collapsed="false"/>');
file_text_writeln(file);
file_text_write_string(file,'<col width="3.73" style="2" min="2" max="2" outlineLevel="0" hidden="false" customWidth="true" collapsed="false"/>');
file_text_writeln(file);
file_text_write_string(file,'<col width="1.34" style="0" min="3" max="3" outlineLevel="0" hidden="false" customWidth="true" collapsed="false"/>');
file_text_writeln(file);
file_text_write_string(file,'<col width="35.43" style="0" min="4" max="4" outlineLevel="0" hidden="false" customWidth="true" collapsed="false"/>');
file_text_writeln(file);
file_text_write_string(file,'<col width="8.46" style="2" min="5" max="5" outlineLevel="0" hidden="false" customWidth="true" collapsed="false"/>');
file_text_writeln(file);
file_text_write_string(file,'<col width="3.93" style="0" min="6" max="6" outlineLevel="0" hidden="false" customWidth="true" collapsed="false"/>');
file_text_writeln(file);
file_text_write_string(file,'<col width="9.27" style="2" min="7" max="7" outlineLevel="0" hidden="false" customWidth="true" collapsed="false"/>');
file_text_writeln(file);

file_text_write_string(file,'</cols>');
file_text_writeln(file);




/* This is where all the actual data goes.
 * It references the sharedStrings.xml file and says e.g. (r="43" c="D43" <v>0</v>) or (<v>1</v>) etc,
 * where <v>#</v> is the string ID from sharedStrings.xml.
 *
 * Elements
 * ---------
 * is       = string
 * c        = cell (not column as you might expect)
 * r (in c) = is the cell address. Hence the need to repeat the row number. e.g. <c r="D43"> would be the D column of row 43.
 * f        = formula
 * v        = value
 * s        = style index  (The possible values for this attribute are defined by the W3C XML Schema unsignedInt datatype)
 * t        = type  (so t="s" = "string type"). (The possible values for this attribute are defined by the ST_CellType simple type)
 *
*/

// start of sheetData
file_text_write_string(file,'<sheetData>');
file_text_writeln(file);

var list;
var str;



////////// ALL THE FIRST PAGE ITEMS STUFF IS HERE /////////////
xlsx_firstPageItems(); 
show_debug_message("END OF FIRST PAGE ITEMS");


///////////// GENERAL ITEMS /////////////////

// CREATE COMBINED LIST (global.listOfItems and LAST_PAGE_ITEMS)
var list1    = ds_list_create();
ds_list_copy(list1, global.listOfItems);
var list2    = global.LAST_PAGE_ITEMS;
combinedList = combine_lists(list1,list2);
reorder_list(combinedList);       // sort the list based on each item's row. (we do this because global.listOfItems ends with several TOTALS and PAGE_NUMBERs.



//// ITEMS ////
itemNumberCount     = 0;
combinedListSize    = ds_list_size(combinedList);
var prevYear        = 0;
var prevMonth       = 0;
var prevDay         = 0;
var totalFirstPageItems = ds_list_find_index(combinedList,firstPage_Address.id);
lastItem            = -1;



// ITEM LOOP
for (var i=(totalFirstPageItems+1); i<combinedListSize; i++)
{
    // setup
    iteration           = 0;
    item                = ds_list_find_value(combinedList,i);
    var itemListSize    = ds_list_size(item.shownDescriptionList);
    qRow = (item.row + (itemListSize-1))                        // the row of each item where their quantum goes
    itemListSize        = max(itemListSize,item.dateLines)      // because if we have 3 lines of dates we need that to be the minimum
    
    // Total Rows
    var totalRows       = (itemListSize + item.seeFeeLater);
    itemEndRow          = ((item.row + totalRows)-1);
    
    
    // Quantum row
    qRow = max(item.row,qRow);                                                          // minimum qRow is item.row
    
    if (global.BILL_COURT == "Circuit")
    {
        if (item.object_index == lastPage_drawingCostsAndCopy) then qRow = (item.row);
    }
    else // "Highcourt"
    { 
        if (item.object_index == lastPage_drawingCostsAndCopy) then qRow = (item.row + 1);
    }
    
    if (item.object_index == TOTALS) then qRow = item.row;
    if (item.object_index == lastPage_OutlayToTotal) then qRow = item.row;
     
    // SKIP these items
    if xlsx_item_description_is_irregular(item) then totalRows = 0;           
    
    // OVERRIDE Total Rows for irregular items, otherwise they will not print!
    if (item.object_index == TOTALS)                        then totalRows = 1;
    
    
    if (global.BILL_COURT == "Circuit")
    {
        if (item.object_index == lastPage_drawingCostsAndCopy)  then totalRows = 1;
    }
    else // "Highcourt"
    { 
        if (item.object_index == lastPage_drawingCostsAndCopy)  then totalRows = 2;
    }
    
    if (item.object_index == lastPage_SUBTOTAL)             then totalRows = 1;
    if (item.object_index == lastPage_OutlayToTotal)        then totalRows = 1;
    if (item.object_index == lastPage_DatedSignature)       then totalRows = 3;
    if (item.object_index == lastPage_Address)              then totalRows = 7;
    if (item.object_index == lastPage_VATNumbers)           then totalRows = 4;
    if (item.object_index == WITNESS)                       then totalRows = (ds_list_size(item.nameList) + ds_list_size(item.descriptionList));
    
    
    // CONTENT LOOP
    while (iteration < totalRows)
    {
        // NEXT ROW
        current_row = (item.row + iteration);
        
        
        // START THE ROW <row r="...">
        file_text_write_string(file,'<row r="' +string(current_row) +'" outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');
        show_debug_message("working on row " +string(current_row));
        file_text_writeln(file);
        
        
        // DATE
        xlsx_date();
        
        
        // ITEM NUMBER COUNT
        xlsx_itemNumberCount();
        
        
        /// DESCRIPTION
        if ( xlsx_item_description_is_irregular(item) )
          then xlsx_description_irregularItem();
          else xlsx_description_regularItem();
        
        
        // OUTLAY / PROFESSIONAL
        xlsx_quantum();
        
        
        // END THE ROW </row>
        file_text_write_string(file,'</row>');
        file_text_writeln(file);
        
        iteration ++;
    }
}



        



file_text_write_string(file,'</sheetData>');
file_text_writeln(file);
// end of sheetData


// sheet protection, delete this line to remove
//file_text_write_string(file,'<sheetProtection deleteRows="false" deleteColumns="false" insertRows="false" insertColumns="false" scenarios="true" objects="true" password="ab87" sheet="true"/>');





// print options stuff
file_text_write_string(file,'<printOptions verticalCentered="false" horizontalCentered="false" gridLinesSet="true" gridLines="false" headings="false"/>');
file_text_writeln(file);

file_text_write_string(file,'<pageMargins footer="0.511805555555555" header="0.511805555555555" bottom="0.393055555555556" top="0.393055555555556" right="0.550694444444444" left="0.472222222222222"/>');
file_text_writeln(file);

file_text_write_string(file,'<pageSetup copies="1" verticalDpi="300" horizontalDpi="300" useFirstPageNumber="false" cellComments="none" draft="false" blackAndWhite="false" orientation="portrait" pageOrder="downThenOver" fitToHeight="1" fitToWidth="1" firstPageNumber="1" scale="98" paperSize="9"/>');
file_text_writeln(file);


file_text_write_string(file,'<headerFooter differentOddEven="false" differentFirst="false">');
file_text_writeln(file);

file_text_write_string(file,'<oddHeader> </oddHeader>');
file_text_writeln(file);

file_text_write_string(file,'<oddFooter> </oddFooter>');
file_text_writeln(file);

file_text_write_string(file,'</headerFooter>');
file_text_writeln(file);



// WORKSHEET OPTIONS (needed to fix pagebreaks apparently)
/*
file_text_write_string(file,'<WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">');
file_text_writeln(file);
file_text_write_string(file,'<Print>');
file_text_writeln(file);
file_text_write_string(file,'<ValidPrinterInfo/>');
file_text_writeln(file);
file_text_write_string(file,'<HorizontalResolution>600</HorizontalResolution>');
file_text_writeln(file);
file_text_write_string(file,'<VerticalResolution>600</VerticalResolution>');
file_text_writeln(file);
file_text_write_string(file,'</Print>');
file_text_writeln(file);
file_text_write_string(file,'</WorksheetOptions>');
*/


/// PAGE BREAKS
var totalPages  = (global.totalRows / global.rowsPerPage)
var breakRow    = 0;

file_text_write_string(file,'<rowBreaks manualBreakCount="'+string(totalPages) +'" count="'+string(totalPages) +'">');
file_text_writeln(file);

for(i=0;i<totalPages;i++)
{
    breakRow += global.rowsPerPage;
    file_text_write_string(file,'<brk min="0" max="16383" man="true" id="'+string(breakRow)+'"/>');
    file_text_writeln(file);
}

file_text_write_string(file,'</rowBreaks>');
file_text_writeln(file);



// END
file_text_write_string(file,'</worksheet>');
file_text_writeln(file);

file_text_write_string(sharedStrings,'</sst>');


// CLEAN UP
file_text_close(file);
file_text_close(sharedStrings);

global.xlsxReady ++;
