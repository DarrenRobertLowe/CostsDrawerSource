//item_unmoveable(item);
var item    = argument0;
var outcome = false;

if (item.object_index == firstPage_CourtInfo) 
or (item.object_index == firstPage_record_number)
or (item.object_index == firstPage_Plaintiffs) 
or (item.object_index == firstPage_Defendants) 
or (item.object_index == firstPage_CostsType)
or (item.object_index == firstPage_Address)
or (item.object_index == PLAINTIFF)
or (item.object_index == DEFENDANT)
or (item.object_index == item_caseDetails) 
or (item.object_index == TOTALS) 
or (item.object_index == PAGE_NUMBER)
then outcome = true;

return outcome;
