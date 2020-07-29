/// tooltipsCheck();
if !(mouseOverDocument()) then exit;

    if mouseOverBin()
    and (canDelete == true)
    {
        tooltip("Delete item");
    }

    /// YEAR
    if  ( mouseOverYear() )
    and ( hasYear == true )
    //and global.popup == id 
    {
        tooltip("Year");
    }

    /// MONTH
    if  ( mouseOverMonth() )
    and ( hasMonth == true )
    {
        tooltip("Month");
    }
    
    /// DAY
    if  ( mouseOverDay() )
    and ( hasDay == true )
    and ( object_index != USER_ITEM )                       // USER_ITEMs don't have a day
    and ( object_index != PAGE_NUMBER )                     // PAGE_NUMBERS don't have a date
    and ( object_index != TOTALS )                          // TOTALS don't have a date
    {   //and global.popup == id {
        tooltip("Day");
    }
    
    
    /// TOGGLE ITEM COUNT
    if  ( mouseOverItemNo() )
    and ( canToggleItemNumber == true )
    {
        tooltip("Toggle Item Number");
    }

    // DESCRITPION
    if  ( mouseOverDescription() )
    and ( hasDescription )
    {
        tooltip("Description");
    }
    
    
    if  mouseOverOutlay()
    and (hasOutlay)
    {
        tooltip("Outlay");
    }
    
    
    if  ( mouseOverProfessional() )
    and ( hasProfessional )
    {
        tooltip("Professional");
    }
