/// datesDecideShowCode
/* This code was moved to clean up the USER_ITEM draw event
 * and should never be called by any other object.
*/

/*
if  (dateDay != previousDay)
and (dateDay > 0)
{
    showDay = true;
}
if  (dateMonth != previousMonth)
and (dateMonth > 0)
{
    showMonth = true;
}
if  (dateYear != previousYear)
and (dateYear > 0)
{
    showYear  = true;
    showMonth = true;
}



if (dateYear  == 0) then yearCarried = true;    //showYear = false;
if (dateMonth == 0) then monthCarried = true;   //showMonth = false;
if (dateDay   == 0) then dayCarried = true;     //showDay = false;
*/


// Always show if we're the first on the page
/*
var prevIndex = ds_list_find_value(global.listOfItems,index-1);

if !is_undefined(prevIndex)
{
    if instance_exists(prevIndex)
    {
        if (prevIndex.object_index == PAGE_NUMBER)
        {
            firstOnPage     = true;
            showYear        = true;
            //yearCarried     = false;
            
            showMonth       = true;
            //monthCarried    = false;
            
            formatMonthString();
        }
    }
}
*/
