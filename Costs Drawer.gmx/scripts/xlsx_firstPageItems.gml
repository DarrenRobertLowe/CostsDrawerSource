var item;
var list;
var str;


/// FIRST PAGE \\\
// JURISDICTION INFO (CIRCUIT COURT OR HIGH COURT)
item = firstPage_CourtInfo;
file_text_write_string(file,'<row r="'+string(item.row)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
file_text_writeln(file);

    // e.g "An Chuirt Chuarda" or ""
    var desc = ds_list_find_value(item.shownDescriptionList,0);
    str = xlsx_convert_special_chars(desc);
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    //show_debug_message("Court 1 : " +string(str) + " written as index " +string(sharedStringIndex));

    file_text_write_string(file,'<c r="D' + string(item.row) + '" t="s" s="' +string(item.xlsx_styleID) +'">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
// end item  
file_text_write_string(file,'</row>');
file_text_writeln(file);
    

// next line
file_text_write_string(file,'<row r="' +string(item.row + 1) +'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
file_text_writeln(file);
    // e.g "The Circuit Court" or "THE HIGH COURT"
    var desc = ds_list_find_value(item.shownDescriptionList,1);
    str = xlsx_convert_special_chars(desc);
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    //show_debug_message("Court 2 : " +string(str) + " written as index " +string(sharedStringIndex));

    file_text_write_string(file,'<c r="D' + string(item.row + 1) + '" t="s" s="' +string(item.xlsx_styleID) +'">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
// end item    
file_text_write_string(file,'</row>');
file_text_writeln(file);




/// RECORD NUMBER
item = firstPage_record_number;

file_text_write_string(file,'<row r="'+string(item.row)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
file_text_writeln(file);

    str  = xlsx_convert_special_chars("Record No. " +string(global.recordNumber));
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    
    file_text_write_string(file,'<c r="D' + string(item.row) + '" t="s" s="0">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
// end item
file_text_write_string(file,'</row>');
file_text_writeln(file);



/// REGION LINE 1
item = firstPage_regionInfo_line1_docVer21;

file_text_write_string(file,'<row r="'+string(item.row)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
file_text_writeln(file);


    str  = xlsx_convert_special_chars(firstPage_regionInfo_line1_docVer21.description);
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    show_debug_message("Region 1 : " +string(str) + " written as index " +string(sharedStringIndex));
    
    file_text_write_string(file,'<c r="D' + string(item.row) + '" t="s" s="0">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
// end item
file_text_write_string(file,'</row>');
file_text_writeln(file);

/// REGION LINE 2
item = firstPage_regionInfo_line2_docVer21;

file_text_write_string(file,'<row r="'+string(item.row)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
file_text_writeln(file);

    str  = xlsx_convert_special_chars(firstPage_regionInfo_line2_docVer21.description);
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    show_debug_message("Region 2 : " +string(str) + " written as index " +string(sharedStringIndex));
    
    file_text_write_string(file,'<c r="D' + string(item.row) + '" t="s" s="0">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
// end item
file_text_write_string(file,'</row>');
file_text_writeln(file);

/// REGION LINE 3
item = firstPage_regionInfo_line3_docVer21;

file_text_write_string(file,'<row r="'+string(item.row)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
file_text_writeln(file);

    str  = xlsx_convert_special_chars(firstPage_regionInfo_line3_docVer21.description);
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    show_debug_message("Region 3 : " +string(str) + " written as index " +string(sharedStringIndex));
    
    file_text_write_string(file,'<c r="D' + string(item.row) + '" t="s" s="0">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
// end item
file_text_write_string(file,'</row>');
file_text_writeln(file);





// PLAINTIFFS
var size = ds_list_size(global.PLAINTIFFS);

for (var i=0; i<size; i++)
{
    var plaintiff   = ds_list_find_value(global.PLAINTIFFS,i);
    var list2       = plaintiff.descriptionList;
    var size2       = ds_list_size(list2);
    var andShown    = plaintiff.showingAndText;
    
    
    for (var s=(0 - andShown); s<size2; s++) // iterate through the description list
    {
        var newRow = (plaintiff.row + andShown + s);
        var value = "";
        
        if (s == -1)
        {
            value = "and"; // plaintiff.andText;
        }
        else
        {
            value = ds_list_find_value(list2, s);
        }
        
        
        /// row of each description line ///
        file_text_write_string(file,'<row r="' + string(newRow) +'" spans="1:7">');     // outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
        file_text_writeln(file);
        
        // set the style
        if (s == -1)
        {
            file_text_write_string(file,'<c r="D' +string(newRow) + '" t="s" s="0">')   // normal text for "and"
        }
        if (s >= 0)
        {
            file_text_write_string(file,'<c r="D' +string(newRow) + '" t="s" s="4">')   // bold text for a name
        }
        
        
        /// string from each description line ///
        // grab the description
        var str = "";
        
        if (value != "and")
        {
            value = string_upper(value);
        }
        
        str  = xlsx_convert_special_chars(value);
        var  sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
//show_debug_message("Plaintiff : " +string(str) + " written as index " +string(sharedStringIndex));
        
        // write description to worksheet
        file_text_writeln(file);
        file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
        file_text_writeln(file);
        file_text_write_string(file,'</c>');
        file_text_writeln(file);
        
        /// end the row ///
        file_text_write_string(file,'</row>');
        file_text_writeln(file);
    }
    
    
    /// "and others" ? ///
    if (plaintiff.andOthers == true)
    {
        var othersRow = (plaintiff.row + andShown + size2 + 1);
        /// row of each description line ///
        file_text_write_string(file,'<row r="' + string(othersRow) +'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
        file_text_writeln(file);
        
        // set the style
        file_text_write_string(file,'<c r="D' +string(othersRow) + '" t="s" s="4">')                             // bold text
        
        
        /// string from each description line ///
        // grab the description
        var str  = xlsx_convert_special_chars(plaintiff.andOthersText);
        var sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
        
        //file_text_write_string(file,'<c r="D' + string(item.row) + '" t="s" s="0">')
        file_text_writeln(file);
        file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
        file_text_writeln(file);
        file_text_write_string(file,'</c>');
        file_text_writeln(file);
        
        /// end the row ///
        file_text_write_string(file,'</row>');
        file_text_writeln(file);
    }
}


///// firstPage_Plaintiffs ////
// start row
var item  = firstPage_Plaintiffs;
var value = firstPage_Plaintiffs.plaintiffString;

// "                Plaintiff(s)" text
/// row of each description line ///
file_text_write_string(file,'<row r="' + string(item.row) +'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
file_text_writeln(file);

// set the style
file_text_write_string(file,'<c r="D' +string(item.row) + '" t="s" s="0">') // normal text


/// string from each description line ///
// grab the description
var str  = xlsx_convert_special_chars(value);
var sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex


file_text_writeln(file);
file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
file_text_writeln(file);
file_text_write_string(file,'</c>');
file_text_writeln(file);



        /// outlay and pro for some reason
        /*
        file_text_write_string(file,'<c r="E' + string(item.row) + '" t="s" s="0">')
        file_text_write_string(file,'</c>');
        file_text_writeln(file);
        
        file_text_write_string(file,'<c r="G' + string(item.row) + '" t="s" s="0">')
        file_text_write_string(file,'</c>');
        file_text_writeln(file);
        */
        
/// end the row ///
file_text_write_string(file,'</row>');
file_text_writeln(file);





// "AND" bewteen PLAINTIFFS AND DEFENDANTS
var list = item.descriptionList;
for (var i=0; i<ds_list_size(list); i++) // iterate through the description list
{
    var newRow = (item.row +1 +i);
    var value = ds_list_find_value(list,i);
    
    /// row of each description line ///
    file_text_write_string(file,'<row r="' + string(newRow) +'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
    file_text_writeln(file);
    
    // set the style
    file_text_write_string(file,'<c r="D' +string(newRow) + '" t="s" s="4">')
    
    
    /// string from each description line ///
    // grab the description
    var str = xlsx_convert_special_chars(value);
    //str = string_upper(str);
    var sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    
    
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
    
    /// outlay and pro for some reason
    /*
    file_text_write_string(file,'<c r="E' + string(newRow) + '" t="s" s="0">')
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
    file_text_write_string(file,'<c r="G' + string(newRow) + '" t="s" s="0">')
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    */
    
    /// end the row ///
    file_text_write_string(file,'</row>');
    file_text_writeln(file);
}




// DEFENDANTS
var size = ds_list_size(global.DEFENDANTS);

for (var i=0; i<size; i++)  // iterate through defendants
{
    var defendant   = ds_list_find_value(global.DEFENDANTS,i);  //show_debug_message("STARTING ON " +string(defendant));
    var dList       = defendant.descriptionList;
    var dSize       = ds_list_size(dList);
    var andShown    = defendant.showingAndText;                 //show_debug_message(string(defendant) +" showingAndText = " +string(andShown));
    
                                                                //show_debug_message("actual row = " +string(defendant.row));
    for (var line = (0-andShown); line<dSize; line++)           // iterate through the description list
    {                                                           //show_debug_message("line = "+string(line));
        var newRow = (defendant.row + andShown + line);         //show_debug_message("now on row " +string(newRow));
        
        var value = "";
        
        if (line == -1)
        {
            value = "and";                                     //show_debug_message("line = -1 so value = "+string(value));
        }
        
        if (line >= 0)
        {
            value = ds_list_find_value(dList, line);            //show_debug_message("line >= 0 so value = "+string(value));
        }
        
        
        /// row of each description line ///
        file_text_write_string(file,'<row r="' + string(newRow) +'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
        file_text_writeln(file);
        
        
        /// string from each description line ///
        // grab the description
        var str = "";
        
        if (line >= 0)
        {
            value = string_upper(value); // capitalize names
        }
        
        str  = xlsx_convert_special_chars(value);
        var sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
//show_debug_message("Defendant : " +string(str) + " written as index " +string(sharedStringIndex));
        
        
        // set the style
        if (line == -1)
        {
            file_text_write_string(file,'<c r="D' +string(newRow) + '" t="s" s="0">') // normal text for "and"
        }
        else file_text_write_string(file,'<c r="D' +string(newRow) + '" t="s" s="4">') // bold text for a name
        
        file_text_writeln(file);
        file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
        file_text_writeln(file);
        file_text_write_string(file,'</c>');
        file_text_writeln(file);
        
        /// end the row ///
        file_text_write_string(file,'</row>');
        file_text_writeln(file);
        
//show_debug_message("item end");
    }
    
    

    /// "and others" ? ///
    if (defendant.andOthers == true)
    {
        var othersRow = (defendant.row + andShown + dSize + 1);
        /// row of each description line ///
        file_text_write_string(file,'<row r="' + string(othersRow) +'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
        file_text_writeln(file);
        
        // set the style
        file_text_write_string(file,'<c r="D' +string(othersRow) + '" t="s" s="4">')                             // bold text
        
        
        /// string from each description line ///
        // grab the description
        var str  = xlsx_convert_special_chars(defendant.andOthersText);
        var sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
        
        file_text_writeln(file);
        file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
        file_text_writeln(file);
        file_text_write_string(file,'</c>');
        
        /// end the row ///
        file_text_writeln(file);
        file_text_write_string(file,'</row>');
        file_text_writeln(file);
    }
}




///// firstPage_Defendants ////
// start row
var item  = firstPage_Defendants;
var value = item.defendantString;

// "                Defendant(s)" text
/// row of each description line ///
file_text_write_string(file,'<row r="' + string(item.row) +'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
file_text_writeln(file);

// set the style
file_text_write_string(file,'<c r="D' +string(item.row) + '" t="s" s="0">') // normal text


/// string from each description line ///
// grab the description
var str  = xlsx_convert_special_chars(value);
var sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex


file_text_writeln(file);
file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
file_text_writeln(file);
file_text_write_string(file,'</c>');
file_text_writeln(file);

/// end the row ///
file_text_write_string(file,'</row>');
file_text_writeln(file);







/*
/// PLAINTIFFS
var plaint  = firstPage_Plaintiffs;
var size    = ds_list_size(plaint.drawnPlaintiffs);
// iterate through every plaintiff
for(i=0; i<size; i++)
{
    var value = ds_list_find_value(plaint.drawnPlaintiffs,i);
    
    // start row
    file_text_write_string(file,'<row r="'+string(plaint.row + i)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
    file_text_writeln(file);
    
    // item data
    // set the style
    if (value == plaint.andText) then file_text_write_string(file,'<c r="D' +string(plaint.row + i) + '" t="s" s="4">') // normal text
    else file_text_write_string(file,'<c r="D' +string(plaint.row + i) + '" t="s" s="4">')                             // bold text
    
    // data
    str  = xlsx_convert_special_chars(value);
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    
    //file_text_write_string(file,'<c r="D' + string(item.row) + '" t="s" s="0">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);

    
    // end row
    file_text_write_string(file,'</row>');
    file_text_writeln(file);
}


/// "                                    Plaintiff"
// setup
var count    = ds_list_size(plaint.plaintiffs);
var endRow   = (plaint.row + count);
var myString = "";
if (count > 1)
  then myString = "                                    Plaintiffs";
  else myString = "                                    Plaintiff";


// start row
file_text_write_string(file,'<row r="'+string(endRow)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
file_text_writeln(file);


// item data
str  = myString;
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    
    file_text_write_string(file,'<c r="D' + string(endRow) + '" t="s" s="0">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);


// end row
file_text_write_string(file,'</row>');
file_text_writeln(file);







/// DEFENDANTS
var defend = firstPage_Defendants;

// iterate through every plaintiff
for(i=0; i<ds_list_size(defend.drawnDefendants); i++)
{
    var value = ds_list_find_value(defend.drawnDefendants,i);
    
    // start row
    file_text_write_string(file,'<row r="'+string(defend.row + i)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
    file_text_writeln(file);
    
    // item data
    // set the style
    if (value == defend.andText) then file_text_write_string(file,'<c r="D' +string(defend.row + i) + '" t="s" s="4">') // normal text : s="0"
    else file_text_write_string(file,'<c r="D' +string(defend.row + i) + '" t="s" s="4">') // bold text
    
    // data
    str  = xlsx_convert_special_chars(value);
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    
    //file_text_write_string(file,'<c r="D' + string(item.row) + '" t="s" s="0">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    

    // end row
    file_text_write_string(file,'</row>');
    file_text_writeln(file);
}
/// "                                    Defendants"
// setup
count = ds_list_size(defend.defendants);
endRow = (defend.row + count);
var myString = "";
if (count > 1)
  then myString = "                                    Defendants";
  else myString = "                                    Defendant";

// start row
file_text_write_string(file,'<row r="'+string(endRow)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
file_text_writeln(file);

// item data
str  = myString;
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    
    file_text_write_string(file,'<c r="D' + string(endRow) + '" t="s" s="0">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
// end row
file_text_write_string(file,'</row>');
file_text_writeln(file);

*/



/// Costs Type (purusant to...)
var obj     = firstPage_CostsType;
var thisRow = obj.row;
    
    // LINE 1
    file_text_write_string(file,'<row r="'+string(thisRow)+'" spans="1:7">');   // outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
    file_text_writeln(file);
    
    // item data
    str  = xlsx_convert_special_chars(obj.line1);
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    
    file_text_write_string(file,'<c r="D' + string(thisRow) + '" t="s" s="0">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
    
    // end row
    file_text_write_string(file,'</row>');
    file_text_writeln(file);
    
    
    // LINE 2
    thisRow++;
    file_text_write_string(file,'<row r="'+string(thisRow)+'" spans="1:7">'); // outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
    file_text_writeln(file);
    
    // item data
    str  = xlsx_convert_special_chars(obj.line2);
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    
    file_text_write_string(file,'<c r="D' + string(thisRow) + '" t="s" s="0">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
    // end row
    file_text_write_string(file,'</row>');
    file_text_writeln(file);
    
    // LINE 3
    thisRow++;
    file_text_write_string(file,'<row r="'+string(thisRow)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
    file_text_writeln(file);
    
    // item data
    if (obj.line3 != obj.defaultLine3)
      then str  = xlsx_convert_special_chars(obj.line3);
      else str = "";
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    
    file_text_write_string(file,'<c r="D' + string(thisRow) + '" t="s" s="0">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
    // end row
    file_text_write_string(file,'</row>');
    file_text_writeln(file);
    
    
    // LINE 4
    thisRow++;
    file_text_write_string(file,'<row r="'+string(thisRow)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
    file_text_writeln(file);
    
    // item data
    if (obj.line4 != obj.defaultLine4)
      then str = xlsx_convert_special_chars(obj.line4);
      else str = "";
      
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    
    file_text_write_string(file,'<c r="D' + string(thisRow) + '" t="s" s="0">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
    // end row
    file_text_write_string(file,'</row>');
    file_text_writeln(file);
    
    
    
/// ADDRESS
var obj     = firstPage_Address;
var thisRow = obj.row;

    // Address Line 1
    file_text_write_string(file,'<row r="'+string(thisRow)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
    file_text_writeln(file);
    
    // item data
    if (obj.addressLine1 != obj.defaultAddressLine1)
    then str = xlsx_convert_special_chars(obj.addressLine1);
    else str = "";
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    
    file_text_write_string(file,'<c r="D' + string(thisRow) + '" t="s" s="4">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
    // end row
    file_text_write_string(file,'</row>');
    file_text_writeln(file);
    
    
    
    
    // Address Line 2
    thisRow++;
    file_text_write_string(file,'<row r="'+string(thisRow)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
    file_text_writeln(file);
    
    // item data
    if (obj.addressLine2 != obj.defaultAddressLine2)
    then str = xlsx_convert_special_chars(obj.addressLine2);
    else str = "";
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    
    file_text_write_string(file,'<c r="D' + string(thisRow) + '" t="s" s="4">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
    // end row
    file_text_write_string(file,'</row>');
    file_text_writeln(file);
    
    
    // Address Line 3
    thisRow++;
    file_text_write_string(file,'<row r="'+string(thisRow)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
    file_text_writeln(file);
    
    // item data
    if (obj.addressLine3 != obj.defaultAddressLine3)
    then str = xlsx_convert_special_chars(obj.addressLine3);
    else str = "";
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    
    file_text_write_string(file,'<c r="D' + string(thisRow) + '" t="s" s="4">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
    // end row
    file_text_write_string(file,'</row>');
    file_text_writeln(file);


    // Address Line 4
    thisRow++;
    file_text_write_string(file,'<row r="'+string(thisRow)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
    file_text_writeln(file);
    
    // item data
    if (obj.addressLine4 != obj.defaultAddressLine4)
    then str = xlsx_convert_special_chars(obj.addressLine4);
    else str = "";
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    
    file_text_write_string(file,'<c r="D' + string(thisRow) + '" t="s" s="4">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
    // end row
    file_text_write_string(file,'</row>');
    file_text_writeln(file);

    
    // Address Line 5
    thisRow++;
    file_text_write_string(file,'<row r="'+string(thisRow)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
    file_text_writeln(file);
    
    // item data
    if (obj.addressLine5 != obj.defaultAddressLine5)
    then str = xlsx_convert_special_chars(obj.addressLine5);
    else str = "";
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    
    file_text_write_string(file,'<c r="D' + string(thisRow) + '" t="s" s="4">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
    // end row
    file_text_write_string(file,'</row>');
    file_text_writeln(file);
    
    
    
    // Address Line 6
    thisRow++;
    file_text_write_string(file,'<row r="'+string(thisRow)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
    file_text_writeln(file);
    
    // item data
    if (obj.addressLine6 != obj.defaultAddressLine6)
    then str = xlsx_convert_special_chars(obj.addressLine6);
    else str = "";
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    
    file_text_write_string(file,'<c r="D' + string(thisRow) + '" t="s" s="4">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
    // end row
    file_text_write_string(file,'</row>');
    file_text_writeln(file);
    
    
    // Address Line 7
    thisRow++;
    file_text_write_string(file,'<row r="'+string(thisRow)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
    file_text_writeln(file);
    
    // item data
    if (obj.addressLine7 != obj.defaultAddressLine7)
    then str = xlsx_convert_special_chars(obj.addressLine7);
    else str = "";
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    
    file_text_write_string(file,'<c r="D' + string(thisRow) + '" t="s" s="4">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
    // end row
    file_text_write_string(file,'</row>');
    file_text_writeln(file);
    
    
    
    // Address Line 8
    /*
    thisRow++;
    file_text_write_string(file,'<row r="'+string(thisRow)+'" spans="1:7">');//outlineLevel="0" hidden="false" collapsed="false" customHeight="false" ht="17.35" customFormat="false">');  // get the row from the item  // get the row from the item
    file_text_writeln(file);
    
    // item data
    if (obj.addressLine8 != obj.defaultAddressLine8)
    then str = xlsx_convert_special_chars(obj.addressLine8);
    else str = "";
    
    sharedStringIndex = xlsx_write_sharedString(str);   // write the shared string and add to the sharedStringIndex
    
    file_text_write_string(file,'<c r="D' + string(thisRow) + '" t="s" s="4">')
    file_text_writeln(file);
    file_text_write_string(file,'<v>' +string(sharedStringIndex) +'</v>');
    file_text_writeln(file);
    file_text_write_string(file,'</c>');
    file_text_writeln(file);
    
    // end row
    file_text_write_string(file,'</row>');
    file_text_writeln(file);
    */
    
