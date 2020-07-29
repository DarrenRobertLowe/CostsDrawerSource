/// find_warnings_dates();
// dates required
    if (dateRequired == true)
    {
        if  (dateYear == 0)
        and (dateMonth == 0)
        and (dateDay == 0)
        {
            add_warning("A date is required for this item", row);
        }
    }
    /*
    if (requiresYear == true)
    {
        if (dateYear == 0)
         then add_warning("A valid year is required for this item", row);
    }
    
    if  (requiresMonth == true)
    {
        if (dateMonth == 0)
         then add_warning("A valid month is required for this item", row);
    }
    
    if  (requiresDay == true)
    {
        if (dateDay == 0)
         then add_warning("A valid day is required for this item", row);
    }
    */
    
    if  (hasYear == true)
    and (validate_year() == false)
      then add_warning("invalid year", row);
    
    if  (hasMonth == true)
    and (validate_month() == false)
      then add_warning("invalid month", row+1);
    
    if  (hasDay == true)
    and (validate_day() == false)
      then add_warning("invalid day", row+2);
    

    if  (dateYear > 0)
    and (dateYear < previousYear)
    {
        add_warning("Year cannot be lower than previous year!", row);
    }
    
    
    if (dateYear == 0)
    or (dateYear == previousYear)
    {
        if  (dateMonth > 0)
        and (dateMonth < previousMonth)
          then add_warning("Month cannot be lower than previous month!", row);
    }
    
    
    if (dateYear == previousYear)
    or (dateYear == 0)
    {
        if (dateMonth == previousMonth)
        or (dateMonth == 0)
        {
            if  (dateDay > 0)
            and (dateDay < previousDay)
            then add_warning("Day cannot be lower than previous day!", row);
        }
    }
