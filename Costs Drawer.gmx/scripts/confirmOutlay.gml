/// confirmOutlay(outlayText);
/* argument0 = new outlay
*/

window_set_cursor(cr_hourglass);

// convert to a real number
var realOutlay = string_replace_all(argument0,",","");              // remove digit grouping commas
realOutlay = real(realOutlay);                                      // outlay is a real number

oldOutlay               = outlay;           // oldOutlay = the previous outlay
outlay                  = realOutlay;       // outlay = the new outlay
tempOutlay              = 0;                // clear tempOutlay

if  (outlayText = NOQUANTUM)
and (professional > 0)
  then outlayText = "";

if  (outlay > 0)
and (professionalText == NOQUANTUM)
  then professionalText = "";


selectedField           = "none";


//TOTALS.alarm[0]         = 1;                // DO NOT REMOVE AS IT WILL CRASH!
//update_totals(id);

popupWaiting            = false;            // allow popups again


if (object_index == USER_ITEM)
{
    confirmDescription(description);            // for "See Fee Later"
}

if (outlay != oldOutlay) then update_totals();



window_set_cursor(cr_default);
