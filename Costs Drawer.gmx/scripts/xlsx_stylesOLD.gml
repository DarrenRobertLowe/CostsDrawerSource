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




//// DEFINE THE FONTS /////////////////////////
file_text_write_string(file,'<fonts count="8">'); // does 0 count as 1 ???
file_text_writeln(file);


// font 0 = Times 14 regular left
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


// font 1 = Times 14 bold left
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


// font 2 = Times 14 italics left
file_text_write_string(file,'<font>');
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


// font 3 = Times 14 bold and italics left
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


// font 4 = Times 11 italics left
file_text_write_string(file,'<font>');
file_text_writeln(file);

file_text_write_string(file,'<i val="true"/>');                 // italics
file_text_writeln(file);

file_text_write_string(file,'<sz val="11"/>');                  // size 11
file_text_writeln(file);

file_text_write_string(file,'<name val="Times New Roman"/>');
file_text_writeln(file);

file_text_write_string(file,'<family val="1"/>');
file_text_writeln(file);

file_text_write_string(file,'<charset val="1"/>');
file_text_writeln(file);

file_text_write_string(file,'</font>');
file_text_writeln(file);


// font 5 = Times 10 regular left
file_text_write_string(file,'<font>');
file_text_writeln(file);

file_text_write_string(file,'<sz val="10"/>');                  // size 10
file_text_writeln(file);

file_text_write_string(file,'<name val="Times New Roman"/>');
file_text_writeln(file);

file_text_write_string(file,'<family val="1"/>');
file_text_writeln(file);

file_text_write_string(file,'<charset val="1"/>');
file_text_writeln(file);

file_text_write_string(file,'</font>');
file_text_writeln(file);


// font 6 = Times 8 italics left
file_text_write_string(file,'<font>');
file_text_writeln(file);

file_text_write_string(file,'<i val="true"/>');                 // italics
file_text_writeln(file);

file_text_write_string(file,'<sz val="8"/>');                   // size 8
file_text_writeln(file);

file_text_write_string(file,'<name val="Times New Roman"/>');
file_text_writeln(file);

file_text_write_string(file,'<family val="1"/>');
file_text_writeln(file);

file_text_write_string(file,'<charset val="1"/>');
file_text_writeln(file);

file_text_write_string(file,'</font>');
file_text_writeln(file);

// font 7 = Times 10 italics left (VAT Numbers)
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


// font 8 = Times 14 underlined left (VAT Numbers)
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




file_text_write_string(file,'</fonts>');
file_text_writeln(file);
//////////////////////////////////////////



//// FILLS ////////////////////////
file_text_write_string(file,'<fills count="1">');
file_text_writeln(file);


file_text_write_string(file,'<fill>');
file_text_writeln(file);

file_text_write_string(file,'<patternFill patternType="none"/>');
file_text_writeln(file);

file_text_write_string(file,'</fill>');
file_text_writeln(file);


file_text_write_string(file,'</fills>');
file_text_writeln(file);
////////////////////////////////////////



//// BORDERS /////////
file_text_write_string(file,'<borders count="2">');
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






//// COLUMN STYLES ////
file_text_write_string(file,'<cellStyleXfs count="2">');
file_text_writeln(file);

// none
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" applyAlignment="true" applyBorder="true" applyFont="true" borderId="0" fillId="0" fontId="0" xfId="0">');
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="general"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>');
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);

// left right | |
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" applyAlignment="true" applyBorder="true" applyFont="true" borderId="1" fillId="0" fontId="0" xfId="1">');
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="general"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>');
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);

// end
file_text_write_string(file,'</cellStyleXfs>');
file_text_writeln(file);

////////////////////////////////////////






//// CREATING THE INDIVIDUAL CELL STYLINGS ////
/* Overwrites COLUMN styles
 * These are applied to each cell individually in sheet1.xml with (s="2") (s="6") etc
*/
file_text_write_string(file,'<cellXfs count="13">');
file_text_writeln(file);


// s0 = DESCRIPTION
// applyBorder="false" borderId="0"
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" applyAlignment="false" applyFont="false" fillId="0" fontId="0" xfId="0">');
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="left"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>'); // we don't want to lock the cells as we'll be protecting the column widths
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);

// s1 = PAGE_NUMBER
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" applyBorder="false" borderId="0" applyAlignment="false" applyFont="false" fillId="0" fontId="0" xfId="1">');
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="center"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>'); // we don't want to lock the cells as we'll be protecting the column widths
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);


// s2 = DATES & ITEM NUMBERS
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" applyBorder="true" borderId="1" applyAlignment="true" applyFont="false" fillId="0" fontId="0" xfId="2">');
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="right"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>'); // we don't want to lock the cells as we'll be protecting the column widths
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);

// s3 = QUANTA
file_text_write_string(file,'<xf numFmtId="165" applyProtection="'+string(global.protectSheet)+'" applyAlignment="true" applyBorder="true" applyFont="false" borderId="1" fillId="0" fontId="0" xfId="0">');
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="right"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>'); // we don't want to lock the cells as we'll be protecting the column widths
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);


// s4 = Bold Times 14 Left cell type (i.e. firstPage_Address)
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" applyBorder="false" borderId="0" applyAlignment="false" applyFont="true" fillId="0" fontId="1" xfId="4">');
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="left"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>');
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);


// s5 = Bold Italics Times 14 Left cell type (i.e. lastPage_Address) (CONFIRMED)
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" applyBorder="false" borderId="0" applyAlignment="false" applyFont="true" fillId="0" fontId="3" xfId="5">');
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="left"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>');
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);


// s6 = Times 11 underline left
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" applyBorder="false" applyAlignment="true" borderId="0" applyFont="true" fillId="0" fontId="8" xfId="6">');
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="left"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>');
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);


// s7 = italics Times 11 left cell type style (end of bill stuff)
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" applyBorder="true" applyAlignment="true" borderId="1" applyFont="true" fillId="0" fontId="5" xfId="7">');
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="left"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>');
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);


// s8 = itlics Times 8 left cell type style (VAT numbers) (CONFIRMED)
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" applyBorder="false" applyAlignment="true" borderId="0" applyFont="true" fillId="0" fontId="6" xfId="8">');
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="left"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>');
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);


// s9 = VAT Numbers??
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" applyBorder="false" applyAlignment="true" borderId="0" applyFont="true" fillId="0" fontId="7" xfId="9">');
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="left"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>');
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);


// s10 = TOTALS (bordered);
file_text_write_string(file,'<xf numFmtId="165" applyProtection="'+string(global.protectSheet)+'" applyAlignment="true" applyBorder="true" applyFont="false" borderId="2" fillId="0" fontId="0" xfId="0">');
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="right"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>');
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);



// s11 = SEE FEE LATER
file_text_write_string(file,'<xf numFmtId="164" applyProtection="'+string(global.protectSheet)+'" applyAlignment="true" applyFont="false" fillId="0" fontId="0" xfId="0">');
file_text_writeln(file);

file_text_write_string(file,'<alignment shrinkToFit="false" indent="0" wrapText="false" textRotation="0" vertical="bottom" horizontal="center"/>');
file_text_writeln(file);

file_text_write_string(file,'<protection hidden="false" locked="'+string(global.protectSheet)+'"/>'); // we don't want to lock the cells as we'll be protecting the column widths
file_text_writeln(file);

file_text_write_string(file,'</xf>');
file_text_writeln(file);


// s12 = INSTRUCTIONS FEE TOTAL;
file_text_write_string(file,'<xf numFmtId="165" applyProtection="'+string(global.protectSheet)+'" applyAlignment="true" applyBorder="true" applyFont="false" borderId="0" fillId="0" fontId="0" xfId="0">');
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
file_text_write_string(file,'<cellStyles count="0">');
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



file_text_write_string(file,'</styleSheet>');
file_text_writeln(file);
file_text_close(file);
global.xlsxReady ++;
