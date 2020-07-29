/// get_previous_dates();
var index = ds_list_find_index(global.listOfItems,id);
previousYear        = 0; // used to draw the ghost year when no year has been input
previousMonth       = 0; // used to draw the ghost month
previousDay         = 0; // used to draw the ghost day

    
// year
for(i=index; i>0; i--)
{
    prevItem = ds_list_find_value(global.listOfItems,i-1)

    if  (instance_exists(prevItem))
    and (prevItem.hasDate == true)
    and (prevItem.dateYear > 0)
    {
        previousYear = prevItem.dateYear;
        i = 0; // end the loop
    }
    else 
    {
        previousYear = 0;
    }
}


// month
for(i=index; i>0; i--)
{
    prevItem = ds_list_find_value(global.listOfItems,i-1)

    if  (instance_exists(prevItem))
    and (prevItem.hasDate == true)
    and (prevItem.dateMonth > 0)
    {
        previousMonth = prevItem.dateMonth;
        i = 0; // end the loop
    }
    else 
    {
        previousMonth = 0;
    }
}


// day
for(i=index; i>0; i--)
{
    prevItem = ds_list_find_value(global.listOfItems,i-1)
    
    if  (instance_exists(prevItem))
    and (prevItem.hasDate == true)
    and (prevItem.dateDay > 0)
    {
        previousDay = prevItem.dateDay;
        i = 0; // end the loop
    }
    else 
    {
        previousDay = 0;
    }
}
