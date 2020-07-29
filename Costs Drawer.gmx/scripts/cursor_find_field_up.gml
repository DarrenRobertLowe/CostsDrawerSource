/// cursor_find_field_up();

var selected = global.selected;

// row
if (field == 0)
{
    field = 0;
}

// year - if we pressed up on year, don't go to Year on previous selected, try Day or Month first
if (field == 1)
{
    if (selected.hasDay == true) // day
    {
        field = 3;
    }
    else if (selected.hasMonth == true) // month
    {
        field = 2;
    }
    else // year
    {
        field = 1; 
    }
}


// item Number
if  (field == 4)
and (selected.canToggleItemNumber == false)
{
    field = 0;
}


// Description
if (field == 5)
and (selected.hasDescription == false)
{
    field = 0;
}


// Outlay
if (field == 6)
and (selected.hasOutlay == false)
{
    field = 0;
}

// Professional
if (field == 7)
and (selected.hasProfessional == false)
{
    field = 0;
}

if ( selected.object_index == BUTTON_CreateNewItem )
{
    field = 5;
}
