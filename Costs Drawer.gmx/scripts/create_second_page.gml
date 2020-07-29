/// create_second_page();
/*
 * Called when starting a new bill from scratch.
 *
 * Instantiates a PAGE_NUMBER object and adds it to global.listOfItems
 * Creates a new page of 42 rows.
 * Instantiates a item_caseDetails object and adds it to the global.listOfItems
 * Instantiates a TOTALS object and adds it to global.listOfItems
 *
 * Uses the create_item() function.
*/

var pageNum = create_item(PAGE_NUMBER,43);  // create PAGE_NUMBER item
create_item(item_caseDetails,45);           // create item_caseDetails item
//create_item(BUTTON_CreateNewItem,46);
var tots    = create_item(TOTALS,     84);  // create TOTALS item

global.totalRows += global.rowsPerPage;     // add a page's worth of rows
