/// confirmDescription(string)
/* Event:
 *  Called when hitting the enter key/carriage return when editing an item's
 *   description field.
 * 
 * Description:
 *  Replaces the old description of an item with a new description.
 *  Sends description for formatting (separating each line into a list)
 *  calls updateLines() script
 *
 * Related to:
 *  getDescription()
 *  formatDescription()
 *  updateLines()
*/

// see fee later (note: this must be before updateLines)
if (hasOutlay == true)
or (hasProfessional == true)
{
    if  (outlay == 0 and professional == 0)
    {
        seeFeeLater = true;
    }
    else
    {
        if (myFee > -1)
        {
            instance_destroy(myFee,true);
        }
    }
}

description         = argument0;                                // working string
tempDescription     = convertCodesToNames(description);         // working string

oldDescription      = description;
shownDescription    = string(convertCodesToNames(description));
tempDescription     = "";

shownDescription    = removeTrailingSpaces(shownDescription);

if description      = "" then description = " ";
if shownDescription = "" then shownDescription = " ";
formatDescription(shownDescriptionList, shownDescription, 0);   // separate the string into a list of strings for displaying on rows
formatDescription(descriptionList, description, 0);


selectedField = "none";
popupWaiting  = false;                                          // allow popups again
updateLines(shownDescriptionList);



// set instructions fee item to mirror this item
if  ( exists(myFee) )
and (myFee.object_index == INSTRUCTIONS_FEE_ITEM)
{
    if (myFee.linked == true)
    {
        
        with(myFee)
        {
        //show_debug_message("myFee found! it's "+string(myFee));
        description = master.description;
        //myFee.description = description;
        //myFee.shownDescription = shownDescription;
        //myFee.lines = lines;
        confirmDescription(description);
        }
    }
}



editingDescription = false;

/*
if (object_index == PLAINTIFF)
or (object_index == DEFENDANT)
{
    while ( string_char_at(description,1) == " " )
    {
        string_delete(description,1,1);
    }
    while ( string_char_at(shownDescription,1) == " " )
    {
        string_delete(description,1,1);
    }
}
*/


set_unsaved();


if (object_index == PLAINTIFF)
or (object_index == DEFENDANT)
{
    with(PLAINTIFF)
    {
        event_user(0);
    }
    with(DEFENDANT)
    {
        event_user(0);
    }
}

startChar = -1;
endChar = -1;

//count_folios();

/// RUN DOC ORGANIZER FROM OUR POSITION
DOC_ORGANIZER.startFrom = id;
if (lines != previousLines) then DOC_ORGANIZER.alarm[0]  = 2;    // do not set lower, causes WITNESS FEES to not be positioned properly
