// SETUP FIRST PAGE
show_debug_message("running create_first_page()");

if !ds_exists(global.listOfItems,ds_type_list)
 then global.listOfItems = ds_list_create();

global.totalRows += global.rowsPerPage;
var yy = getYFromRow(1);
var xx = 0;

if !instance_exists(firstPage_CourtInfo){
    var courtInfo = instance_create(xx,yy,firstPage_CourtInfo);         // create the new court info object
    courtInfo.row = 2;                                                  // court info object starts on row 2
    ds_list_add(global.listOfItems,courtInfo);                          // add this object to the global.listOfItems
}

if !instance_exists(firstPage_record_number){
    var recordNumber = instance_create(xx,yy,firstPage_record_number);  // create the new court record number object
    recordNumber.row = 4;                                               // record number goes on row 5
    ds_list_add(global.listOfItems,recordNumber);                       // add this object to the global.listOfItems
}


// REGION LINES (docVer 2.1+)
if !instance_exists(firstPage_regionInfo_line1_docVer21){
    var regionInfoLine1 = instance_create(xx,yy,firstPage_regionInfo_line1_docVer21);
    regionInfoLine1.row = 5;                                               // goes on row 5
    ds_list_add(global.listOfItems,regionInfoLine1);                       // add this object to the global.listOfItems
}

if !instance_exists(firstPage_regionInfo_line2_docVer21){
    var regionInfoLine2 = instance_create(xx,yy,firstPage_regionInfo_line2_docVer21);
    regionInfoLine2.row = 6;                                               // goes on row 6
    ds_list_add(global.listOfItems,regionInfoLine2);                       // add this object to the global.listOfItems
}

if !instance_exists(firstPage_regionInfo_line3_docVer21){
    var regionInfoLine3 = instance_create(xx,yy,firstPage_regionInfo_line3_docVer21);
    regionInfoLine3.row = 7;                                               // goes on row 7
    ds_list_add(global.listOfItems,regionInfoLine3);                       // add this object to the global.listOfItems
}




if !instance_exists(firstPage_Plaintiffs){    
    var plaintffInfo = instance_create(xx,yy,firstPage_Plaintiffs);     // create the new plaintiffs object
    plaintffInfo.row = 10;                                              // plaintiff goes on row 10
    ds_list_add(global.listOfItems,plaintffInfo);                       // add this object to the global.listOfItems
}

if !instance_exists(firstPage_Defendants){
    var defendantInfo = instance_create(xx,yy,firstPage_Defendants);    // create the defendants object
    defendantInfo.row = 15;                                             // defendant row depends on number of plaintiffs (default row 15)
    ds_list_add(global.listOfItems,defendantInfo);                      // add this object to the global.listOfItems
}

if !instance_exists(firstPage_Address){
    var address = instance_create(xx,yy,firstPage_Address);             // create the new address object
    address.row = 41;                                                   // address row depends on address size
    ds_list_add(global.listOfItems,address);                            // add this object to the global.listOfItems
}

if !instance_exists(firstPage_CostsType){
    var costsType = instance_create(xx,yy,firstPage_CostsType);         // create the new costsType object
    costsType.row = 38;                                                 // address row depends on stuff
    ds_list_add(global.listOfItems,costsType);                          // add this object to the global.listOfItems
}

global.selected = -1;
