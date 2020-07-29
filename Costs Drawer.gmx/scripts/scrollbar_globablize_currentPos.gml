/// scrollbar_globalize_currentPos();
if (object_index == plaintiffs_SCROLLBAR)
{
    global.currentPlaintiffNumber  = currentPos;
    plaintiffs_SCROLLBAR.alarm[0] = 1;
}


if (object_index == defendants_SCROLLBAR)
{
    global.currentDefendantNumber  = currentPos;
    defendants_SCROLLBAR.alarm[0] = 1;
}


if (object_index == witnesses_SCROLLBAR)
{
    global.currentWitnessNumber    = currentPos;
    witnesses_SCROLLBAR.alarm[0] = 1;
}


if (object_index == items_SCROLLBAR)
{
    global.currentItemNumber       = currentPos;
    items_SCROLLBAR.alarm[0] = 1;
}


if (object_index == warnings_SCROLLBAR) 
{
    global.currentWarningNumber    = currentPos;
    warnings_SCROLLBAR.alarm[0] = 1;
}
