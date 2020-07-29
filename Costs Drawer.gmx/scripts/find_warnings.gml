/// find_warnings()
ds_list_clear(global.WARNINGS);

//show_debug_message("find_warnings is running " +string(get_timer()));

/// STATIC ITEMS
if (global.recordNumber = "")    then add_warning("A Record Number is required!",firstPage_record_number.row);
if (global.JUNIOR_COUNSEL == "") then add_warning("Junior Counsel name required",0);
if (global.BILL_COURT == "Highcourt") // circuit court doesn't normally have a senior counsel
{
    if (global.SENIOR_COUNSEL == "") then add_warning("Senior Counsel name required",0);
}


with (PLAINTIFF)
{
    if (description == "" or description == " ")
    {
        add_warning("Plaintiff name missing.", row + showingAndText);
    }
}

with (DEFENDANT)
{
    if (description == "" or description == " ")
    {
        add_warning("Defendant name missing.", row + showingAndText);
    }
}




with (item_attendingCounsel)
{
    var index    = ds_list_find_index(global.listOfItems,id);
    var nextItem = ds_list_find_value(global.listOfItems,index+1);
    if exists(nextItem)
    {
        if !(object_is_ancestor(nextItem.object_index, COUNSEL_FEE_PARENT))
        {
            add_warning("This item should be followed by a counsel fee", row);
        }
    }
}

with (item_CC_attendingCounsel)
{
    var index    = ds_list_find_index(global.listOfItems,id);
    var nextItem = ds_list_find_value(global.listOfItems,index+1);
    if exists(nextItem)
    {
        if !(object_is_ancestor(nextItem.object_index, COUNSEL_FEE_PARENT))
        {
            add_warning("This item should be followed by a counsel fee", row);
        }
    }
}

with (item_CC_attendingLawLibraryForNegotiations)
{
    var index    = ds_list_find_index(global.listOfItems,id);
    var nextItem = ds_list_find_value(global.listOfItems,index+1);
    if exists(nextItem)
    {
        if !(object_is_ancestor(nextItem.object_index, COUNSEL_FEE_PARENT))
        {
            add_warning("This item should be followed by a counsel fee", row);
        }
    }
}


if instance_exists(lastPage_VATNumbers)
{
    if (lastPage_VATNumbers.solicitorVATNo == "") then add_warning("Solicitor's VAT Number Required!",lastPage_VATNumbers.row);
    if (global.BILL_COURT == "Highcourt")
    {
        if (lastPage_VATNumbers.seniorVATNo == "")    then add_warning("Senior Counsel's VAT Number Required!",lastPage_VATNumbers.row+2);
    }
    if (lastPage_VATNumbers.juniorVATNo == "")    then add_warning("Junior Counsel's VAT Number Required!",lastPage_VATNumbers.row+3);
}

if ( instance_exists(item_caseDetails) )
{
    with (item_caseDetails)
    {
        if (real(dateYear) == 0)    then add_warning("This item requires a year", row);
        if (real(dateYear) == 1900) then add_warning("This item requires a year", row);
        if validate_year(dateYear) == false then add_warning("invalid year", row);
        
        if (real(dateMonth) == 0) then add_warning("This item requires a month", row+1);
        if validate_month(dateMonth) == false then add_warning("invalid month", row+1);
    }
}

/*if ( instance_exists(lastPage_TOTAL) )
{
    with (lastPage_TOTAL)
    {
        if ( (global.BILL_COURT == "Circuit") and (real(professionalText) > 25000) ) then add_warning("WARNING! This amount exceeds the €25000 limit for Circuit Court jurisdiction!", row);
    }
}
*/

/// REGULAR ITEMS
with (ITEM)
{
    if  (object_index != BUTTON_CreateNewItem)  
    and (object_index != PAGE_NUMBER)
    and (object_index != TOTALS)
    and (object_index != PLAINTIFF)
    and (object_index != DEFENDANT)
    {
        // dates
        find_warnings_dates();
        
        // description
        if  (hasDescription)
        and (descriptionRequired)
        {
            if  (description == "") and (shownDescription == "")
            or  (description == " ") and (shownDescription == " ")
            {
                add_warning("A description is required", row);
            }
        }
        // quantum
        var qRow = (row + ds_list_size(shownDescriptionList))-1;
        if (qRow < row) then qRow = row;
        
        
        if (outlay > 0) and (professional > 0) then add_warning("An item cannot have both Outlay and Professional quantum.", qRow);
        
        
        if (outlayRequired)
        {
            if (outlay == 0) or (outlayText == NOQUANTUM)
            {
                add_warning("Outlay required for this item", qRow);
            }
        }
        
        if (professionalRequired)
        {
            if (professional == 0) or (professionalText == NOQUANTUM)
            {
                add_warning("Professional required for this item", qRow); 
            }
        }
        
        
        //if (object_index == lastPage_drawingCostsAndCopy)
        //{
            //if (folios < 1) then add_warning("Please enter number of folios",row+1)
        //}
        
        
        if (object_index == item_attendingCounselToSettle)
        {
            var index    = ds_list_find_index(global.listOfItems,id);
            var nextItem = ds_list_find_value(global.listOfItems,index+1);
            if exists(nextItem)
            {
                if !(object_is_ancestor(nextItem.object_index, COUNSEL_FEE_PARENT))
                {
                    add_warning("This item should be followed by a counsel fee!", row);
                }
            }
        }
        
        
        /*if (outlayRequired == true) and (outlay == 0)
        then add_warning("This item requires Outlay", row);
        
        if (professionalRequired == true) and (outlay == 0)
        then add_warning("This item requires Professional", row);*/
    }
}


/// WARN OF GAP AT BOTTOM OF PAGE
/*
var list = global.listOfItems;
var size = ds_list_size(list);

for(var i=0; i<size; i++)
{
    var item = ds_list_find_value(list,i);
    
    if (item.object_index == TOTALS)
    {
        // make sure we're before the general instructions fee
        var endRow = GENERAL_INSTRUCTIONS_FEE.row;
        if (item.row < endRow)
        {
            prevItem = ds_list_find_value(list,i-1);
            
            var theRow = prevItem.row;
            if (theRow < (item.row-7)) // 7 lines warning
            {
                add_warning(GAP_WARNING, theRow);
            }
        }
    }
}
*/



/// sort the list
if (global.sortWarningsAndCautions)
 then sort_warnings(global.WARNINGS);
 
 
with (MASTER)
{ 
    set_relative_positions();
}
