/// confirmProfessional(amount);
/* argument0 = professional amount
*/

window_set_cursor(cr_hourglass);

// convert to a real number
var realProfessional = string_replace_all(argument0,",",""); // remove digit grouping commas
realProfessional = real(realProfessional);                      // professional is a real number
                
oldProfessional             = professional; // oldProfessional = the previous professional value
professional                = realProfessional;    // professional = the new professional value
tempProfessional            = 0;            // clear tempProfessional

if  (professionalText = NOQUANTUM)
and (outlay > 0)
  then professionalText = "";

if  (professional > 0)
and (outlayText = NOQUANTUM)
  then outlayText = "";


selectedField               = "none";


//global.selected             = -1;
//TOTALS.alarm[0]             = 1;            // DO NOT REMOVE AS IT WILL CRASH!
//update_totals(id);
popupWaiting                = false;        // allow popups again


if (object_index == USER_ITEM)
{
    confirmDescription(description);            // for "See Fee Later"
}

if (professional != oldProfessional) then update_totals();


window_set_cursor(cr_default);
