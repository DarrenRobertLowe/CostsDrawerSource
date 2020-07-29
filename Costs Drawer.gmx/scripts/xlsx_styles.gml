var file = file_text_open_write("xlsx\xl\styles.xml");



//// SETUP //////////////////////////////
file_text_write_string(file,'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>');
file_text_writeln(file);

file_text_write_string(file,'<styleSheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">');
file_text_writeln(file);
////////////////////////////////////////



//// number formats ////////////////////////
file_text_write_string(file,'<numFmts count="2">');
file_text_writeln(file);

file_text_write_string(file,'<numFmt formatCode="General" numFmtId="164"/>');   // for dates
file_text_writeln(file);
file_text_write_string(file,'<numFmt formatCode="0.00" numFmtId="165"/>');      // for quantum
file_text_writeln(file);

file_text_write_string(file,'</numFmts>');
file_text_writeln(file);
////////////////////////////////////////////




//// DEFINE THE FONT IDs /////////////////////////
file_text_write_string(file,'<fonts count="5">');
file_text_writeln(file);


// font 0 = Times 14 regular left (NORMAL)
file_text_write_string(file,'<font>');
file_text_writeln(file);

file_text_write_string(file,'<sz val="14"/>');                  // size 14
file_text_writeln(file);

file_text_write_string(file,'<name val="Times New Roman"/>');
file_text_writeln(file);

file_text_write_string(file,'<family val="1"/>');
file_text_writeln(file);

file_text_write_string(file,'<charset val="1"/>');
file_text_writeln(file);

file_text_write_string(file,'</font>');
file_text_writeln(file);


// font 1 = Times 14 bold left (BOLD - Names, Witnesses, etc)
file_text_write_string(file,'<font>');
file_text_writeln(file);

file_text_write_string(file,'<b val="true"/>');                 // bold
file_text_writeln(file);

file_text_write_string(file,'<sz val="14"/>');                  // size 14
file_text_writeln(file);

file_text_write_string(file,'<name val="Times New Roman"/>');
file_text_writeln(file);

file_text_write_string(file,'<family val="1"/>');
file_text_writeln(file);

file_text_write_string(file,'<charset val="1"/>');
file_text_writeln(file);

file_text_write_string(file,'</font>');
file_text_writeln(file);


// font 2 = Times 14 bold and italics left (ADDRESS)
file_text_write_string(file,'<font>');
file_text_writeln(file);

file_text_write_string(file,'<b val="true"/>');                 // bold
file_text_writeln(file);

file_text_write_string(file,'<i val="true"/>');                 // italics
file_text_writeln(file);

file_text_write_string(file,'<sz val="14"/>');                  // size 14
file_text_writeln(file);

file_text_write_string(file,'<name val="Times New Roman"/>');
file_text_writeln(file);

file_text_write_string(file,'<family val="1"/>');
file_text_writeln(file);

file_text_write_string(file,'<charset val="1"/>');
file_text_writeln(file);

file_text_write_string(file,'</font>');
file_text_writeln(file);


// font 3 = Times 14 underlined left (WITNESSES HEADER)
file_text_write_string(file,'<font>');
file_text_writeln(file);

file_text_write_string(file,'<u val="single"/>');                   // underline
file_text_writeln(file);

file_text_write_string(file,'<sz val="14"/>');                      // size 10
file_text_writeln(file);

file_text_write_string(file,'<name val="Times New Roman"/>');
file_text_writeln(file);

file_text_write_string(file,'<family val="1"/>');
file_text_writeln(file);

file_text_write_string(file,'<charset val="1"/>');
file_text_writeln(file);

file_text_write_string(file,'</font>');
file_text_writeln(file);


// font 4 = Times 10 italics left (VAT NUMBERS)
file_text_write_string(file,'<font>');
file_text_writeln(file);

file_text_write_string(file,'<i val="true"/>');                  // italics
file_text_writeln(file);

file_text_write_string(file,'<sz val="10"/>');                   // size 10
file_text_writeln(file);

file_text_write_string(file,'<name val="Times New Roman"/>');
file_text_writeln(file);

file_text_write_string(file,'<family val="1"/>');
file_text_writeln(file);

file_text_write_string(file,'<charset val="1"/>');
file_text_writeln(file);

file_text_write_string(file,'</font>');
file_text_writeln(file);


file_text_write_string(file,'</fonts>');
file_text_writeln(file);
//////////////////////////////////////////



//// FILLS ////////////////////////
file_text_write_string(file,'<fills count="2">');
file_text_writeln(file);


file_text_write_string(file,'<fill>');
file_text_writeln(file);

file_text_write_string(file,'<patternFill patternType="none"/>');
file_text_writeln(file);

file_text_write_string(file,'</fill>');
file_text_writeln(file);

file_text_write_string(file,'<fill>');
file_text_writeln(file);

file_text_write_string(file,'<patternFill patternType="gray125"/>');
file_text_writeln(file);

file_text_write_string(file,'</fill>');
file_text_writeln(file);

file_text_write_string(file,'</fills>');
file_text_writeln(file);
////////////////////////////////////////




//// BORDERS /////////
file_text_write_string(file,'<borders count="3">');
file_text_writeln(file);

// none : 0
file_text_write_string(file,'<border diagonalDown="false" diagonalUp="false">');
file_text_writeln(file);
file_text_write_string(file,'<left/>');
file_text_writeln(file);
file_text_write_string(file,'<right/>');
file_text_writeln(file);
file_text_write_string(file,'<top/>');
file_text_writeln(file);
file_text_write_string(file,'<bottom/>');
file_text_writeln(file);
file_text_write_string(file,'<diagonal/>');
file_text_writeln(file);
file_text_write_string(file,'</border>');
file_text_writeln(file);

// left right | | : 1
file_text_write_string(file,'<border diagonalDown="false" diagonalUp="false">');
file_text_writeln(file);
file_text_write_string(file,'<left style="hair"/>');
file_text_writeln(file);
file_text_write_string(file,'<right style="hair"/>');
file_text_writeln(file);
file_text_write_string(file,'<top/>');
file_text_writeln(file);
file_text_write_string(file,'<bottom/>');
file_text_writeln(file);
file_text_write_string(file,'<diagonal/>');
file_text_writeln(file);
file_text_write_string(file,'</border>');
file_text_writeln(file);

// top (TOTALS) ______ : 2
file_text_write_string(file,'<border diagonalDown="false" diagonalUp="false">');
file_text_writeln(file);
file_text_write_string(file,'<left style="hair"/>');
file_text_writeln(file);
file_text_write_string(file,'<right style="hair"/>');
file_text_writeln(file);
file_text_write_string(file,'<top style="hair"/>');
file_text_writeln(file);
file_text_write_string(file,'<bottom/>');
file_text_writeln(file);
file_text_write_string(file,'<diagonal/>');
file_text_writeln(file);
file_text_write_string(file,'</border>');
file_text_writeln(file);


file_text_write_string(file,'</borders>');
file_text_writeln(file);
////////////////////////////////////////




// CELL STYLES xfId
// Seems to be a starting point or base for styles
// and is required for fonts to work.
// CellXfs are cascaded from here to some extent.
file_text_write_string(file,'<cellStyleXfs count="1">');
file_text_writeln(file);

// none
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" applyAlignment="true" fillId="0" applyBorder="true" applyFont="true" xfId="0">');// borderId="0"  fontId="0" 
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="general"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>');
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);
/*
// 
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" applyAlignment="true" applyBorder="true" applyFont="true" borderId="1" fillId="0" fontId="0" xfId="0">');
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="general"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>');
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);


// 
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" applyAlignment="true" applyBorder="true" applyFont="true" borderId="2" fillId="0" fontId="0" xfId="0">');
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="general"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>');
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);
*/
// end
file_text_write_string(file,'</cellStyleXfs>');
file_text_writeln(file);

////////////////////////////////////////






//// CREATING THE INDIVIDUAL CELL STYLINGS ////
/* These are applied to each cell individually in sheet1.xml with (s="2") (s="6") etc */
file_text_write_string(file,'<cellXfs count="10">');
file_text_writeln(file);


// s0 = DESCRIPTION
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" fontId="0" xfId="0">'); // applyAlignment="false" applyFont="false" 
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="left"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>'); 
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);

// s1 = PAGE_NUMBER and SEE FEE LATER (text is centered)
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" borderId="0" fontId="0" xfId="0">'); //applyAlignment="false" applyFont="false" applyBorder="false" 
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="center"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>'); 
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);


// s2 = ITEM NUMBERS (aligned right)
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" borderId="1" fontId="0" xfId="0">'); // applyAlignment="true" applyFont="false" applyBorder="true" 
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="right"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>'); 
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);


// s3 = QUANTA ( aligned right AND number format is different (165) )
file_text_write_string(file,'<xf numFmtId="165" applyProtection="'+string(global.protectSheet)+'" borderId="1" fontId="0" xfId="0">'); // applyAlignment="true" applyFont="false" applyBorder="true" 

file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="right"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>'); 
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);


// s4 = Bold Times 14 Left cell type (firstPage_Address, Plaintiffs and Defendants, Witness names and occupations)
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" borderId="0" fontId="1" xfId="0">'); // applyAlignment="false" applyFont="true" applyBorder="false" 
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="left"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>');
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);


// s5 = Bold Italics Times 14 Left cell type (i.e. lastPage_Address) (CONFIRMED)
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" borderId="0" fontId="2" xfId="0">'); // applyAlignment="false" applyFont="true" applyBorder="false" 
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="left"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>');
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);


// s6 = Times 11 underline left (WITNESSES EXPENSES Header)
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" borderId="0" fontId="3" xfId="0">'); //applyAlignment="true" applyFont="true" applyBorder="false" 
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="left"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>');
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);


// s7 = itlics Times 8 left cell type style (VAT numbers) (CONFIRMED)
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" borderId="0" fontId="4" xfId="0">'); //applyAlignment="true" applyFont="true" applyBorder="false" 
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="left"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>');
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);


// s8 = TOTALS (upper border);
file_text_write_string(file,'<xf numFmtId="165" applyProtection="'+string(global.protectSheet)+'" borderId="2" fontId="0" xfId="0">'); //applyAlignment="true"  applyFont="true" applyBorder="true" 
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="right"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>');
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);

// s9 = INSTRUCTIONS FEE TOTAL (aligned right, no border) // note: applyAlignment="true" is needed here for some reason, despite being declared by xfId 0. Because xlsx.
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" applyAlignment="true" borderId="0" fontId="0" xfId="0">'); // applyFont="false" applyBorder="true" 
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="right"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>'); 
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);

// end
file_text_write_string(file,'</cellXfs>');
file_text_writeln(file);





//// CUSTOM NAMED STYLES RATHER THAN IDs ABOVE ////
/* DO NOT DELETE OR CHANGE */
/*
file_text_write_string(file,'<cellStyles count="6">');
file_text_writeln(file);

file_text_write_string(file,'<cellStyle xfId="0" customBuiltin="false" builtinId="0" name="Normal"/>');
file_text_writeln(file);

file_text_write_string(file,'<cellStyle xfId="15" customBuiltin="false" builtinId="3" name="Comma"/>');
file_text_writeln(file);

file_text_write_string(file,'<cellStyle xfId="16" customBuiltin="false" builtinId="6" name="Comma [0]"/>');
file_text_writeln(file);

file_text_write_string(file,'<cellStyle xfId="17" customBuiltin="false" builtinId="4" name="Currency"/>');
file_text_writeln(file);

file_text_write_string(file,'<cellStyle xfId="18" customBuiltin="false" builtinId="7" name="Currency [0]"/>');
file_text_writeln(file);

file_text_write_string(file,'<cellStyle xfId="19" customBuiltin="false" builtinId="5" name="Percent"/>');
file_text_writeln(file);

file_text_write_string(file,'</cellStyles>');
file_text_writeln(file);
////////////////////////////////////////

*/

file_text_write_string(file,'</styleSheet>');
file_text_writeln(file);
file_text_close(file);
global.xlsxReady ++;
