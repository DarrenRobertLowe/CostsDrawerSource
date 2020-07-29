/// previous_tip()
var list    = global.tipsList;
var lastTip = (ds_list_size(list)-1);

global.currentTip++;

// loop the tips
if ( global.currentTip > lastTip)  then global.currentTip = 0;
if ( global.currentTip < 0 )       then global.currentTip = lastTip;
