/// create_last_page()
var pageNum = create_item(PAGE_NUMBER,85);      // create PAGE_NUMBER item

if (global.startWitnessesOnNewPage == true) then create_item(PAGE_NUMBER,127); // otherwise we're missing a page number on the last page.

var tots    = create_item(TOTALS,     126);     // create TOTALS item

if (global.BILL_COURT == "Highcourt")
{
    if !instance_exists(GENERAL_INSTRUCTIONS_FEE)       then instance_create(0,0,GENERAL_INSTRUCTIONS_FEE);
    if !instance_exists(lastPage_postageAndSundries)    then instance_create(0,0,lastPage_postageAndSundries);
    if !instance_exists(lastPage_drawingCostsAndCopy)   then instance_create(0,0,lastPage_drawingCostsAndCopy);
    if !instance_exists(lastPage_summonsToTax)          then instance_create(0,0,lastPage_summonsToTax);
    if !instance_exists(lastPage_attendingTaxation)     then instance_create(0,0,lastPage_attendingTaxation);
    if !instance_exists(lastPage_injuriesBoardFee)      then instance_create(0,0,lastPage_injuriesBoardFee);
}


else //circuit court
{
    if !instance_exists(GENERAL_INSTRUCTIONS_FEE)       then instance_create(0,0,GENERAL_INSTRUCTIONS_FEE);
    if !instance_exists(lastPage_postageAndSundries)    then instance_create(0,0,lastPage_postageAndSundries);
    if !instance_exists(lastPage_drawingCostsAndCopy)   then instance_create(0,0,lastPage_drawingCostsAndCopy);
    if !instance_exists(lastPage_CC_summonsToTax)       then instance_create(0,0,lastPage_CC_summonsToTax);
    if !instance_exists(lastPage_CC_attendingTaxation)  then instance_create(0,0,lastPage_CC_attendingTaxation);
    if !instance_exists(lastPage_CC_stampOnCertificate) then instance_create(0,0,lastPage_CC_stampOnCertificate);
}


if !instance_exists(lastPage_WITNESSES)             then instance_create(0,0,lastPage_WITNESSES);
if !instance_exists(lastPage_SUBTOTAL)              then instance_create(0,0,lastPage_SUBTOTAL);
if !instance_exists(lastPage_ProVAT)                then instance_create(0,0,lastPage_ProVAT);
if !instance_exists(lastPage_OutlayToTotal)         then instance_create(0,0,lastPage_OutlayToTotal);
if !instance_exists(lastPage_TOTAL)                 then instance_create(0,0,lastPage_TOTAL);
if !instance_exists(lastPage_DatedSignature)        then instance_create(0,0,lastPage_DatedSignature);
if !instance_exists(lastPage_Address)               then instance_create(0,0,lastPage_Address);


if (global.BILL_COURT == "Circuit")
{
    if !instance_exists(lastPage_VATNotRecoverable) then instance_create(0,0,lastPage_VATNotRecoverable);    
}

if !instance_exists(lastPage_VATNumbers)            then instance_create(0,0,lastPage_VATNumbers);

global.totalRows += global.rowsPerPage;         // add a page's worth of rows
