/// update_totals()
/* Updates the totals in the correct order.
 * 
 * NOTE: I think all TOTALS are actually on the global.listOfItems,
 * so we probably don't actually need to combine these lists.
 * This script should only be run every now and then though, so
 * it's probably alright to leave it as is.
*/

/*
list1 = ds_list_create();
list2 = ds_list_create();
ds_list_copy(list1,global.listOfItems);
ds_list_copy(list2,global.LAST_PAGE_ITEMS);

combine_lists(list1,list2);
var size = ds_list_size(list1);
*/
show_debug_message(string(get_timer()/1000) + "**** UPDATING TOTALS ****");


// OPTIMIZATION
/*var page        = 0;
var startRow    = 0;
var pagenumber  = -1;
var startFrom   = argument0;

if (startFrom > 0)
{
    page        = floor(startFrom.row / global.rowsPerPage);
    startRow    = (pagenumber * global.rowsPerPage);
    pagenumber  = -1;
}
*/


// SETUP
var list1 = ds_list_create();
ds_list_copy(list1,global.listOfItems);
var size = ds_list_size(list1);

// OPTIMIZATION : find the relevant PAGE_NUMBER item to start from
/*
for(var i=0; i<size; i++)
{
    var pn = ds_list_find_value(list1,i);
    if (pn.object_index == PAGE_NUMBER)
    {
        if (pn.row == startRow)
        {
            pagenumber = pn;    // that's out PAGE_NUMBER item
            startFrom = i;      // we'll calculate totals from that index
            i = size;           // end the loop
        }
    }
}
*/

// DO THE THING
for(var i=0; i<size; i++)
{
    var it = ds_list_find_value(list1,i);
    if (it.object_index == TOTALS)
    {
        //update_progress_bar(.75 + i*(.25/size));
        // setup vars so we don't start from 0
        /*
        if (pagenumber > -1)
        {
            it.passedOutlay         = pagenumber.totalOutlay;
            it.passedProfessional   = pagenumber.totalProfessional;
        }
        it.startFrom = startFrom;
        show_debug_message("Passing it startFrom of " +string(startFrom));
        */
        // calc the totals
        with(it)
        {
            event_user(0);
        }
    }
}

with(lastPage_SUBTOTAL){event_user(0);}


/// CLEAN UP
if ds_exists(list1,ds_type_list) then ds_list_destroy(list1);
//if ds_exists(list2,ds_type_list) then ds_list_destroy(list2);

show_debug_message(string(get_timer()/1000) + "**** FINISHED UPDATING TOTALS ****");

//update_progress_bar(-1);
