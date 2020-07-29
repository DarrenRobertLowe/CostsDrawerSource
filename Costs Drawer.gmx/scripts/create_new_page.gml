/// create_new_page();
/*
 * Called when passing a page threshold of 42 lines.
 *
 * Instantiates a PAGE_NUMBER object and adds it to global.listOfItems
 * Creates a new page of 42 rows.
 * Instantiates a TOTALS object and adds it to global.listOfItems
 *
 * Uses the create_item() function.
*/

// Find the last item's row
var myPage  = get_last_page();
var myRow   = (myPage * global.rowsPerPage);

global.totalRows += global.rowsPerPage;             // add a page's worth of rows
var pageNum = create_item(PAGE_NUMBER,myRow+1 );    // create PAGE_NUMBER item
var tots    = create_item(TOTALS,     myRow+42);    // create TOTALS item

//show_message("created a new page!")
