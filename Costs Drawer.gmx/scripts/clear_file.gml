/// clear_file();
/* Deletes all instances in a room in preparation
 * for loading a new document.
*/
global.totalRows = 0;
global.itemID    = 0; // reset the "myID" counter

if instance_exists(TOTALS)          then with(TOTALS)       { instance_destroy(id,true); }
if instance_exists(PAGE_NUMBER)     then with(PAGE_NUMBER)  { instance_destroy(id,true); }
if instance_exists(USER_ITEM)       then with(USER_ITEM)    { instance_destroy(id,true); }
if instance_exists(ITEM)            then with(ITEM)         { instance_destroy(id,true); }
if instance_exists(CONSTANT_ITEM)   then with(CONSTANT_ITEM)   { instance_destroy(id,true); }


if instance_exists(firstPage_CourtInfo)     then instance_destroy(firstPage_CourtInfo,true);
if instance_exists(firstPage_record_number) then instance_destroy(firstPage_record_number,true);
if instance_exists(firstPage_Plaintiffs)    then instance_destroy(firstPage_Plaintiffs,true);
if instance_exists(firstPage_Defendants)    then instance_destroy(firstPage_Defendants,true);
if instance_exists(firstPage_Address)       then instance_destroy(firstPage_Address,true);
if instance_exists(firstPage_CostsType)     then instance_destroy(firstPage_CostsType,true);
if instance_exists(PLAINTIFF)               then with(PLAINTIFF)                {instance_destroy(id,true);}
if instance_exists(DEFENDANT)               then with(DEFENDANT)                {instance_destroy(id,true);}


if instance_exists(lastPage_VATNumbers)     then instance_destroy(lastPage_VATNumbers,true);
if instance_exists(lastPage_DatedSignature) then instance_destroy(lastPage_DatedSignature,true);
if instance_exists(lastPage_Address)        then instance_destroy(lastPage_Address,true);


if instance_exists(SCROLLBAR)               then with(SCROLLBAR)                { instance_destroy(id,true); }
if instance_exists(SCROLLBAR_H)             then with(SCROLLBAR_H)              { instance_destroy(id,true); }
if instance_exists(button_ScrollUp)         then with(button_ScrollUp)          { instance_destroy(id,true); }
if instance_exists(button_ScrollDown)       then with(button_ScrollDown)        { instance_destroy(id,true); }
if instance_exists(button_ScrollLeft)       then with(button_ScrollLeft)        { instance_destroy(id,true); }
if instance_exists(button_ScrollRight)      then with(button_ScrollRight)       { instance_destroy(id,true); }


if instance_exists(plaintiffs_SCROLLBAR)    then with(plaintiffs_SCROLLBAR)     { instance_destroy(id,true); }
if instance_exists(plaintiffs_SCROLLBAR_H)  then with(plaintiffs_SCROLLBAR_H)   { instance_destroy(id,true); }
if instance_exists(plaintiffs_ScrollUp)     then with(plaintiffs_ScrollUp)      { instance_destroy(id,true); }
if instance_exists(plaintiffs_ScrollDown)   then with(plaintiffs_ScrollDown)    { instance_destroy(id,true); }
if instance_exists(plaintiffs_ScrollLeft)   then with(plaintiffs_ScrollLeft)    { instance_destroy(id,true); }
if instance_exists(plaintiffs_ScrollRight)  then with(plaintiffs_ScrollRight)   { instance_destroy(id,true); }
if instance_exists(button_createPlaintiff)  then with(button_createPlaintiff)   { instance_destroy(id,true); }

if instance_exists(defendants_SCROLLBAR)    then with(defendants_SCROLLBAR)     { instance_destroy(id,true); }
if instance_exists(defendants_SCROLLBAR_H)  then with(defendants_SCROLLBAR_H)   { instance_destroy(id,true); }
if instance_exists(defendants_ScrollUp)     then with(defendants_ScrollUp)      { instance_destroy(id,true); }
if instance_exists(defendants_ScrollDown)   then with(defendants_ScrollDown)    { instance_destroy(id,true); }
if instance_exists(defendants_ScrollLeft)   then with(defendants_ScrollLeft)    { instance_destroy(id,true); }
if instance_exists(defendants_ScrollRight)  then with(defendants_ScrollRight)   { instance_destroy(id,true); }
if instance_exists(button_createDefendant)  then with(button_createDefendant)   { instance_destroy(id,true); }
/*
if instance_exists(counsel_SCROLLBAR)       then with(counsel_SCROLLBAR)        { instance_destroy(); }
if instance_exists(counsel_SCROLLBAR_H)     then with(counsel_SCROLLBAR_H)      { instance_destroy(); }
if instance_exists(counsel_ScrollUp)        then with(counsel_ScrollUp)         { instance_destroy(); }
if instance_exists(counsel_ScrollDown)      then with(counsel_ScrollDown)       { instance_destroy(); }
if instance_exists(counsel_ScrollLeft)      then with(counsel_ScrollLeft)       { instance_destroy(); }
if instance_exists(counsel_ScrollRight)     then with(counsel_ScrollRight)      { instance_destroy(); }
if instance_exists(button_createCounsel)    then with(button_createCounsel)     { instance_destroy(); }
*/
if instance_exists(witnesses_SCROLLBAR)     then with(witnesses_SCROLLBAR)      { instance_destroy(id,true); }
if instance_exists(witnesses_SCROLLBAR_H)   then with(witnesses_SCROLLBAR_H)    { instance_destroy(id,true); }
if instance_exists(witnesses_ScrollUp)      then with(witnesses_ScrollUp)       { instance_destroy(id,true); }
if instance_exists(witnesses_ScrollDown)    then with(witnesses_ScrollDown)     { instance_destroy(id,true); }
if instance_exists(witnesses_ScrollLeft)    then with(witnesses_ScrollLeft)     { instance_destroy(id,true); }
if instance_exists(witnesses_ScrollRight)   then with(witnesses_ScrollRight)    { instance_destroy(id,true); }
if instance_exists(button_createWitness)    then with(button_createWitness)     { instance_destroy(id,true); }

if instance_exists(items_SCROLLBAR)         then with(items_SCROLLBAR)          { instance_destroy(id,true); }
if instance_exists(items_SCROLLBAR_H)       then with(items_SCROLLBAR_H)        { instance_destroy(id,true); }
if instance_exists(items_ScrollUp)          then with(items_ScrollUp)           { instance_destroy(id,true); }
if instance_exists(items_ScrollDown)        then with(items_ScrollDown)         { instance_destroy(id,true); }
if instance_exists(items_ScrollLeft)        then with(items_ScrollLeft)         { instance_destroy(id,true); }
if instance_exists(items_ScrollRight)       then with(items_ScrollRight)        { instance_destroy(id,true); }

if instance_exists(warnings_SCROLLBAR)      then with(warnings_SCROLLBAR)       { instance_destroy(id,true); }
if instance_exists(warnings_SCROLLBAR_H)    then with(warnings_SCROLLBAR_H)     { instance_destroy(id,true); }
if instance_exists(warnings_ScrollUp)       then with(warnings_ScrollUp)        { instance_destroy(id,true); }
if instance_exists(warnings_ScrollDown)     then with(warnings_ScrollDown)      { instance_destroy(id,true); }
if instance_exists(warnings_ScrollLeft)     then with(warnings_ScrollLeft)      { instance_destroy(id,true); }
if instance_exists(warnings_ScrollRight)    then with(warnings_ScrollRight)     { instance_destroy(id,true); }

if instance_exists(BUTTON_CreateNewItem)    then with(BUTTON_CreateNewItem)     { instance_destroy(id,true); }
if instance_exists(keyboard_CURSOR)         then with(keyboard_CURSOR)          { instance_destroy(id,true); }


if instance_exists(GENERAL_INSTRUCTIONS_FEE)    then with(GENERAL_INSTRUCTIONS_FEE)     { instance_destroy(id,true); }
if instance_exists(INSTRUCTIONS_FEE_ITEM)       then with(INSTRUCTIONS_FEE_ITEM)        { instance_destroy(id,true); }
if instance_exists(GENERAL_INSTRUCTIONS_DETAILS)then with(GENERAL_INSTRUCTIONS_DETAILS) { instance_destroy(id,true); }
if instance_exists(INSTRUCTIONS_FEE_TOTAL)      then with(INSTRUCTIONS_FEE_TOTAL)       { instance_destroy(id,true); }
if instance_exists(lastPage_postageAndSundries) then with(lastPage_postageAndSundries)  { instance_destroy(id,true); }
if instance_exists(lastPage_drawingCostsAndCopy)then with(lastPage_drawingCostsAndCopy) { instance_destroy(id,true); }
if instance_exists(lastPage_summonsToTax)       then with(lastPage_summonsToTax)        { instance_destroy(id,true); }
if instance_exists(lastPage_stampThereon)       then with(lastPage_stampThereon)        { instance_destroy(id,true); }
if instance_exists(lastPage_attendingTaxation)  then with(lastPage_attendingTaxation)   { instance_destroy(id,true); }
if instance_exists(lastPage_injuriesBoardFee)   then with(lastPage_injuriesBoardFee)    { instance_destroy(id,true); }
if instance_exists(lastPage_WITNESSES)          then with(lastPage_WITNESSES)           { instance_destroy(id,true); }
if instance_exists(WITNESS)                     then with(WITNESS)                      { instance_destroy(id,true); }
if instance_exists(WITNESS_FEE)                 then with(WITNESS_FEE)                  { instance_destroy(id,true); }
if instance_exists(lastPage_SUBTOTAL)           then with(lastPage_SUBTOTAL)            { instance_destroy(id,true); }
if instance_exists(lastPage_ProVAT)             then with(lastPage_ProVAT)              { instance_destroy(id,true); }
if instance_exists(lastPage_OutlayToTotal)      then with(lastPage_OutlayToTotal)       { instance_destroy(id,true); }
if instance_exists(lastPage_TOTAL)              then with(lastPage_TOTAL)               { instance_destroy(id,true); }
if instance_exists(lastPage_DatedSignature)     then with(lastPage_DatedSignature)      { instance_destroy(id,true); }
if instance_exists(lastPage_Address)            then with(lastPage_Address)             { instance_destroy(id,true); }
if instance_exists(lastPage_VATNumbers)         then with(lastPage_VATNumbers)          { instance_destroy(id,true); }

if instance_exists(WARNINGS_MASTER)             then with(WARNINGS_MASTER)              { instance_destroy(id,true); }
if instance_exists(ITEM_NUMBERS_DRAWER)         then with(ITEM_NUMBERS_DRAWER)          { instance_destroy(id,true); }
if instance_exists(COMMON_ITEMS_CHECKER)        then with(COMMON_ITEMS_CHECKER)         { instance_destroy(id,true); }
if instance_exists(POPUP)                       then with(POPUP)                        { instance_destroy(id,true); }
if instance_exists(TOOLTIPS)                    then with(TOOLTIPS)                     { instance_destroy(id,true); }
if instance_exists(DOC_ORGANIZER)               then with(DOC_ORGANIZER)                { instance_destroy(id,true); }
//if instance_exists(MASTER)               then with(MASTER)                { instance_destroy(id,true); }

//if instance_exists(PROGRESS_BAR)                then with(PROGRESS_BAR)                 { instance_destroy(id,true); }
 
global.recordNumber = "";

global.warningsScroll   = 0;
global.itemsScroll      = 0;
global.witnessesScroll  = 0;
global.plaintiffsScroll = 0;
global.defendantsScroll = 0;

global.startWitnessesOnNewPage = false;
ds_list_clear(global.listOfItems);
ds_list_clear(global.LAST_PAGE_ITEMS);
ds_list_clear(global.WARNINGS);
ds_list_clear(global.CAUTIONS);
ds_list_clear(global.DEFENDANTS);
ds_list_clear(global.PLAINTIFFS);
//ds_list_clear(global.COUNSEL);
ds_list_clear(global.WITNESSES);

global.SENIOR_COUNSEL = "";
global.JUNIOR_COUNSEL = "";
update_counsel_shownName(global.SENIOR_COUNSEL);
update_counsel_shownName(global.JUNIOR_COUNSEL);

global.SAVED_AS         = false;

with (MASTER)
{
    write_preferences();
}
//show_message("FILE CLEARED");
