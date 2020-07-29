/// dates_decide_carried_and_shown()
index = ds_list_find_index(global.listOfItems,id);

showYear            = true;
showMonth           = true;
showDay             = false;

firstOnPage         = false;    // are we the first item on a page?

// dates changed?
yearChanged  = false;
monthChanged = false;
dayChanged   = false;

if ((dateYear > 0)  and (dateYear != previousYear))   then yearChanged   = true;
if ((dateMonth > 0) and (dateMonth != previousMonth)) then monthChanged  = true;
if ((dateDay > 0)   and (dateDay != previousDay))     then dayChanged    = true;

if (dateYear  == 0) then yearString  = previousYearString;
if (dateMonth == 0) then monthString = previousMonthString;
if (dateDay   == 0) then dayString   = previousDayString;




// Decide if dates should be carried over
if (hasYear)
{
   // if (dateYear == 0) then yearString = string(previousYear);
    
   // if (yearString == string(previousYear))
    if (yearChanged == false)
    {
        if (requiresYear)
         then showYear = true;
         else showYear = false;
    }
    else showYear = true;
}




if (hasMonth)
{
    //if (dateMonth == 0) then monthString = previousMonth;
    
    //if (dateMonth == previousMonth)
    if (monthChanged == false)
    {
        if (requiresMonth) then showMonth = true;
                           else showMonth = false;
    }
    else showMonth = true;
    
    if (yearChanged) // if the year changed, the month has too
     then showMonth  = true;
}



if (hasDay)
{
    //if (dateDay == 0) then dayString = previousDayString;
    
    //if (dateDay == previousDay)
    if (dayChanged == false)
    {
        if (requiresDay) then showDay = true;
                         else showDay = false;
    }
    else showDay = true;
    
    
    if (yearChanged) // if the year changed, the day has too
      then showDay  = true;
    
    if (monthChanged) // if the month changed, the day has too
      then showDay  = true;
    
    // we normally only have two lines
    if  (yearChanged  == true)
    and (monthChanged == true)
      then showDay = false;
    
    
    //if (showDay == true) then showMonth = true; // uncomment if we don't want dateDay to be shown without dateMonth
}





// Always show if we're the first on the page
var prevIndex = ds_list_find_value(global.listOfItems,index-1);

if !( is_undefined(prevIndex) )
{
    if ( instance_exists(prevIndex) )
    {
        if ( prevIndex.object_index == PAGE_NUMBER )
        {
            firstOnPage   = true;

            showYear        = true;
            showMonth       = true;
            showDay         = false;
            
            formatMonthString();
        }
    }
}

// force showing of required dates
if (requiresYear  == true) then showYear  = true;
if (requiresMonth == true) then showMonth = true;
if (requiresDay   == true) then showDay   = true;

if (countMyItemNumber == false)
{
    showYear  = false;
    showMonth = false;
    showDay   = false;
}
