/// updateLines(descriptionList)
/*
 * Used to update the Lines variable of an ITEM object.
 * The Lines variable is the number of lines the Description
 * takes up.
 *
 * If you do this any other way remember the extra 2 spaces
 * at the beginning of each line add up! (i.e. at line 10 things get messy)
*/

lines = ( ds_list_size(argument0) );
lines++; // for the space between each item



// seeFeeLater check
if (instructionsFee == true)                then seeFeeLater = true;
    else seeFeeLater = false;

if (outlay > 0)                             then seeFeeLater = false;
if (professional > 0)                       then seeFeeLater = false;
if (outlayText == string(NOQUANTUM))        then seeFeeLater = false;
if (professionalText == string(NOQUANTUM))  then seeFeeLater = false;

if (forceSeeFeeLater == true)               then seeFeeLater = true;


// add line for see fee later
if (seeFeeLater == true)
{
    lines ++;
}

if (object_index == WITNESS_FEE)
{
    lines--;
}




// set the minimum lines
if (lines < 1) then lines = 1;
if (object_index != WITNESS_FEE) then lines = max(lines,2);


// override lines
if (object_index == lastPage_postageAndSundries)    then lines = 1;
if (object_index == lastPage_drawingCostsAndCopy)   then lines = 2;
if (object_index == lastPage_summonsToTax)          then lines = 1;
if (object_index == lastPage_stampThereon)          then lines = 1;
if (object_index == lastPage_attendingTaxation)     then lines = 1;
if (object_index == lastPage_injuriesBoardFee)      then lines = 1;
if (object_index == item_WHITESPACE)                then lines = 1;
