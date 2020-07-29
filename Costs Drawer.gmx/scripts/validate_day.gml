/// validateDay();
var day        = string(dateDay);
var dayDigits  = string_digits(day);


// Null case
if (dateDay == 0)
or (dateMonth == 0)
{
    // success
    return true;
    exit;
}



// 31 days
if (dateMonth == 1)
or (dateMonth == 3)
or (dateMonth == 5)
or (dateMonth == 7)
or (dateMonth == 8)
or (dateMonth == 10)
or (dateMonth == 12)
{
    if (dateDay > -1) and (dateDay < 32)
    {
        return true
        exit;
    }
    else {
        // ERROR!
        return false;
        exit;
    }
}


// 30 days
if (dateMonth == 4)
or (dateMonth == 6)
or (dateMonth == 9)
or (dateMonth == 11)
{
    if (dateDay > -1) and (dateDay < 31)
    {
        return true
        exit;
    }
    else {
        // ERROR!
        if (dateMonth ==  4) then errorString += "April has only 30 days!";
        if (dateMonth ==  6) then errorString += "June has only 30 days!";
        if (dateMonth ==  9) then errorString += "September has only 30 days!";
        if (dateMonth == 11) then errorString += "November has only 30 days!";
        return false;
        exit;
    }
}


// February
var dayMax;
if isLeapYear(dateYear) then dayMax = 29;
else dayMax = 28;

// 29 days
if (dateMonth == 2)
{
    if (dateDay > -1) and (dateDay < (dayMax+1))
    {
        return true;
        exit;
    }
    else if (dateDay == 29)
    {
        // ERROR!
        errorString = "February has only 28 days in " +string(dateYear);
                                    
        return false;
        exit;
    }
    else {
        // ERROR!
        return false;
        exit;
    }
}
